<?php

namespace App\Controller;
use App\Repository\CategoriesRepository;
use App\Entity\Categories;
use App\Entity\Products;
use App\Repository\ProductsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;


#[Route('/categories', name: 'categories_')]
final class CategorieController extends AbstractController
{
    #[Route('/{slug}', name: 'list')]
    public function list(CategoriesRepository $catRepository,$slug,ProductsRepository $productRepository,Request $request): Response
    {

       $page = $request->query->getInt('page',1);
$category = $catRepository->findOneBy(['slug'=>$slug]);

//$products = $category->getProducts();
$products = $productRepository->findProductsPaginated($page,$slug,2);



        return $this->render('categories/list.html.twig',compact('category','products')
        );
    }

    
}
