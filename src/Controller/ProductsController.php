<?php

namespace App\Controller;

use App\Entity\Products;
use App\Repository\ProductsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use App\Repository\ImagesRepository;


#[Route('/products', name: 'products_')]
final class ProductsController extends AbstractController
{
    #[Route('/', name: 'index')]
    public function index(): Response
    {
        return $this->render('products/index.html.twig', [
            'controller_name' => 'listes des produits',
        ]);
    }

    #[Route('/{slug}/', name: 'details')]


    public function details(ProductsRepository $prodRepository,$slug):Response
    {
    $produit = $prodRepository->findOneBy(['slug'=>$slug]);
       $tabImage = $produit->getImages();

       
        return $this->render('products/details.html.twig', [
            'produits' => $produit,
            'tabImages'=> $tabImage,
        ]);

    }

    #[Route('/delete/', name: 'delete')]
    public function deleteProduit(){

        return $this->render('products/delete.html.twig', [
            'controller_name' => 'Delete',
        ]);
    }


    #[Route('/add/', name: 'new')]
    public function addProduit(){

        return $this->render('products/new.html.twig', [
            'controller_name' => 'Ajouter',
        ]);
    }


    #[Route('/update/', name: 'update')]
    public function updateProduit(){
        return $this->render('products/update.html.twig', [
            'controller_name' => 'Modifier',
        ]);

    }

}
