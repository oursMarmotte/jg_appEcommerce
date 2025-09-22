<?php
namespace App\Controller\Admin;

use App\Entity\Products;
use App\Entity\Images;
use App\Repository\ImagesRepository;
use App\Form\ProductsFormType;
use App\Repository\ProductsRepository;
use App\Service\PictureService;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\String\Slugger\SluggerInterface;

use function PHPUnit\Framework\throwException;

#[Route('/admin/produits',name:'admin_products_')]
class ProductsController extends AbstractController
{
    #[Route('/',name:'index')]
    public function index(ProductsRepository $productRepository):Response
    {
        $produits = $productRepository->findAll();
return $this->render('admin/products/index.html.twig',compact('produits'));
    }



  /*  #[Route('/ajout',name:'add')]
    public function add(Request $request,EntityManagerInterface $manager,SluggerInterface $sluger,PictureService $imgservice):Response
    {
        $this->denyAccessUnlessGranted('ROLE_ADMIN');

$image = new Images();
$product = new Products();
$productForm  = $this->createForm(ProductsFormType::class,$product);


 $productForm->handleRequest($request);

if($productForm->isSubmitted() && $productForm->isValid()){

    $imageFile = $productForm->get('images')->getData();


    if($imageFile){
   
        $originalName    = pathinfo($imageFile->getClientOriginalName(), PATHINFO_FILENAME);

   $safeFileName =$sluger->slug($originalName);
$newFileName = $safeFileName.'-'. uniqid().'.'.$imageFile->guessExtension();
$product->addImage($image);
$image->setName($newFileName);
try{
$imageFile->move( $this->getParameter('products_images'),$newFileName);
   
}catch(FileException $e){
throwException($e);
}





       
    

    $slug = $sluger->slug($product->getName());
    $product->setSlug($slug);
    $prix = $product->getPrice() * 100;
    
    $product->setPrice($prix);
    
    $manager->persist($product);
    
    $manager->flush();
    $this->addFlash('success','Produit ajouté avec succès');
    return $this->redirectToRoute('app_main');
    }
}




return $this->render('admin/products/add.html.twig',compact('productForm'));





    }




**/


#[Route('/ajout',name:'add')]
public function add(Request $request,EntityManagerInterface $manager,SluggerInterface $sluger,PictureService $imgservice):Response
{
    $this->denyAccessUnlessGranted('ROLE_ADMIN');



$product = new Products();
$productForm  = $this->createForm(ProductsFormType::class,$product);


$productForm->handleRequest($request);

if($productForm->isSubmitted() && $productForm->isValid()){

$imageFile = $productForm->get('images')->getData();




if($imageFile){
    
foreach ($imageFile as $image) {
    # code...
$folder = 'products';

    $nomImage = $imgservice->add($image,$folder,300,300);
    $image = new Images();
    $image->setName($nomImage);
    $product->addImage($image);

    
}
$slug = $sluger->slug($product->getName());
$product->setSlug($slug);

//$prix = $product->getPrice() * 100;
//$product->setPrice($prix);
$manager->persist($product);
$manager->flush();
$this->addFlash('success','Produit ajouté avec succès');
return $this->redirectToRoute('app_main');
}
}

return $this->render('admin/products/add.html.twig',compact('productForm'));
}






    #[Route('/edition/{id}',name:'edit')]
    public function edit($id,Request $request,EntityManagerInterface $manager,SluggerInterface $sluger,ProductsRepository $repository,PictureService $imgservice):Response
    {


        $product = $repository->findOneBy(['id'=> $id]);
        //$prix = $product->getPrice() / 100;

       // $product->setPrice($prix);


        $productForm = $this->createForm(ProductsFormType::class,$product);
        $productForm->handleRequest($request);
        if($productForm->isSubmitted()&& $productForm->isValid()){




            $imageFile = $productForm->get('images')->getData();




if($imageFile){
    
foreach ($imageFile as $image) {
    # code...
$folder = 'products';

    $nomImage = $imgservice->add($image,$folder,300,300);
    $image = new Images();
    $image->setName($nomImage);
    $product->addImage($image);

    
}








            $slug = $sluger->slug($product->getName());
            $product->setSlug($slug);

          //  $prix = $product->getPrice() * 100;

          //  $product->setPrice($prix);
            $manager->persist($product);
            $manager->flush();
            $this->addFlash('success','Produit mofifié avec succès');
            return $this->redirectToRoute('app_main');

        }
    }

    
        $this->denyAccessUnlessGranted('PRODUCT_EDIT',$product);
return $this->render('admin/products/edit.html.twig',compact('productForm','product'));
    }




       #[Route('/suppression/{id}',name:'delete')]
    public function delete($id,EntityManagerInterface $manager,ProductsRepository $productRepository,Request $request):Response
    {
        $product = new Products();
        $productBis = $productRepository->findOneBy(['id'=>$id]);

        
    $productForm =    $this->createForm(ProductsFormType::class,$product);

   $productForm->handleRequest($request);

   if($productForm->isSubmitted() && $productForm->isValid()){

    $manager->remove($product);
    $manager->flush();
   }

        $this->denyAccessUnlessGranted('PRODUCT_DELETE',$product);
return $this->render('admin/products/index.html.twig');
    }



    
    #[Route('/suppression/image/{id}',name:'delete_image',methods:['DELETE'])]
    public function deleteImage($id,Images $image,Request $request,EntityManagerInterface $manager,ProductsRepository $productRepository,PictureService $picturesService):JsonResponse
    {
        

       
        $data = json_decode($request->getContent(),true);

    
        
        if($this->isCsrfTokenValid('delete' . $image->getId(),$data['_token'])){
            

           $nom  = $image->getName(); 
   
           if($picturesService->delete($nom, 'products',300,300)){
        
            //suppression de l'image de la base de donnée
$manager->remove($image);
$manager->flush();

return new JsonResponse(['success'=> true],200);
           }
           //echec suppression
           return new JsonResponse(['error'=> 'Erreur de suppression'],400);

        }
        
        return new JsonResponse(['error'=>'Token invalide'],400);
   
    }


}