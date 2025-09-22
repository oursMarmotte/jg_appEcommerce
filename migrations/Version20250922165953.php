<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250922165953 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE orders DROP FOREIGN KEY FK_E52FFDEE97C86FA4');
        $this->addSql('ALTER TABLE imagecategorie DROP FOREIGN KEY FK_E84D1DFCBCF5E72D');
        $this->addSql('ALTER TABLE recap_details DROP FOREIGN KEY FK_1D1FD69F65E9B0F');
        $this->addSql('DROP TABLE imagecategorie');
        $this->addSql('DROP TABLE recap_details');
        $this->addSql('DROP TABLE transporteur');
        $this->addSql('DROP TABLE transpoter');
        $this->addSql('DROP INDEX IDX_E52FFDEE97C86FA4 ON orders');
        $this->addSql('ALTER TABLE orders DROP transporteur_id, DROP is_paid, DROP is_delivered, DROP method, DROP stripe_session_id, DROP paypal_order_id, DROP delivery');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE imagecategorie (id INT AUTO_INCREMENT NOT NULL, categorie_id INT DEFAULT NULL, name VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_E84D1DFCBCF5E72D (categorie_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE recap_details (id INT AUTO_INCREMENT NOT NULL, order_product_id INT NOT NULL, quantity INT NOT NULL, product VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, price DOUBLE PRECISION NOT NULL, total_recap DOUBLE PRECISION NOT NULL, INDEX IDX_1D1FD69F65E9B0F (order_product_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE transporteur (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('CREATE TABLE transpoter (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, content LONGTEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_unicode_ci`, price DOUBLE PRECISION NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB COMMENT = \'\' ');
        $this->addSql('ALTER TABLE imagecategorie ADD CONSTRAINT FK_E84D1DFCBCF5E72D FOREIGN KEY (categorie_id) REFERENCES categories (id)');
        $this->addSql('ALTER TABLE recap_details ADD CONSTRAINT FK_1D1FD69F65E9B0F FOREIGN KEY (order_product_id) REFERENCES orders (id)');
        $this->addSql('ALTER TABLE orders ADD transporteur_id INT DEFAULT NULL, ADD is_paid TINYINT(1) NOT NULL, ADD is_delivered TINYINT(1) DEFAULT NULL, ADD method VARCHAR(255) NOT NULL, ADD stripe_session_id VARCHAR(255) DEFAULT NULL, ADD paypal_order_id VARCHAR(255) DEFAULT NULL, ADD delivery LONGTEXT NOT NULL');
        $this->addSql('ALTER TABLE orders ADD CONSTRAINT FK_E52FFDEE97C86FA4 FOREIGN KEY (transporteur_id) REFERENCES transpoter (id)');
        $this->addSql('CREATE INDEX IDX_E52FFDEE97C86FA4 ON orders (transporteur_id)');
    }
}
