<?php

namespace App\Form;

use App\Entity\Categories;
use App\Entity\Images;
use App\Entity\Products;
use App\Repository\CategoriesRepository;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Constraints\All;
use Symfony\Component\Validator\Constraints\Image;
use Symfony\Component\Validator\Constraints\Positive;
use Webmozart\Assert\Assert as AssertAssert;

class ProductsFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name',options:[
                'label'=>'Nom'
            ])
            ->add('description',options:[
                'label'=>'Description'
            ])
            ->add('price',MoneyType::class,options:[
                'label'=>'Prix',
                'divisor'=>100,
                'constraints'=>[
                    new Positive(
                        message:'Le prix ne peut etre negatif'
                    )

                ]
            ])
            ->add('stock',options:[
                'label'=>'unitées en stock'
            ])

            ->add('images',FileType::class,[
                'label'=>'Télécharger',
                'multiple' => true,
                'mapped'=>false,
                'required'=>'false',
                'constraints'=>[

                    
new All(

    new Assert\Image([ 
        'maxSize' => '5M',
        'mimeTypes' => [
            'image/jpeg',
            'image/png',
        ],
        'maxSizeMessage'=>'l\'image ne peut depasser 5 mo',
        'mimeTypesMessage' => 'Veuillez télécharger une image au format JPEG ou PNG.',

        'minWidth' => 200,
        'maxWidth' => 1200,
        'minHeight' => 200,
        'maxHeight' => 800,
         'maxWidthMessage'=>'L\'image ne peut depasser 1200px'
    ]                 
  )              

)

                     
                ]
                
                
                            ])
                    

            ->add('categories', EntityType::class, [
                'class' => Categories::class,
                'choice_label' => 'name',
                'label'=>'Choix de catégorie',
                'group_by'=>'parent.name',
                'query_builder'=> function(CategoriesRepository $cr){
                    return $cr->createQueryBuilder('c')
                    ->where('c.parent IS NOT NULL')
                    ->orderBy('c.name','ASC');
                }

            ]);
 
            }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Products::class,
        ]);
    }
}
