<?php

namespace App\Controller;

use App\Repository\ProductsRepository;
use SessionIdInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/cart',name:'cart_')]
class CartController extends AbstractController
{

    #[Route('/',name:'index')]
    public function index(SessionInterface $session,ProductsRepository $produit):Response
    {

        $panier = $session->get('panier',[]);
        
        //initialisation variables
        $data = [];
       $total= 0;

       // $prod=  $produit->findOneBy(['id'=>25]);

    



        foreach($panier as $id => $quantity){
            
            $product = $produit->findOneBy(['id'=>$id]);

            $data[] =[
                'product'=>$product,
                'quantity' => $quantity
            ];
            
           $total += $product->getPrice() * $quantity;
        }

      


return $this->render('cart/index.html.twig',[
'data' => $data,
'total' => $total,

]);
    }





#[Route('/add/{id}', name: 'add')]
public function add($id, SessionInterface $session, ProductsRepository $product):Response
{

    //recupere panier existant

    $panier = $session->get('panier',[]);
    
    
    if(empty($panier[$id])){
        $panier[$id] = 1;
    }else{
        $panier[$id]++;
    }

   
    $session->set('panier',$panier);
   return  $this->redirectToRoute('cart_index');

}






#[Route('/remove/{id}', name: 'remove')]
public function delete($id, SessionInterface $session, ProductsRepository $product):Response
{

    //recupere panier existant

    $panier = $session->get('panier',[]);
    //retirer produit du pannier si 1 exemplaire
    //sinon décrementer
    
    if(!empty($panier[$id])){
      if($panier[$id] > 1){
        $panier[$id]--;
      }else{
        unset($panier[$id]);
      }
    }

   
    $session->set('panier',$panier);
   return  $this->redirectToRoute('cart_index');

}





#[Route('/delete/{id}', name: 'delete')]
public function del($id, SessionInterface $session, ProductsRepository $product):Response
{

    //recupere panier existant

    $panier = $session->get('panier',[]);
    //retirer produit du pannier si 1 exemplaire
    //sinon décrementer
    
    if(!empty($panier[$id])){
     
        unset($panier[$id]);
      
    }

   
    $session->set('panier',$panier);
   return  $this->redirectToRoute('cart_index');

}

#[Route('/empty', name:'empty')]
public function empty(SessionInterface $session):Response
{


$session->remove('panier');

return $this->redirectToRoute('cart_index');
}


}