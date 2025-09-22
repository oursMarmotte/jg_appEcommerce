<?php

namespace App\DataFixtures;

use App\Entity\User;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\String\Slugger\SluggerInterface;
use Faker\Factory;



class UsersFixtures extends Fixture
{


    public function __construct(
        private UserPasswordHasherInterface $passwordEncoder,
        private SluggerInterface $slugger,


    )
    {
        
    }

    public function load(ObjectManager $manager): void
    {
        $admin = new User();
        $admin->setEmail('admin@demo.fr');
        $admin->setLastname('Gambier');
        $admin->setFirstname('Benoit');
        $admin->setAddress('12 rue des sots');
        $admin->setZipcode('75');
        $admin->setCity('Paris');
        $admin->setPassword(
            $this->passwordEncoder->hashPassword($admin,'admin')
        );
        $admin->setRoles(['ROLE_ADMIN']);
        $manager->persist($admin);


$faker = Factory::create('fr_FR');


       for($usr = 1; $usr <= 5 ; $usr++) {


        $user = new User();
        $user->setEmail($faker->email);
        $user->setLastname($faker->lastName());
        $user->setFirstname($faker->firstName());
        $user->setAddress($faker->streetAddress());
        $user->setZipcode($faker->postcode());
        $user->setCity($faker->city());
        $user->setRoles(['ROLE_USER']);
        $user->setPassword(
            $this->passwordEncoder->hashPassword($admin,'secret')
        );

       
        $manager->persist($user);
    }

    $manager->flush();
}


}