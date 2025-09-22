<?php

namespace App\Controller;

use App\Entity\Orders;
use App\Entity\OrdersDetails;
use App\Repository\ProductsRepository;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Attribute\Route;


#[Route('/commandes', name: 'app_orders_')]
final class OrdersController extends AbstractController
{
   
    #[Route('/ajout',name:'add')]
    public function add(SessionInterface $session, ProductsRepository $productRepository,EntityManagerInterface $manager): Response
    {

        $this->denyAccessUnlessGranted('ROLE_USER');

$panier = $session->get('panier',[]);
if($panier === []){
    $this->addFlash('message','votre panier est vide');
  return  $this->redirectToRoute('app_main');
}

//le panier n'est pas vide création commande
$order = new Orders();

//remplir la commande
$order->setUsers($this->getUser());
$order->setReference(date('d M Y H:i:s').':'.uniqid());

foreach ($panier as $item => $quantity ){
$orderDetails = new OrdersDetails();
// on vas chercher le produit
$product = $productRepository->find($item);

    $price = $product->getPrice();
//création détail de la commande
$orderDetails->setProducts($product);
$orderDetails->setPrice($price);
$orderDetails->setQuantity($quantity);
$order->addOrdersDetail($orderDetails);



}
    //persist et flush
    
    $manager->persist($order);
    $manager->flush();
    $session->remove('panier');
    $this->addFlash('message','Commande créer avec sucess');
      return  $this->redirectToRoute('app_main');
    }
}
