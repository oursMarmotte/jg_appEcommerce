<?php
namespace App\Security\Voter;
use App\Entity\Products;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Authorization\Voter\Voter;
use Symfony\Component\Security\Core\User\UserInterface;

use function PHPUnit\Framework\returnSelf;

class ProductsVoter extends Voter
{

const EDIT = 'PRODUCT_EDIT';
const DELETE = 'PRODUCT_DELETE';
private $security;

public function __construct(Security $security) {
    $this->security = $security;
}

protected function supports(string $attribute,$product):bool
{
if(!in_array($attribute,[self::EDIT,self::DELETE])){
    return false;
}

if(! $product instanceof Products){
    return false;
}

return true;

}


protected function voteOnAttribute($attribute, $product, TokenInterface $token):bool
{

    //recupere l'utilisateur a partir du token

    $user = $token->getUser();

    //verifie que l'utilisateur est connecté
    //verifie utilisateur est ADMIN
if(!$user instanceof UserInterface) return false;

    if( $this->security->isGranted('ROLE_ADMIN'))return true;
    
    
//verifie les permissions
switch ($attribute) {
    case self::EDIT:
        # code...verifie utilisateur peut editer
        return $this->canEdit();
        break;
    case self::DELETE:
            # code...verifie utilisateur peut supprimer
            return $this->canDelete();
            break;
    default:
        # code...
        break;
}

}

protected function canEdit(){
return $this->security->isGranted('ROLE_PRODUCT_ADMIN');

}


protected function canDelete(){
    return $this->security->isGranted('ROLE_PRODUCT_ADMIN');
    
    }

}