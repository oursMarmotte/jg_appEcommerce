<?php

namespace App\Controller\Admin;

use App\Repository\CategoriesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route("/admin/categories",name:"admin_categories_")]
class CategoriesController extends AbstractController
{

    #[Route('/',name:'index')]
public function index(CategoriesRepository $categoryRepository):Response
{

   $categories=  $categoryRepository->findBy([],['categoryOrder'=>'ASC']);
return $this->render('admin/categories/index.html.twig',compact('categories'));
}

}