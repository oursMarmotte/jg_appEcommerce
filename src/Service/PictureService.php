<?php

namespace App\Service;
use Exception;
use Symfony\Component\DependencyInjection\ParameterBag\ParameterBagInterface;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class PictureService
{
    private $params;

    public function __construct(ParameterBagInterface $params )
    {
        $this->params = $params;
    }

    public function add(UploadedFile $picture,?string $folder='',?int $width= 250, ?int $height= 250){
        //nouvea nom
        $fichier = md5(uniqid(rand(),true)).'.webp';
//info image
        $picture_infos = getimagesize($picture);
    

        if($picture_infos == false){
            throw new Exception('Format d\'image incorrect');
        }
//check format image


switch ($picture_infos['mime']) {
    case 'image/png':
        $picturesource = imagecreatefrompng($picture);
        break;
    case 'image/jpeg':
            $picturesource = imagecreatefromjpeg($picture);
            

            break;
    case 'image/gif':
                $picturesource = imagecreatefromgif($picture);
                
                break;  
    default:
    throw new Exception('Format d\'image incorrect');
        break;
}
//recadre image
//recupere dimensions
$imageWidth = $picture_infos[0];
$imageHeight = $picture_infos[1];

switch ($imageWidth <=> $imageHeight) {
    case -1 ://portrait
        $squareSize = $imageWidth;
        $src_x = 0;
        $src_y = ($imageHeight - $squareSize) / 2;
        break;
    case 0 ://carre
            $squareSize = $imageWidth;
            $src_x = 0;
            $src_y = 0;
            break;
    case 1 ://paysage
                $squareSize = $imageWidth;
                $src_x =  ($imageWidth - $squareSize) / 2;
                $src_y =0;
                break;
    default:
        # code...
        break;
}

$resized_picture = imagecreatetruecolor($width,$height);
imagecopyresampled($resized_picture,$picturesource,0,0,$src_x,$src_y,$width,$height,$squareSize,$squareSize);

$path = $this->params->get('products_images').'/'.$folder;


//création doss destination
if(!file_exists($path.'/mini/')){
    mkdir($path.'/mini/',0755,true);
}
//stocke image dans 2 repertoire distinct

imagewebp($resized_picture, $path.'/mini/'.$width.'x'.$height .'-'. $fichier);

$picture->move($path .'/',$fichier);

return $fichier;

    }





public function delete(string $fichier, ?string $folder='',?int $width=200, ?int $height =200){

if($fichier !== 'default.webp'){
    $success = false;

    $path = $this->params->get('products_images').'/'.$folder;
    $mini = $path.'/mini/'.$width.'x'.$height .'-'. $fichier;
    
    $fichier;
    if(file_exists($mini)){
        unlink($mini);
        $success = true;
    }

    $original = $path .'/'.$fichier;

    if(file_exists($original)){
        unlink($original);
        $success = true;
    }
    return $success;
}
}



    


}

