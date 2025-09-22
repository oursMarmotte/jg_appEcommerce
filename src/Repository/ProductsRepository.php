<?php

namespace App\Repository;

use App\Entity\Products;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Tools\Pagination\Paginator;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Products>
 */
class ProductsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Products::class);
    }


    public function findProductsPaginated(int $page =1,string $slug , int $limit = 3):array
    {
$limit = abs($limit);
$result = [];

$query = $this->createQueryBuilder('p')
->join('p.categories','c')
->where("c.slug = :slug")
->setMaxResults($limit)
->setFirstResult(($page * $limit) - $limit)
->setParameter('slug',$slug);
$paginator = new Paginator($query);
$data = $paginator->getQuery()->getResult();

if(empty($data)){
return $result;

}

//calcul nb pages

$pages = ceil($paginator->count() / $limit);

//remplir tableaux
$result['data'] = $data;
$result['pages'] = $pages;
$result['page'] = $page;
$result['limit'] = $limit;

return $result;
    }




    //    /**
    //     * @return Products[] Returns an array of Products objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('p.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Products
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
