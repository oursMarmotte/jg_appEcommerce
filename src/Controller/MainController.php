<?php

namespace App\Controller;

use App\Repository\CategoriesRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class MainController extends AbstractController
{
    #[Route('/main', name: 'app_main')]
    public function index(CategoriesRepository $categoryRepository): Response
    {
        return $this->render('main/index.html.twig', [
            'categories' => $categoryRepository->findBy([],
        ['categoryOrder'=>'asc'])
        ]);
    }
}
