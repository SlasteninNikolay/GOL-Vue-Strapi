-- MySQL dump 10.13  Distrib 8.0.43, for Linux (aarch64)
--
-- Host: localhost    Database: strapi
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_permissions`
--

DROP TABLE IF EXISTS `admin_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `action_parameters` json DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `conditions` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_permissions_created_by_id_fk` (`created_by_id`),
  KEY `admin_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions`
--

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;
INSERT INTO `admin_permissions` VALUES (1,'frc63opun7kaygym05u3hh1f','plugin::upload.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.687000','2025-09-10 12:29:07.687000','2025-09-10 12:29:07.687000',NULL,NULL,NULL),(2,'m73favln5dhiwztgqxzcdqor','plugin::upload.configure-view','{}',NULL,'{}','[]','2025-09-10 12:29:07.692000','2025-09-10 12:29:07.692000','2025-09-10 12:29:07.692000',NULL,NULL,NULL),(3,'b51m21ntbds28d53z6x3rluy','plugin::upload.assets.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.697000','2025-09-10 12:29:07.697000','2025-09-10 12:29:07.697000',NULL,NULL,NULL),(4,'xk7q80kqubmj7f6adze2hll5','plugin::upload.assets.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.700000','2025-09-10 12:29:07.700000','2025-09-10 12:29:07.700000',NULL,NULL,NULL),(5,'k2pzr6oyoorf31wwv3eitkq1','plugin::upload.assets.download','{}',NULL,'{}','[]','2025-09-10 12:29:07.704000','2025-09-10 12:29:07.704000','2025-09-10 12:29:07.704000',NULL,NULL,NULL),(6,'ouyqi8llkt7nhgy31k239mcy','plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2025-09-10 12:29:07.707000','2025-09-10 12:29:07.707000','2025-09-10 12:29:07.707000',NULL,NULL,NULL),(7,'xmbq0sdj7xnwkmtxo40ebdlj','plugin::upload.read','{}',NULL,'{}','[\"admin::is-creator\"]','2025-09-10 12:29:07.711000','2025-09-10 12:29:07.711000','2025-09-10 12:29:07.711000',NULL,NULL,NULL),(8,'ukzjdufaqonp4b18lqumndyw','plugin::upload.configure-view','{}',NULL,'{}','[]','2025-09-10 12:29:07.715000','2025-09-10 12:29:07.715000','2025-09-10 12:29:07.715000',NULL,NULL,NULL),(9,'kkijq9zdrn0z37s0b5s2heuj','plugin::upload.assets.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.719000','2025-09-10 12:29:07.719000','2025-09-10 12:29:07.719000',NULL,NULL,NULL),(10,'bjbuyk0i92az6ar0zo4265hy','plugin::upload.assets.update','{}',NULL,'{}','[\"admin::is-creator\"]','2025-09-10 12:29:07.723000','2025-09-10 12:29:07.723000','2025-09-10 12:29:07.723000',NULL,NULL,NULL),(11,'g3xxa7d63np9xn6so03p8bn8','plugin::upload.assets.download','{}',NULL,'{}','[]','2025-09-10 12:29:07.726000','2025-09-10 12:29:07.726000','2025-09-10 12:29:07.726000',NULL,NULL,NULL),(12,'lol7a99il4e4n77gvm0e3atr','plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2025-09-10 12:29:07.730000','2025-09-10 12:29:07.730000','2025-09-10 12:29:07.730000',NULL,NULL,NULL),(13,'eabi7es1wlrcc5zvtex0a4sg','plugin::content-manager.explorer.create','{}','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2025-09-10 12:29:07.743000','2025-09-10 12:29:07.743000','2025-09-10 12:29:07.743000',NULL,NULL,NULL),(14,'ggmokjurqcxod20vwvznc5hw','plugin::content-manager.explorer.read','{}','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2025-09-10 12:29:07.748000','2025-09-10 12:29:07.748000','2025-09-10 12:29:07.748000',NULL,NULL,NULL),(15,'uthu98xgftfogpq6wi00e2i9','plugin::content-manager.explorer.update','{}','plugin::users-permissions.user','{\"fields\": [\"username\", \"email\", \"provider\", \"password\", \"resetPasswordToken\", \"confirmationToken\", \"confirmed\", \"blocked\", \"role\"]}','[]','2025-09-10 12:29:07.751000','2025-09-10 12:29:07.751000','2025-09-10 12:29:07.751000',NULL,NULL,NULL),(16,'k5f2d1v2zvrssiekhn9d1b9u','plugin::content-manager.explorer.delete','{}','plugin::users-permissions.user','{}','[]','2025-09-10 12:29:07.754000','2025-09-10 12:29:07.754000','2025-09-10 12:29:07.755000',NULL,NULL,NULL),(17,'xk0j9nl767neyfkghjl9cv7j','plugin::content-manager.explorer.publish','{}','plugin::users-permissions.user','{}','[]','2025-09-10 12:29:07.758000','2025-09-10 12:29:07.758000','2025-09-10 12:29:07.758000',NULL,NULL,NULL),(18,'xklgckw8gym2fyrhaneo2hsv','plugin::content-manager.single-types.configure-view','{}',NULL,'{}','[]','2025-09-10 12:29:07.761000','2025-09-10 12:29:07.761000','2025-09-10 12:29:07.761000',NULL,NULL,NULL),(19,'i3ylto6jgfk8j0a5n14j9j55','plugin::content-manager.collection-types.configure-view','{}',NULL,'{}','[]','2025-09-10 12:29:07.765000','2025-09-10 12:29:07.765000','2025-09-10 12:29:07.765000',NULL,NULL,NULL),(20,'z8fjwbaw5dni8qzcyaoxp2z0','plugin::content-manager.components.configure-layout','{}',NULL,'{}','[]','2025-09-10 12:29:07.768000','2025-09-10 12:29:07.768000','2025-09-10 12:29:07.768000',NULL,NULL,NULL),(21,'vjdvnhlzwoi8l7ymn4wvn63c','plugin::content-type-builder.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.771000','2025-09-10 12:29:07.771000','2025-09-10 12:29:07.771000',NULL,NULL,NULL),(22,'izrwufcxi0wae5e2s6hi8x4y','plugin::email.settings.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.774000','2025-09-10 12:29:07.774000','2025-09-10 12:29:07.775000',NULL,NULL,NULL),(23,'zemaj39dik00bsezze0uj0wb','plugin::upload.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.778000','2025-09-10 12:29:07.778000','2025-09-10 12:29:07.778000',NULL,NULL,NULL),(24,'atvdl8o07qj1s7lgah06sv93','plugin::upload.assets.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.781000','2025-09-10 12:29:07.781000','2025-09-10 12:29:07.781000',NULL,NULL,NULL),(25,'cv7ij2og6ydb2jfs8p9feudu','plugin::upload.assets.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.784000','2025-09-10 12:29:07.784000','2025-09-10 12:29:07.784000',NULL,NULL,NULL),(26,'wvs9oi8mwx9d5vg65tcl8wf7','plugin::upload.assets.download','{}',NULL,'{}','[]','2025-09-10 12:29:07.787000','2025-09-10 12:29:07.787000','2025-09-10 12:29:07.787000',NULL,NULL,NULL),(27,'b3d3adhss8qu71dw62ukfczs','plugin::upload.assets.copy-link','{}',NULL,'{}','[]','2025-09-10 12:29:07.791000','2025-09-10 12:29:07.791000','2025-09-10 12:29:07.791000',NULL,NULL,NULL),(28,'dnodqi9ugoapljpnx6fnpgmb','plugin::upload.configure-view','{}',NULL,'{}','[]','2025-09-10 12:29:07.793000','2025-09-10 12:29:07.793000','2025-09-10 12:29:07.794000',NULL,NULL,NULL),(29,'pjjr85mrkw5yoqa1e7ing4cu','plugin::upload.settings.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.800000','2025-09-10 12:29:07.800000','2025-09-10 12:29:07.800000',NULL,NULL,NULL),(30,'bk8yke374vmqq3sfx7fo0za2','plugin::i18n.locale.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.803000','2025-09-10 12:29:07.803000','2025-09-10 12:29:07.803000',NULL,NULL,NULL),(31,'qe546p3yd9712gpajbem3rpe','plugin::i18n.locale.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.807000','2025-09-10 12:29:07.807000','2025-09-10 12:29:07.807000',NULL,NULL,NULL),(32,'j8yu0zuk4argjd5yqjybxgl2','plugin::i18n.locale.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.810000','2025-09-10 12:29:07.810000','2025-09-10 12:29:07.810000',NULL,NULL,NULL),(33,'ysz50ctm30798eppslc9lahu','plugin::i18n.locale.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.813000','2025-09-10 12:29:07.813000','2025-09-10 12:29:07.813000',NULL,NULL,NULL),(34,'blklnruq9d74xq4d2nuhpmtm','plugin::users-permissions.roles.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.816000','2025-09-10 12:29:07.816000','2025-09-10 12:29:07.816000',NULL,NULL,NULL),(35,'k72n7kgp08oirzpzh4wwdwg2','plugin::users-permissions.roles.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.820000','2025-09-10 12:29:07.820000','2025-09-10 12:29:07.820000',NULL,NULL,NULL),(36,'cdff60i90k8hconivollqzra','plugin::users-permissions.roles.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.823000','2025-09-10 12:29:07.823000','2025-09-10 12:29:07.823000',NULL,NULL,NULL),(37,'dk3qh0jxlgcsgcnql0bo8e2a','plugin::users-permissions.roles.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.826000','2025-09-10 12:29:07.826000','2025-09-10 12:29:07.826000',NULL,NULL,NULL),(38,'l7awym31pumfztcvu0lb0njy','plugin::users-permissions.providers.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.830000','2025-09-10 12:29:07.830000','2025-09-10 12:29:07.830000',NULL,NULL,NULL),(39,'lppp0y0bd5f0tychd3r3vtoz','plugin::users-permissions.providers.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.833000','2025-09-10 12:29:07.833000','2025-09-10 12:29:07.833000',NULL,NULL,NULL),(40,'s8ia88xjf63fjzfhwl888gdq','plugin::users-permissions.email-templates.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.836000','2025-09-10 12:29:07.836000','2025-09-10 12:29:07.836000',NULL,NULL,NULL),(41,'gz28u6xaxtt74vovz9dog8ok','plugin::users-permissions.email-templates.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.840000','2025-09-10 12:29:07.840000','2025-09-10 12:29:07.840000',NULL,NULL,NULL),(42,'f194spwj0j3rnjgs5xj1rf5l','plugin::users-permissions.advanced-settings.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.843000','2025-09-10 12:29:07.843000','2025-09-10 12:29:07.843000',NULL,NULL,NULL),(43,'c33fg67h30ji6l510nq76vbg','plugin::users-permissions.advanced-settings.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.846000','2025-09-10 12:29:07.846000','2025-09-10 12:29:07.846000',NULL,NULL,NULL),(44,'cvyaskxii66eozrkij9s5s76','admin::marketplace.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.850000','2025-09-10 12:29:07.850000','2025-09-10 12:29:07.850000',NULL,NULL,NULL),(45,'adum08uxq51gs263uzcl6kl9','admin::webhooks.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.853000','2025-09-10 12:29:07.853000','2025-09-10 12:29:07.853000',NULL,NULL,NULL),(46,'d51ltb8eqbnpk3d65stumojs','admin::webhooks.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.855000','2025-09-10 12:29:07.855000','2025-09-10 12:29:07.855000',NULL,NULL,NULL),(47,'n68ojkhuy58awxyd4ph0v12o','admin::webhooks.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.859000','2025-09-10 12:29:07.859000','2025-09-10 12:29:07.859000',NULL,NULL,NULL),(48,'dm011gz5ra1jjtq0hp5uv3b5','admin::webhooks.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.862000','2025-09-10 12:29:07.862000','2025-09-10 12:29:07.862000',NULL,NULL,NULL),(49,'j6xmo46fbegxydv1n6ldc452','admin::users.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.865000','2025-09-10 12:29:07.865000','2025-09-10 12:29:07.865000',NULL,NULL,NULL),(50,'ouh5nqcy1kfr0yek6v4d9gl5','admin::users.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.868000','2025-09-10 12:29:07.868000','2025-09-10 12:29:07.868000',NULL,NULL,NULL),(51,'tx1ipm1ljou964ifaftaz90j','admin::users.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.871000','2025-09-10 12:29:07.871000','2025-09-10 12:29:07.871000',NULL,NULL,NULL),(52,'j8euoxp7fhkk5d65bwyzr50k','admin::users.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.874000','2025-09-10 12:29:07.874000','2025-09-10 12:29:07.874000',NULL,NULL,NULL),(53,'d8gdvht2gx8u7r9v0trnqxaf','admin::roles.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.877000','2025-09-10 12:29:07.877000','2025-09-10 12:29:07.877000',NULL,NULL,NULL),(54,'n0x0l4mrgcaokpyjnbtzuhv5','admin::roles.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.880000','2025-09-10 12:29:07.880000','2025-09-10 12:29:07.880000',NULL,NULL,NULL),(55,'fm157qm20lgv8243nnwyiir8','admin::roles.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.883000','2025-09-10 12:29:07.883000','2025-09-10 12:29:07.883000',NULL,NULL,NULL),(56,'il4cw4md9i7kx8sw872yfiih','admin::roles.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.886000','2025-09-10 12:29:07.886000','2025-09-10 12:29:07.886000',NULL,NULL,NULL),(57,'lr9fmnzz88nem8hp5g7go1zp','admin::api-tokens.access','{}',NULL,'{}','[]','2025-09-10 12:29:07.889000','2025-09-10 12:29:07.889000','2025-09-10 12:29:07.889000',NULL,NULL,NULL),(58,'pa2wdqtu5pnhdfol0l7m2gyv','admin::api-tokens.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.892000','2025-09-10 12:29:07.892000','2025-09-10 12:29:07.892000',NULL,NULL,NULL),(59,'o5vbxdi3cvmrpw47tccw9u5l','admin::api-tokens.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.895000','2025-09-10 12:29:07.895000','2025-09-10 12:29:07.895000',NULL,NULL,NULL),(60,'x879vcwyetndbfkwfqelqygl','admin::api-tokens.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.898000','2025-09-10 12:29:07.898000','2025-09-10 12:29:07.898000',NULL,NULL,NULL),(61,'k5rhc6ehc72agclsygujq9uo','admin::api-tokens.regenerate','{}',NULL,'{}','[]','2025-09-10 12:29:07.901000','2025-09-10 12:29:07.901000','2025-09-10 12:29:07.901000',NULL,NULL,NULL),(62,'ngi4a15h7n13l8jj06ouofxl','admin::api-tokens.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.904000','2025-09-10 12:29:07.904000','2025-09-10 12:29:07.904000',NULL,NULL,NULL),(63,'w7gc21nd0z171jevmktbvh24','admin::project-settings.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.907000','2025-09-10 12:29:07.907000','2025-09-10 12:29:07.907000',NULL,NULL,NULL),(64,'a02xmya72evwspief9dsj1po','admin::project-settings.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.910000','2025-09-10 12:29:07.910000','2025-09-10 12:29:07.910000',NULL,NULL,NULL),(65,'bnrs4ezmztdj0biilxu76n69','admin::transfer.tokens.access','{}',NULL,'{}','[]','2025-09-10 12:29:07.913000','2025-09-10 12:29:07.913000','2025-09-10 12:29:07.913000',NULL,NULL,NULL),(66,'hqp2m1fwrhcytgupbigwtr1x','admin::transfer.tokens.create','{}',NULL,'{}','[]','2025-09-10 12:29:07.916000','2025-09-10 12:29:07.916000','2025-09-10 12:29:07.916000',NULL,NULL,NULL),(67,'a85agfk4uka3iode212f9t1d','admin::transfer.tokens.read','{}',NULL,'{}','[]','2025-09-10 12:29:07.919000','2025-09-10 12:29:07.919000','2025-09-10 12:29:07.919000',NULL,NULL,NULL),(68,'vjpo77zaimpbxmcj6j0vhuok','admin::transfer.tokens.update','{}',NULL,'{}','[]','2025-09-10 12:29:07.922000','2025-09-10 12:29:07.922000','2025-09-10 12:29:07.922000',NULL,NULL,NULL),(69,'ru6spuu589fj5584s8y1jd4g','admin::transfer.tokens.regenerate','{}',NULL,'{}','[]','2025-09-10 12:29:07.925000','2025-09-10 12:29:07.925000','2025-09-10 12:29:07.925000',NULL,NULL,NULL),(70,'h9s61hw48gk8stgp4ciseqpl','admin::transfer.tokens.delete','{}',NULL,'{}','[]','2025-09-10 12:29:07.928000','2025-09-10 12:29:07.928000','2025-09-10 12:29:07.928000',NULL,NULL,NULL),(90,'z319kej3izk952rador4mtfi','plugin::content-manager.explorer.delete','{}','api::section.section','{\"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 06:36:33.181000','2025-09-11 06:36:33.181000','2025-09-11 06:36:33.182000',NULL,NULL,NULL),(91,'r307misyjgeyeoyosa8d0nqp','plugin::content-manager.explorer.publish','{}','api::section.section','{\"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 06:36:33.188000','2025-09-11 06:36:33.188000','2025-09-11 06:36:33.188000',NULL,NULL,NULL),(98,'q7fk60quw3pqphqre82vv2za','plugin::content-manager.explorer.create','{}','api::top-menu.top-menu','{\"fields\": [\"MainMenuItems\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 07:09:55.303000','2025-09-11 07:09:55.303000','2025-09-11 07:09:55.304000',NULL,NULL,NULL),(99,'m62pzt1gt3svmtjxm56flsdh','plugin::content-manager.explorer.read','{}','api::top-menu.top-menu','{\"fields\": [\"MainMenuItems\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 07:09:55.316000','2025-09-11 07:09:55.316000','2025-09-11 07:09:55.317000',NULL,NULL,NULL),(100,'s5u7sj4y7stxuzq4wioqrgww','plugin::content-manager.explorer.update','{}','api::top-menu.top-menu','{\"fields\": [\"MainMenuItems\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 07:09:55.325000','2025-09-11 07:09:55.325000','2025-09-11 07:09:55.325000',NULL,NULL,NULL),(101,'bn4dq59cfsa964hhqzfppk70','plugin::content-manager.explorer.delete','{}','api::top-menu.top-menu','{\"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 07:09:55.331000','2025-09-11 07:09:55.331000','2025-09-11 07:09:55.332000',NULL,NULL,NULL),(102,'az71bw5lsep3ygk55prjwbk0','plugin::content-manager.explorer.publish','{}','api::top-menu.top-menu','{\"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 07:09:55.340000','2025-09-11 07:09:55.340000','2025-09-11 07:09:55.340000',NULL,NULL,NULL),(108,'ycjda3x5snwcohy2d5e5px21','plugin::content-manager.explorer.create','{}','api::section.section','{\"fields\": [\"title\", \"links.title\", \"links.url\", \"links.description\", \"links.icon\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 09:57:13.460000','2025-09-11 09:57:13.460000','2025-09-11 09:57:13.461000',NULL,NULL,NULL),(109,'q2mjan3dfqd22tue9yqbmb60','plugin::content-manager.explorer.read','{}','api::section.section','{\"fields\": [\"title\", \"links.title\", \"links.url\", \"links.description\", \"links.icon\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 09:57:13.476000','2025-09-11 09:57:13.476000','2025-09-11 09:57:13.476000',NULL,NULL,NULL),(110,'oamwipx3l232rbgjvm7g6anl','plugin::content-manager.explorer.update','{}','api::section.section','{\"fields\": [\"title\", \"links.title\", \"links.url\", \"links.description\", \"links.icon\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-11 09:57:13.491000','2025-09-11 09:57:13.491000','2025-09-11 09:57:13.491000',NULL,NULL,NULL),(116,'bduna9ishnnacb4sejp3afq6','plugin::content-manager.explorer.create','{}','api::page.page','{\"fields\": [\"title\", \"slug\", \"SEO.metaTitle\", \"SEO.metaDescription\", \"SEO.metaField\", \"SEO.preventIndexing\", \"SEO.structuredData\", \"SEO.metaImage\", \"block\", \"publish_at\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-16 09:42:22.106000','2025-09-16 09:42:22.106000','2025-09-16 09:42:22.107000',NULL,NULL,NULL),(117,'cr8o1gbn03jbwldkc4z3ddt2','plugin::content-manager.explorer.read','{}','api::page.page','{\"fields\": [\"title\", \"slug\", \"SEO.metaTitle\", \"SEO.metaDescription\", \"SEO.metaField\", \"SEO.preventIndexing\", \"SEO.structuredData\", \"SEO.metaImage\", \"block\", \"publish_at\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-16 09:42:22.119000','2025-09-16 09:42:22.119000','2025-09-16 09:42:22.119000',NULL,NULL,NULL),(118,'ir5eyiteeeve9apg2dqg3w74','plugin::content-manager.explorer.update','{}','api::page.page','{\"fields\": [\"title\", \"slug\", \"SEO.metaTitle\", \"SEO.metaDescription\", \"SEO.metaField\", \"SEO.preventIndexing\", \"SEO.structuredData\", \"SEO.metaImage\", \"block\", \"publish_at\"], \"locales\": [\"en\", \"ru\"]}','[]','2025-09-16 09:42:22.126000','2025-09-16 09:42:22.126000','2025-09-16 09:42:22.127000',NULL,NULL,NULL),(119,'eaikfeplq9burzq9i8gn2k46','plugin::content-manager.explorer.delete','{}','api::page.page','{\"locales\": [\"en\", \"ru\"]}','[]','2025-09-16 09:42:22.133000','2025-09-16 09:42:22.133000','2025-09-16 09:42:22.134000',NULL,NULL,NULL),(120,'ja05f8baivljxivzs8lmnjgl','plugin::content-manager.explorer.publish','{}','api::page.page','{\"locales\": [\"en\", \"ru\"]}','[]','2025-09-16 09:42:22.149000','2025-09-16 09:42:22.149000','2025-09-16 09:42:22.150000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_permissions_role_lnk`
--

DROP TABLE IF EXISTS `admin_permissions_role_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_permissions_role_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  KEY `admin_permissions_role_lnk_fk` (`permission_id`),
  KEY `admin_permissions_role_lnk_ifk` (`role_id`),
  KEY `admin_permissions_role_lnk_oifk` (`permission_ord`),
  CONSTRAINT `admin_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_permissions_role_lnk`
--

LOCK TABLES `admin_permissions_role_lnk` WRITE;
/*!40000 ALTER TABLE `admin_permissions_role_lnk` DISABLE KEYS */;
INSERT INTO `admin_permissions_role_lnk` VALUES (1,1,2,1),(2,2,2,2),(3,3,2,3),(4,4,2,4),(5,5,2,5),(6,6,2,6),(7,7,3,1),(8,8,3,2),(9,9,3,3),(10,10,3,4),(11,11,3,5),(12,12,3,6),(13,13,1,1),(14,14,1,2),(15,15,1,3),(16,16,1,4),(17,17,1,5),(18,18,1,6),(19,19,1,7),(20,20,1,8),(21,21,1,9),(22,22,1,10),(23,23,1,11),(24,24,1,12),(25,25,1,13),(26,26,1,14),(27,27,1,15),(28,28,1,16),(29,29,1,17),(30,30,1,18),(31,31,1,19),(32,32,1,20),(33,33,1,21),(34,34,1,22),(35,35,1,23),(36,36,1,24),(37,37,1,25),(38,38,1,26),(39,39,1,27),(40,40,1,28),(41,41,1,29),(42,42,1,30),(43,43,1,31),(44,44,1,32),(45,45,1,33),(46,46,1,34),(47,47,1,35),(48,48,1,36),(49,49,1,37),(50,50,1,38),(51,51,1,39),(52,52,1,40),(53,53,1,41),(54,54,1,42),(55,55,1,43),(56,56,1,44),(57,57,1,45),(58,58,1,46),(59,59,1,47),(60,60,1,48),(61,61,1,49),(62,62,1,50),(63,63,1,51),(64,64,1,52),(65,65,1,53),(66,66,1,54),(67,67,1,55),(68,68,1,56),(69,69,1,57),(70,70,1,58),(90,90,1,62),(91,91,1,63),(98,98,1,67),(99,99,1,68),(100,100,1,69),(101,101,1,70),(102,102,1,71),(108,108,1,77),(109,109,1,78),(110,110,1,79),(116,116,1,80),(117,117,1,81),(118,118,1,82),(119,119,1,83),(120,120,1,84);
/*!40000 ALTER TABLE `admin_permissions_role_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_roles`
--

DROP TABLE IF EXISTS `admin_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_roles_created_by_id_fk` (`created_by_id`),
  KEY `admin_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_roles`
--

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;
INSERT INTO `admin_roles` VALUES (1,'nvdemcscrn3nfmd702kilc6d','Super Admin','strapi-super-admin','Super Admins can access and manage all features and settings.','2025-09-10 12:29:07.677000','2025-09-10 12:29:07.677000','2025-09-10 12:29:07.677000',NULL,NULL,NULL),(2,'so1etacb4ceqqmb72oux3lrf','Editor','strapi-editor','Editors can manage and publish contents including those of other users.','2025-09-10 12:29:07.682000','2025-09-10 12:29:07.682000','2025-09-10 12:29:07.682000',NULL,NULL,NULL),(3,'zed033x52v64bf82337uxzlb','Author','strapi-author','Authors can manage the content they have created.','2025-09-10 12:29:07.684000','2025-09-10 12:29:07.684000','2025-09-10 12:29:07.685000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `registration_token` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `prefered_language` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_users_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `admin_users_created_by_id_fk` (`created_by_id`),
  KEY `admin_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `admin_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `admin_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'o7kqd3m5d38h12mk7fgz2tqq','Nikolas',NULL,NULL,'slastenindev@gmail.com','$2a$10$KpJbeBQ3e3GTttQkR0ork.s7sqbMQRG1XvBBBB/nBeCaVJCXZDqLS',NULL,NULL,1,0,NULL,'2025-09-10 12:29:54.542000','2025-09-10 12:29:54.542000','2025-09-10 12:29:54.542000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users_roles_lnk`
--

DROP TABLE IF EXISTS `admin_users_roles_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users_roles_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `role_ord` double unsigned DEFAULT NULL,
  `user_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_roles_lnk_uq` (`user_id`,`role_id`),
  KEY `admin_users_roles_lnk_fk` (`user_id`),
  KEY `admin_users_roles_lnk_ifk` (`role_id`),
  KEY `admin_users_roles_lnk_ofk` (`role_ord`),
  KEY `admin_users_roles_lnk_oifk` (`user_ord`),
  CONSTRAINT `admin_users_roles_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_users_roles_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `admin_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users_roles_lnk`
--

LOCK TABLES `admin_users_roles_lnk` WRITE;
/*!40000 ALTER TABLE `admin_users_roles_lnk` DISABLE KEYS */;
INSERT INTO `admin_users_roles_lnk` VALUES (1,1,1,1,1);
/*!40000 ALTER TABLE `admin_users_roles_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_knopka`
--

DROP TABLE IF EXISTS `components_menu_knopka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_knopka` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_knopka`
--

LOCK TABLES `components_menu_knopka` WRITE;
/*!40000 ALTER TABLE `components_menu_knopka` DISABLE KEYS */;
INSERT INTO `components_menu_knopka` VALUES (1,'+7 (999) 999-99-99','tel:+79999999999','secondary'),(12,'+7 (999) 999-99-99','tel:+79999999999','secondary');
/*!40000 ALTER TABLE `components_menu_knopka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_logos`
--

DROP TABLE IF EXISTS `components_menu_logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_logos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_logos`
--

LOCK TABLES `components_menu_logos` WRITE;
/*!40000 ALTER TABLE `components_menu_logos` DISABLE KEYS */;
INSERT INTO `components_menu_logos` VALUES (3),(6);
/*!40000 ALTER TABLE `components_menu_logos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_punkt_menyu`
--

DROP TABLE IF EXISTS `components_menu_punkt_menyu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_punkt_menyu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_punkt_menyu`
--

LOCK TABLES `components_menu_punkt_menyu` WRITE;
/*!40000 ALTER TABLE `components_menu_punkt_menyu` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_menu_punkt_menyu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_ssylka`
--

DROP TABLE IF EXISTS `components_menu_ssylka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_ssylka` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `description` longtext,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_ssylka`
--

LOCK TABLES `components_menu_ssylka` WRITE;
/*!40000 ALTER TABLE `components_menu_ssylka` DISABLE KEYS */;
INSERT INTO `components_menu_ssylka` VALUES (5,'/services',NULL,NULL),(6,'/services',NULL,NULL),(7,'/about',NULL,'О нас'),(12,'/rooms',NULL,'Проживание'),(13,'/contacts',NULL,'Контакты'),(20,'/docs',NULL,'Документы'),(37,'/infrastructure',NULL,'Инфраструктура'),(38,'/nutrition',NULL,'Питание'),(39,'/safety',NULL,'Безопасность'),(40,'/medicine',NULL,'Медицина'),(41,'/about',NULL,'О нас'),(42,'/infrastructure',NULL,'Инфраструктура'),(43,'/docs',NULL,'Документы'),(44,'/nutrition',NULL,'Питание'),(45,'/safety',NULL,'Безопасность'),(46,'/medicine',NULL,'Медицина'),(47,'/events',NULL,'Мероприятия'),(68,'/rooms',NULL,'Проживание'),(69,'/events',NULL,'Мероприятия'),(70,'/contacts',NULL,'Контакты');
/*!40000 ALTER TABLE `components_menu_ssylka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_vypadayushhee_menyu`
--

DROP TABLE IF EXISTS `components_menu_vypadayushhee_menyu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_vypadayushhee_menyu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_vypadayushhee_menyu`
--

LOCK TABLES `components_menu_vypadayushhee_menyu` WRITE;
/*!40000 ALTER TABLE `components_menu_vypadayushhee_menyu` DISABLE KEYS */;
INSERT INTO `components_menu_vypadayushhee_menyu` VALUES (1,'О лагере'),(20,'О лагере');
/*!40000 ALTER TABLE `components_menu_vypadayushhee_menyu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_menu_vypadayushhee_menyu_sections_lnk`
--

DROP TABLE IF EXISTS `components_menu_vypadayushhee_menyu_sections_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_menu_vypadayushhee_menyu_sections_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `vypadayushhee_menyu_id` int unsigned DEFAULT NULL,
  `section_id` int unsigned DEFAULT NULL,
  `section_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_menu_vypadayushhee_menyu_sections_lnk_uq` (`vypadayushhee_menyu_id`,`section_id`),
  KEY `components_menu_vypadayushhee_menyu_sections_lnk_fk` (`vypadayushhee_menyu_id`),
  KEY `components_menu_vypadayushhee_menyu_sections_lnk_ifk` (`section_id`),
  KEY `components_menu_vypadayushhee_menyu_sections_lnk_ofk` (`section_ord`),
  CONSTRAINT `components_menu_vypadayushhee_menyu_sections_lnk_fk` FOREIGN KEY (`vypadayushhee_menyu_id`) REFERENCES `components_menu_vypadayushhee_menyu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `components_menu_vypadayushhee_menyu_sections_lnk_ifk` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_menu_vypadayushhee_menyu_sections_lnk`
--

LOCK TABLES `components_menu_vypadayushhee_menyu_sections_lnk` WRITE;
/*!40000 ALTER TABLE `components_menu_vypadayushhee_menyu_sections_lnk` DISABLE KEYS */;
INSERT INTO `components_menu_vypadayushhee_menyu_sections_lnk` VALUES (1,1,9,0),(7,1,15,0),(21,20,15,1);
/*!40000 ALTER TABLE `components_menu_vypadayushhee_menyu_sections_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_info_blok`
--

DROP TABLE IF EXISTS `components_page_info_blok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_info_blok` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` json DEFAULT NULL,
  `is_video` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_info_blok`
--

LOCK TABLES `components_page_info_blok` WRITE;
/*!40000 ALTER TABLE `components_page_info_blok` DISABLE KEYS */;
INSERT INTO `components_page_info_blok` VALUES (1,'[{\"type\": \"paragraph\", \"children\": [{\"bold\": true, \"text\": \"Небольшой текст\", \"type\": \"text\"}, {\"text\": \" который  описывает расположение турбазы, номера, кафе расположенные на территории и основные услуги.\", \"type\": \"text\"}]}, {\"type\": \"paragraph\", \"children\": [{\"bold\": true, \"text\": \"Небольшой текст\", \"type\": \"text\"}, {\"text\": \" который  описывает расположение турбазы, номера, \", \"type\": \"text\"}, {\"bold\": true, \"text\": \"кафе\", \"type\": \"text\"}, {\"text\": \" расположенные на территории и основные услуги.\", \"type\": \"text\"}]}]',NULL),(2,'[{\"type\": \"paragraph\", \"children\": [{\"bold\": true, \"text\": \"Небольшой текст\", \"type\": \"text\"}, {\"text\": \" который  описывает расположение турбазы, номера, кафе расположенные на территории и основные услуги.\", \"type\": \"text\"}]}, {\"type\": \"paragraph\", \"children\": [{\"bold\": true, \"text\": \"Небольшой текст\", \"type\": \"text\"}, {\"text\": \" который  описывает расположение турбазы, номера, \", \"type\": \"text\"}, {\"bold\": true, \"text\": \"кафе\", \"type\": \"text\"}, {\"text\": \" расположенные на территории и основные услуги.\", \"type\": \"text\"}]}]',NULL);
/*!40000 ALTER TABLE `components_page_info_blok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_info_blok_cmps`
--

DROP TABLE IF EXISTS `components_page_info_blok_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_info_blok_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_page_info_blok_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_page_info_blok_field_idx` (`field`),
  KEY `components_page_info_blok_component_type_idx` (`component_type`),
  KEY `components_page_info_blok_entity_fk` (`entity_id`),
  CONSTRAINT `components_page_info_blok_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_page_info_blok` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_info_blok_cmps`
--

LOCK TABLES `components_page_info_blok_cmps` WRITE;
/*!40000 ALTER TABLE `components_page_info_blok_cmps` DISABLE KEYS */;
INSERT INTO `components_page_info_blok_cmps` VALUES (1,1,16,'page.zagolovok','header',NULL),(2,2,18,'page.zagolovok','header',NULL);
/*!40000 ALTER TABLE `components_page_info_blok_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_knopki`
--

DROP TABLE IF EXISTS `components_page_knopki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_knopki` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_knopki`
--

LOCK TABLES `components_page_knopki` WRITE;
/*!40000 ALTER TABLE `components_page_knopki` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_page_knopki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_knopki_cmps`
--

DROP TABLE IF EXISTS `components_page_knopki_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_knopki_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_page_knopki_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_page_knopki_field_idx` (`field`),
  KEY `components_page_knopki_component_type_idx` (`component_type`),
  KEY `components_page_knopki_entity_fk` (`entity_id`),
  CONSTRAINT `components_page_knopki_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_page_knopki` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_knopki_cmps`
--

LOCK TABLES `components_page_knopki_cmps` WRITE;
/*!40000 ALTER TABLE `components_page_knopki_cmps` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_page_knopki_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_pervyj_ekran`
--

DROP TABLE IF EXISTS `components_page_pervyj_ekran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_pervyj_ekran` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `text` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_pervyj_ekran`
--

LOCK TABLES `components_page_pervyj_ekran` WRITE;
/*!40000 ALTER TABLE `components_page_pervyj_ekran` DISABLE KEYS */;
INSERT INTO `components_page_pervyj_ekran` VALUES (1,'text'),(16,'text');
/*!40000 ALTER TABLE `components_page_pervyj_ekran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_pervyj_ekran_cmps`
--

DROP TABLE IF EXISTS `components_page_pervyj_ekran_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_pervyj_ekran_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_page_pervyj_ekran_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_page_pervyj_ekran_field_idx` (`field`),
  KEY `components_page_pervyj_ekran_component_type_idx` (`component_type`),
  KEY `components_page_pervyj_ekran_entity_fk` (`entity_id`),
  CONSTRAINT `components_page_pervyj_ekran_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_page_pervyj_ekran` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_pervyj_ekran_cmps`
--

LOCK TABLES `components_page_pervyj_ekran_cmps` WRITE;
/*!40000 ALTER TABLE `components_page_pervyj_ekran_cmps` DISABLE KEYS */;
INSERT INTO `components_page_pervyj_ekran_cmps` VALUES (1,1,1,'page.zagolovok','header',1),(30,16,17,'page.zagolovok','header',NULL);
/*!40000 ALTER TABLE `components_page_pervyj_ekran_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_seos`
--

DROP TABLE IF EXISTS `components_page_seos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_seos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext,
  `prevent_indexing` tinyint(1) DEFAULT NULL,
  `structured_data` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_seos`
--

LOCK TABLES `components_page_seos` WRITE;
/*!40000 ALTER TABLE `components_page_seos` DISABLE KEYS */;
INSERT INTO `components_page_seos` VALUES (1,'Турбаза на Черном море','Турбаза на Черном море',0,NULL),(16,'Турбаза на Черном море','Турбаза на Черном море',0,NULL);
/*!40000 ALTER TABLE `components_page_seos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_seos_cmps`
--

DROP TABLE IF EXISTS `components_page_seos_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_seos_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `components_page_seos_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `components_page_seos_field_idx` (`field`),
  KEY `components_page_seos_component_type_idx` (`component_type`),
  KEY `components_page_seos_entity_fk` (`entity_id`),
  CONSTRAINT `components_page_seos_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `components_page_seos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_seos_cmps`
--

LOCK TABLES `components_page_seos_cmps` WRITE;
/*!40000 ALTER TABLE `components_page_seos_cmps` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_page_seos_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_ssylka`
--

DROP TABLE IF EXISTS `components_page_ssylka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_ssylka` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `href` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `is_external` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_ssylka`
--

LOCK TABLES `components_page_ssylka` WRITE;
/*!40000 ALTER TABLE `components_page_ssylka` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_page_ssylka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_page_zagolovok`
--

DROP TABLE IF EXISTS `components_page_zagolovok`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_page_zagolovok` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `label` longtext,
  `title` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_page_zagolovok`
--

LOCK TABLES `components_page_zagolovok` WRITE;
/*!40000 ALTER TABLE `components_page_zagolovok` DISABLE KEYS */;
INSERT INTO `components_page_zagolovok` VALUES (1,' primary','Турбаза на Черном море','Турбаза на Черном море'),(16,' primary','Мы позаботились о вашем удобстве','Мы позаботились о вашем удобстве'),(17,' primary','Турбаза на Черном море','Турбаза на Черном море'),(18,' primary','Мы позаботились о вашем удобстве','Мы позаботились о вашем удобстве');
/*!40000 ALTER TABLE `components_page_zagolovok` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components_seo_meta_fields`
--

DROP TABLE IF EXISTS `components_seo_meta_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `components_seo_meta_fields` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components_seo_meta_fields`
--

LOCK TABLES `components_seo_meta_fields` WRITE;
/*!40000 ALTER TABLE `components_seo_meta_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `components_seo_meta_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alternative_text` varchar(255) DEFAULT NULL,
  `caption` varchar(255) DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `formats` json DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `size` decimal(10,2) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `preview_url` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_metadata` json DEFAULT NULL,
  `folder_path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_files_folder_path_index` (`folder_path`),
  KEY `upload_files_created_at_index` (`created_at`),
  KEY `upload_files_updated_at_index` (`updated_at`),
  KEY `upload_files_name_index` (`name`),
  KEY `upload_files_size_index` (`size`),
  KEY `upload_files_ext_index` (`ext`),
  KEY `files_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `files_created_by_id_fk` (`created_by_id`),
  KEY `files_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `files_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `files_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (1,'s6z58v6uxjolptq1tsm5fsbv','logo.svg',NULL,NULL,138,29,NULL,'logo_0e52de4f78','.svg','image/svg+xml',7.40,'/uploads/logo_0e52de4f78.svg',NULL,'local',NULL,'/','2025-09-11 12:14:49.376000','2025-09-11 12:14:49.376000','2025-09-11 12:14:49.376000',1,1,NULL),(2,'tkce69kyrjksuwm3m0f6sz3w','poster.png',NULL,NULL,626,394,'{\"small\": {\"ext\": \".png\", \"url\": \"/uploads/small_poster_807b48a0bd.png\", \"hash\": \"small_poster_807b48a0bd\", \"mime\": \"image/png\", \"name\": \"small_poster.png\", \"path\": null, \"size\": 398.61, \"width\": 500, \"height\": 315, \"sizeInBytes\": 398612}, \"thumbnail\": {\"ext\": \".png\", \"url\": \"/uploads/thumbnail_poster_807b48a0bd.png\", \"hash\": \"thumbnail_poster_807b48a0bd\", \"mime\": \"image/png\", \"name\": \"thumbnail_poster.png\", \"path\": null, \"size\": 100.83, \"width\": 245, \"height\": 154, \"sizeInBytes\": 100832}}','poster_807b48a0bd','.png','image/png',170.59,'/uploads/poster_807b48a0bd.png',NULL,'local',NULL,'/','2025-09-16 10:01:36.369000','2025-09-16 10:01:36.369000','2025-09-16 10:01:36.370000',1,1,NULL),(3,'xz4hj4myjz0nz5vckvpgcj99','KS_1.jpg',NULL,NULL,3500,2622,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_KS_1_42486cefe4.jpg\", \"hash\": \"large_KS_1_42486cefe4\", \"mime\": \"image/jpeg\", \"name\": \"large_KS_1.jpg\", \"path\": null, \"size\": 113.42, \"width\": 1000, \"height\": 749, \"sizeInBytes\": 113419}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_KS_1_42486cefe4.jpg\", \"hash\": \"small_KS_1_42486cefe4\", \"mime\": \"image/jpeg\", \"name\": \"small_KS_1.jpg\", \"path\": null, \"size\": 30.96, \"width\": 500, \"height\": 374, \"sizeInBytes\": 30960}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_KS_1_42486cefe4.jpg\", \"hash\": \"medium_KS_1_42486cefe4\", \"mime\": \"image/jpeg\", \"name\": \"medium_KS_1.jpg\", \"path\": null, \"size\": 66.19, \"width\": 750, \"height\": 562, \"sizeInBytes\": 66187}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_KS_1_42486cefe4.jpg\", \"hash\": \"thumbnail_KS_1_42486cefe4\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_KS_1.jpg\", \"path\": null, \"size\": 6.47, \"width\": 208, \"height\": 156, \"sizeInBytes\": 6468}}','KS_1_42486cefe4','.jpg','image/jpeg',1504.32,'/uploads/KS_1_42486cefe4.jpg',NULL,'local',NULL,'/','2025-09-16 10:04:19.215000','2025-09-16 10:04:19.215000','2025-09-16 10:04:19.216000',1,1,NULL),(4,'kuc89ypbdzamk1kmmrqfabno','hero.jpg',NULL,NULL,1920,1050,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_hero_b6c918211c.jpg\", \"hash\": \"large_hero_b6c918211c\", \"mime\": \"image/jpeg\", \"name\": \"large_hero.jpg\", \"path\": null, \"size\": 76.61, \"width\": 1000, \"height\": 547, \"sizeInBytes\": 76613}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_hero_b6c918211c.jpg\", \"hash\": \"small_hero_b6c918211c\", \"mime\": \"image/jpeg\", \"name\": \"small_hero.jpg\", \"path\": null, \"size\": 21.63, \"width\": 500, \"height\": 273, \"sizeInBytes\": 21630}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_hero_b6c918211c.jpg\", \"hash\": \"medium_hero_b6c918211c\", \"mime\": \"image/jpeg\", \"name\": \"medium_hero.jpg\", \"path\": null, \"size\": 45.72, \"width\": 750, \"height\": 410, \"sizeInBytes\": 45720}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_hero_b6c918211c.jpg\", \"hash\": \"thumbnail_hero_b6c918211c\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_hero.jpg\", \"path\": null, \"size\": 6.06, \"width\": 245, \"height\": 134, \"sizeInBytes\": 6057}}','hero_b6c918211c','.jpg','image/jpeg',212.46,'/uploads/hero_b6c918211c.jpg',NULL,'local',NULL,'/','2025-09-17 15:01:50.833000','2025-09-17 15:01:50.833000','2025-09-17 15:01:50.833000',1,1,NULL),(5,'n6vfjuqkrya1bq1edww0sjwp','hero.jpg',NULL,NULL,3840,2100,'{\"large\": {\"ext\": \".jpg\", \"url\": \"/uploads/large_hero_a200c0ab59.jpg\", \"hash\": \"large_hero_a200c0ab59\", \"mime\": \"image/jpeg\", \"name\": \"large_hero.jpg\", \"path\": null, \"size\": 75.94, \"width\": 1000, \"height\": 547, \"sizeInBytes\": 75935}, \"small\": {\"ext\": \".jpg\", \"url\": \"/uploads/small_hero_a200c0ab59.jpg\", \"hash\": \"small_hero_a200c0ab59\", \"mime\": \"image/jpeg\", \"name\": \"small_hero.jpg\", \"path\": null, \"size\": 21.49, \"width\": 500, \"height\": 273, \"sizeInBytes\": 21492}, \"medium\": {\"ext\": \".jpg\", \"url\": \"/uploads/medium_hero_a200c0ab59.jpg\", \"hash\": \"medium_hero_a200c0ab59\", \"mime\": \"image/jpeg\", \"name\": \"medium_hero.jpg\", \"path\": null, \"size\": 44.09, \"width\": 750, \"height\": 410, \"sizeInBytes\": 44090}, \"thumbnail\": {\"ext\": \".jpg\", \"url\": \"/uploads/thumbnail_hero_a200c0ab59.jpg\", \"hash\": \"thumbnail_hero_a200c0ab59\", \"mime\": \"image/jpeg\", \"name\": \"thumbnail_hero.jpg\", \"path\": null, \"size\": 6.06, \"width\": 245, \"height\": 134, \"sizeInBytes\": 6062}}','hero_a200c0ab59','.jpg','image/jpeg',552.06,'/uploads/hero_a200c0ab59.jpg',NULL,'local',NULL,'/','2025-09-17 15:02:38.752000','2025-09-17 15:02:38.752000','2025-09-17 15:02:38.753000',1,1,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_folder_lnk`
--

DROP TABLE IF EXISTS `files_folder_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_folder_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `folder_id` int unsigned DEFAULT NULL,
  `file_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_folder_lnk_uq` (`file_id`,`folder_id`),
  KEY `files_folder_lnk_fk` (`file_id`),
  KEY `files_folder_lnk_ifk` (`folder_id`),
  KEY `files_folder_lnk_oifk` (`file_ord`),
  CONSTRAINT `files_folder_lnk_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_folder_lnk_ifk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_folder_lnk`
--

LOCK TABLES `files_folder_lnk` WRITE;
/*!40000 ALTER TABLE `files_folder_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `files_folder_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files_related_mph`
--

DROP TABLE IF EXISTS `files_related_mph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files_related_mph` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int unsigned DEFAULT NULL,
  `related_id` int unsigned DEFAULT NULL,
  `related_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `files_related_mph_fk` (`file_id`),
  KEY `files_related_mph_oidx` (`order`),
  KEY `files_related_mph_idix` (`related_id`),
  CONSTRAINT `files_related_mph_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files_related_mph`
--

LOCK TABLES `files_related_mph` WRITE;
/*!40000 ALTER TABLE `files_related_mph` DISABLE KEYS */;
INSERT INTO `files_related_mph` VALUES (3,1,3,'menu.logo','logo',1),(4,1,6,'menu.logo','logo',1),(7,2,2,'page.seo','metaImage',1),(11,2,3,'page.seo','metaImage',1),(15,2,4,'page.seo','metaImage',1),(19,2,5,'page.seo','metaImage',1),(23,2,6,'page.seo','metaImage',1),(27,2,7,'page.seo','metaImage',1),(31,2,8,'page.seo','metaImage',1),(35,2,9,'page.seo','metaImage',1),(39,2,10,'page.seo','metaImage',1),(43,2,11,'page.seo','metaImage',1),(47,2,12,'page.seo','metaImage',1),(51,2,13,'page.seo','metaImage',1),(55,2,14,'page.seo','metaImage',1),(59,2,15,'page.seo','metaImage',1),(61,2,1,'page.seo','metaImage',1),(62,5,1,'page.pervyj-ekran','images',1),(63,2,16,'page.seo','metaImage',1),(64,5,16,'page.pervyj-ekran','images',1);
/*!40000 ALTER TABLE `files_related_mph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `i18n_locale`
--

DROP TABLE IF EXISTS `i18n_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `i18n_locale` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i18n_locale_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `i18n_locale_created_by_id_fk` (`created_by_id`),
  KEY `i18n_locale_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `i18n_locale_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `i18n_locale_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `i18n_locale`
--

LOCK TABLES `i18n_locale` WRITE;
/*!40000 ALTER TABLE `i18n_locale` DISABLE KEYS */;
INSERT INTO `i18n_locale` VALUES (1,'wx5z8xu2ayy4ipo0tvx19j8g','English (en)','en','2025-09-10 12:29:07.626000','2025-09-10 12:29:07.626000','2025-09-10 12:29:07.627000',NULL,NULL,NULL),(2,'r27juiepx5jfoqlwf4u4mfw8','Russian (ru)','ru','2025-09-10 13:04:50.359000','2025-09-10 13:04:50.359000','2025-09-10 13:04:50.360000',1,1,NULL);
/*!40000 ALTER TABLE `i18n_locale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `publish_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `pages_created_by_id_fk` (`created_by_id`),
  KEY `pages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `pages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `pages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'jqptr564s1pjflhdxy1r5xot','Турбаза на Черном море','home',NULL,'2025-09-16 10:05:33.273000','2025-09-23 14:35:03.149000',NULL,1,1,'ru'),(16,'jqptr564s1pjflhdxy1r5xot','Турбаза на Черном море','home',NULL,'2025-09-16 10:05:33.273000','2025-09-23 14:35:03.149000','2025-09-23 14:35:03.180000',1,1,'ru');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_cmps`
--

DROP TABLE IF EXISTS `pages_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `pages_field_idx` (`field`),
  KEY `pages_component_type_idx` (`component_type`),
  KEY `pages_entity_fk` (`entity_id`),
  CONSTRAINT `pages_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_cmps`
--

LOCK TABLES `pages_cmps` WRITE;
/*!40000 ALTER TABLE `pages_cmps` DISABLE KEYS */;
INSERT INTO `pages_cmps` VALUES (1,1,1,'page.seo','SEO',NULL),(58,1,1,'page.pervyj-ekran','block',1),(59,1,1,'page.info-blok','block',2),(60,16,16,'page.seo','SEO',NULL),(61,16,16,'page.pervyj-ekran','block',1),(62,16,2,'page.info-blok','block',2);
/*!40000 ALTER TABLE `pages_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sections_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `sections_created_by_id_fk` (`created_by_id`),
  KEY `sections_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `sections_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `sections_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (7,'ejtw8l7jd0yfl6ybxgyymznj','2025-09-11 07:18:25.171000','2025-09-11 07:18:25.171000',NULL,1,1,'ru','Услуги'),(8,'ejtw8l7jd0yfl6ybxgyymznj','2025-09-11 07:18:25.171000','2025-09-11 07:18:25.171000','2025-09-11 07:18:25.184000',1,1,'ru','Услуги'),(9,'azye78tve1qmai7ek6skfvra','2025-09-11 07:19:00.439000','2025-09-11 11:46:29.637000',NULL,1,1,'ru','О лагере'),(15,'azye78tve1qmai7ek6skfvra','2025-09-11 07:19:00.439000','2025-09-11 11:46:29.637000','2025-09-11 11:46:29.659000',1,1,'ru','О лагере');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_cmps`
--

DROP TABLE IF EXISTS `sections_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sections_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `sections_field_idx` (`field`),
  KEY `sections_component_type_idx` (`component_type`),
  KEY `sections_entity_fk` (`entity_id`),
  CONSTRAINT `sections_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_cmps`
--

LOCK TABLES `sections_cmps` WRITE;
/*!40000 ALTER TABLE `sections_cmps` DISABLE KEYS */;
INSERT INTO `sections_cmps` VALUES (5,7,5,'menu.ssylka','links',1),(6,8,6,'menu.ssylka','links',1),(7,9,7,'menu.ssylka','links',1),(11,9,20,'menu.ssylka','links',3),(19,9,37,'menu.ssylka','links',2),(20,9,38,'menu.ssylka','links',4),(21,9,39,'menu.ssylka','links',5),(22,9,40,'menu.ssylka','links',6),(25,15,41,'menu.ssylka','links',1),(26,15,42,'menu.ssylka','links',2),(27,15,43,'menu.ssylka','links',3),(28,15,44,'menu.ssylka','links',4),(29,15,45,'menu.ssylka','links',5),(30,15,46,'menu.ssylka','links',6);
/*!40000 ALTER TABLE `sections_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_api_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions`
--

LOCK TABLES `strapi_api_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_token_permissions_token_lnk`
--

DROP TABLE IF EXISTS `strapi_api_token_permissions_token_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_token_permissions_token_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `api_token_permission_id` int unsigned DEFAULT NULL,
  `api_token_id` int unsigned DEFAULT NULL,
  `api_token_permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_api_token_permissions_token_lnk_uq` (`api_token_permission_id`,`api_token_id`),
  KEY `strapi_api_token_permissions_token_lnk_fk` (`api_token_permission_id`),
  KEY `strapi_api_token_permissions_token_lnk_ifk` (`api_token_id`),
  KEY `strapi_api_token_permissions_token_lnk_oifk` (`api_token_permission_ord`),
  CONSTRAINT `strapi_api_token_permissions_token_lnk_fk` FOREIGN KEY (`api_token_permission_id`) REFERENCES `strapi_api_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_api_token_permissions_token_lnk_ifk` FOREIGN KEY (`api_token_id`) REFERENCES `strapi_api_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_token_permissions_token_lnk`
--

LOCK TABLES `strapi_api_token_permissions_token_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_api_token_permissions_token_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_api_tokens`
--

DROP TABLE IF EXISTS `strapi_api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_api_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_api_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_api_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_api_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_api_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_api_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_api_tokens`
--

LOCK TABLES `strapi_api_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_api_tokens` DISABLE KEYS */;
INSERT INTO `strapi_api_tokens` VALUES (1,'qifgu46a8c5j4lgz157pumnc','Read Only','A default API token with read-only permissions, only used for accessing resources','read-only','2cad28a5161ccf4f1aa935c3d7efb2a03bccfb1d279e8d1b2c596e09b4570fa24746b099511d389d81540a5447bf849bd91988b03536e259995453eec9f3ceff',NULL,NULL,NULL,'2025-09-10 12:29:07.952000','2025-09-12 11:03:20.959000','2025-09-10 12:29:07.952000',NULL,NULL,NULL),(2,'orvx7oy1goafo6lrlsns7h2a','Full Access','A default API token with full access permissions, used for accessing or modifying resources','full-access','a9dcb696df45baae9bc8065d104b6a8bc9ea9d19de21b5e564222b70f050392979c6adc9f692e299b861588b4fdaae9f96d91dc927aac8add8ef66756d45ed45',NULL,NULL,NULL,'2025-09-10 12:29:07.956000','2025-09-10 12:29:07.956000','2025-09-10 12:29:07.956000',NULL,NULL,NULL),(3,'e0ert3tpz49d3zv2xl9edvhi','Frontend','','read-only','b4d92352a0a90ca17d8de047ea49a14598e1482a42f5f9fcc858f94288b04e01ca274c01d14864e50ac8bab023a2f813d5c0bc8034b758b3e0c08fb43d17886f',NULL,NULL,NULL,'2025-09-10 12:37:59.028000','2025-09-12 12:23:56.234000','2025-09-10 12:37:59.031000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `strapi_api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_core_store_settings`
--

DROP TABLE IF EXISTS `strapi_core_store_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_core_store_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_core_store_settings`
--

LOCK TABLES `strapi_core_store_settings` WRITE;
/*!40000 ALTER TABLE `strapi_core_store_settings` DISABLE KEYS */;
INSERT INTO `strapi_core_store_settings` VALUES (1,'strapi_content_types_schema','{\"plugin::upload.file\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"minLength\":1,\"required\":true,\"private\":true,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"files\"}}},\"indexes\":[{\"name\":\"upload_files_folder_path_index\",\"columns\":[\"folder_path\"],\"type\":null},{\"name\":\"upload_files_created_at_index\",\"columns\":[\"created_at\"],\"type\":null},{\"name\":\"upload_files_updated_at_index\",\"columns\":[\"updated_at\"],\"type\":null},{\"name\":\"upload_files_name_index\",\"columns\":[\"name\"],\"type\":null},{\"name\":\"upload_files_size_index\",\"columns\":[\"size\"],\"type\":null},{\"name\":\"upload_files_ext_index\",\"columns\":[\"ext\"],\"type\":null}],\"plugin\":\"upload\",\"globalId\":\"UploadFile\",\"uid\":\"plugin::upload.file\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"files\",\"info\":{\"singularName\":\"file\",\"pluralName\":\"files\",\"displayName\":\"File\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"alternativeText\":{\"type\":\"string\",\"configurable\":false},\"caption\":{\"type\":\"string\",\"configurable\":false},\"width\":{\"type\":\"integer\",\"configurable\":false},\"height\":{\"type\":\"integer\",\"configurable\":false},\"formats\":{\"type\":\"json\",\"configurable\":false},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"decimal\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"previewUrl\":{\"type\":\"string\",\"configurable\":false},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider_metadata\":{\"type\":\"json\",\"configurable\":false},\"related\":{\"type\":\"relation\",\"relation\":\"morphToMany\",\"configurable\":false},\"folder\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"files\",\"private\":true},\"folderPath\":{\"type\":\"string\",\"minLength\":1,\"required\":true,\"private\":true,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"file\"},\"plugin::upload.folder\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"upload_folders\"}}},\"indexes\":[{\"name\":\"upload_folders_path_id_index\",\"columns\":[\"path_id\"],\"type\":\"unique\"},{\"name\":\"upload_folders_path_index\",\"columns\":[\"path\"],\"type\":\"unique\"}],\"plugin\":\"upload\",\"globalId\":\"UploadFolder\",\"uid\":\"plugin::upload.folder\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"upload_folders\",\"info\":{\"singularName\":\"folder\",\"pluralName\":\"folders\",\"displayName\":\"Folder\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"required\":true},\"pathId\":{\"type\":\"integer\",\"unique\":true,\"required\":true},\"parent\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::upload.folder\",\"inversedBy\":\"children\"},\"children\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.folder\",\"mappedBy\":\"parent\"},\"files\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::upload.file\",\"mappedBy\":\"folder\"},\"path\":{\"type\":\"string\",\"minLength\":1,\"required\":true}},\"kind\":\"collectionType\"},\"modelName\":\"folder\"},\"plugin::i18n.locale\":{\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::i18n.locale\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"i18n_locale\"}}},\"plugin\":\"i18n\",\"collectionName\":\"i18n_locale\",\"globalId\":\"I18NLocale\",\"uid\":\"plugin::i18n.locale\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"i18n_locale\",\"info\":{\"singularName\":\"locale\",\"pluralName\":\"locales\",\"collectionName\":\"locales\",\"displayName\":\"Locale\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"min\":1,\"max\":50,\"configurable\":false},\"code\":{\"type\":\"string\",\"unique\":true,\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"locale\"},\"plugin::content-releases.release\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_releases\"}}},\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesRelease\",\"uid\":\"plugin::content-releases.release\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_releases\",\"info\":{\"singularName\":\"release\",\"pluralName\":\"releases\",\"displayName\":\"Release\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true},\"releasedAt\":{\"type\":\"datetime\"},\"scheduledAt\":{\"type\":\"datetime\"},\"timezone\":{\"type\":\"string\"},\"status\":{\"type\":\"enumeration\",\"enum\":[\"ready\",\"blocked\",\"failed\",\"done\",\"empty\"],\"required\":true},\"actions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"mappedBy\":\"release\"}},\"kind\":\"collectionType\"},\"modelName\":\"release\"},\"plugin::content-releases.release-action\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"contentType\":{\"type\":\"string\",\"required\":true},\"entryDocumentId\":{\"type\":\"string\"},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::content-releases.release-action\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_release_actions\"}}},\"plugin\":\"content-releases\",\"globalId\":\"ContentReleasesReleaseAction\",\"uid\":\"plugin::content-releases.release-action\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_release_actions\",\"info\":{\"singularName\":\"release-action\",\"pluralName\":\"release-actions\",\"displayName\":\"Release Action\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"type\":{\"type\":\"enumeration\",\"enum\":[\"publish\",\"unpublish\"],\"required\":true},\"contentType\":{\"type\":\"string\",\"required\":true},\"entryDocumentId\":{\"type\":\"string\"},\"locale\":{\"type\":\"string\"},\"release\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::content-releases.release\",\"inversedBy\":\"actions\"},\"isEntryValid\":{\"type\":\"boolean\"}},\"kind\":\"collectionType\"},\"modelName\":\"release-action\"},\"plugin::review-workflows.workflow\":{\"collectionName\":\"strapi_workflows\",\"info\":{\"name\":\"Workflow\",\"description\":\"\",\"singularName\":\"workflow\",\"pluralName\":\"workflows\",\"displayName\":\"Workflow\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"stages\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToMany\",\"mappedBy\":\"workflow\"},\"stageRequiredToPublish\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToOne\",\"required\":false},\"contentTypes\":{\"type\":\"json\",\"required\":true,\"default\":\"[]\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::review-workflows.workflow\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_workflows\"}}},\"plugin\":\"review-workflows\",\"globalId\":\"ReviewWorkflowsWorkflow\",\"uid\":\"plugin::review-workflows.workflow\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_workflows\",\"info\":{\"name\":\"Workflow\",\"description\":\"\",\"singularName\":\"workflow\",\"pluralName\":\"workflows\",\"displayName\":\"Workflow\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"required\":true,\"unique\":true},\"stages\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToMany\",\"mappedBy\":\"workflow\"},\"stageRequiredToPublish\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow-stage\",\"relation\":\"oneToOne\",\"required\":false},\"contentTypes\":{\"type\":\"json\",\"required\":true,\"default\":\"[]\"}},\"kind\":\"collectionType\"},\"modelName\":\"workflow\"},\"plugin::review-workflows.workflow-stage\":{\"collectionName\":\"strapi_workflows_stages\",\"info\":{\"name\":\"Workflow Stage\",\"description\":\"\",\"singularName\":\"workflow-stage\",\"pluralName\":\"workflow-stages\",\"displayName\":\"Stages\"},\"options\":{\"version\":\"1.1.0\",\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false},\"color\":{\"type\":\"string\",\"configurable\":false,\"default\":\"#4945FF\"},\"workflow\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow\",\"relation\":\"manyToOne\",\"inversedBy\":\"stages\",\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::permission\",\"relation\":\"manyToMany\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::review-workflows.workflow-stage\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_workflows_stages\"}}},\"plugin\":\"review-workflows\",\"globalId\":\"ReviewWorkflowsWorkflowStage\",\"uid\":\"plugin::review-workflows.workflow-stage\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_workflows_stages\",\"info\":{\"name\":\"Workflow Stage\",\"description\":\"\",\"singularName\":\"workflow-stage\",\"pluralName\":\"workflow-stages\",\"displayName\":\"Stages\"},\"options\":{\"version\":\"1.1.0\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false},\"color\":{\"type\":\"string\",\"configurable\":false,\"default\":\"#4945FF\"},\"workflow\":{\"type\":\"relation\",\"target\":\"plugin::review-workflows.workflow\",\"relation\":\"manyToOne\",\"inversedBy\":\"stages\",\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::permission\",\"relation\":\"manyToMany\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"workflow-stage\"},\"plugin::users-permissions.permission\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_permissions\"}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsPermission\",\"uid\":\"plugin::users-permissions.permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_permissions\",\"info\":{\"name\":\"permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"permissions\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"permission\",\"options\":{\"draftAndPublish\":false}},\"plugin::users-permissions.role\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.role\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_roles\"}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsRole\",\"uid\":\"plugin::users-permissions.role\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_roles\",\"info\":{\"name\":\"role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.permission\",\"mappedBy\":\"role\",\"configurable\":false},\"users\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"mappedBy\":\"role\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"role\",\"options\":{\"draftAndPublish\":false}},\"plugin::users-permissions.user\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"timestamps\":true,\"draftAndPublish\":false},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"plugin::users-permissions.user\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"up_users\"}}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"confirmationToken\":{\"hidden\":true},\"provider\":{\"hidden\":true}}},\"plugin\":\"users-permissions\",\"globalId\":\"UsersPermissionsUser\",\"uid\":\"plugin::users-permissions.user\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"up_users\",\"info\":{\"name\":\"user\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"options\":{\"timestamps\":true},\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"type\":\"relation\",\"relation\":\"manyToOne\",\"target\":\"plugin::users-permissions.role\",\"inversedBy\":\"users\",\"configurable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"user\"},\"api::page.page\":{\"kind\":\"collectionType\",\"collectionName\":\"pages\",\"info\":{\"singularName\":\"page\",\"pluralName\":\"pages\",\"displayName\":\"Страницы\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"title\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"slug\":{\"type\":\"string\",\"unique\":false},\"SEO\":{\"displayName\":\"SEO\",\"type\":\"component\",\"repeatable\":false,\"component\":\"page.seo\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"block\":{\"type\":\"dynamiczone\",\"components\":[\"page.pervyj-ekran\",\"page.info-blok\"],\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"publish_at\":{\"type\":\"datetime\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::page.page\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"pages\"}}},\"apiName\":\"page\",\"globalId\":\"Page\",\"uid\":\"api::page.page\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"pages\",\"info\":{\"singularName\":\"page\",\"pluralName\":\"pages\",\"displayName\":\"Страницы\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"title\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"slug\":{\"type\":\"string\",\"unique\":false},\"SEO\":{\"displayName\":\"SEO\",\"type\":\"component\",\"repeatable\":false,\"component\":\"page.seo\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"block\":{\"type\":\"dynamiczone\",\"components\":[\"page.pervyj-ekran\",\"page.info-blok\"],\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"publish_at\":{\"type\":\"datetime\",\"pluginOptions\":{\"i18n\":{\"localized\":true}}}},\"kind\":\"collectionType\"},\"modelName\":\"page\",\"actions\":{},\"lifecycles\":{}},\"api::section.section\":{\"kind\":\"collectionType\",\"collectionName\":\"sections\",\"info\":{\"singularName\":\"section\",\"pluralName\":\"sections\",\"displayName\":\"Разделы меню\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"title\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"required\":true},\"links\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"menu.ssylka\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::section.section\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"sections\"}}},\"apiName\":\"section\",\"globalId\":\"Section\",\"uid\":\"api::section.section\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"sections\",\"info\":{\"singularName\":\"section\",\"pluralName\":\"sections\",\"displayName\":\"Разделы меню\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"title\":{\"type\":\"string\",\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"required\":true},\"links\":{\"type\":\"component\",\"repeatable\":true,\"component\":\"menu.ssylka\"}},\"kind\":\"collectionType\"},\"modelName\":\"section\",\"actions\":{},\"lifecycles\":{}},\"api::top-menu.top-menu\":{\"kind\":\"singleType\",\"collectionName\":\"top_menus\",\"info\":{\"singularName\":\"top-menu\",\"pluralName\":\"top-menus\",\"displayName\":\"Основное меню\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"MainMenuItems\":{\"type\":\"dynamiczone\",\"components\":[\"menu.vypadayushhee-menyu\",\"menu.ssylka\",\"menu.knopka\",\"menu.logo\"],\"pluginOptions\":{\"i18n\":{\"localized\":true}}},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":false,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"api::top-menu.top-menu\",\"writable\":false,\"private\":false,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"top_menus\"}}},\"apiName\":\"top-menu\",\"globalId\":\"TopMenu\",\"uid\":\"api::top-menu.top-menu\",\"modelType\":\"contentType\",\"__schema__\":{\"collectionName\":\"top_menus\",\"info\":{\"singularName\":\"top-menu\",\"pluralName\":\"top-menus\",\"displayName\":\"Основное меню\",\"description\":\"\"},\"options\":{\"draftAndPublish\":true},\"pluginOptions\":{\"i18n\":{\"localized\":true}},\"attributes\":{\"MainMenuItems\":{\"type\":\"dynamiczone\",\"components\":[\"menu.vypadayushhee-menyu\",\"menu.ssylka\",\"menu.knopka\",\"menu.logo\"],\"pluginOptions\":{\"i18n\":{\"localized\":true}}}},\"kind\":\"singleType\"},\"modelName\":\"top-menu\",\"actions\":{},\"lifecycles\":{}},\"admin::permission\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminPermission\",\"uid\":\"admin::permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_permissions\",\"info\":{\"name\":\"Permission\",\"description\":\"\",\"singularName\":\"permission\",\"pluralName\":\"permissions\",\"displayName\":\"Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"actionParameters\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"subject\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false},\"properties\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":{}},\"conditions\":{\"type\":\"json\",\"configurable\":false,\"required\":false,\"default\":[]},\"role\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::role\"}},\"kind\":\"collectionType\"},\"modelName\":\"permission\"},\"admin::user\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::user\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_users\"}}},\"config\":{\"attributes\":{\"resetPasswordToken\":{\"hidden\":true},\"registrationToken\":{\"hidden\":true}}},\"plugin\":\"admin\",\"globalId\":\"AdminUser\",\"uid\":\"admin::user\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_users\",\"info\":{\"name\":\"User\",\"description\":\"\",\"singularName\":\"user\",\"pluralName\":\"users\",\"displayName\":\"User\"},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"firstname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"lastname\":{\"type\":\"string\",\"unique\":false,\"minLength\":1,\"configurable\":false,\"required\":false},\"username\":{\"type\":\"string\",\"unique\":false,\"configurable\":false,\"required\":false},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true,\"unique\":true,\"private\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"required\":false,\"private\":true,\"searchable\":false},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"registrationToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true,\"searchable\":false},\"isActive\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"roles\":{\"configurable\":false,\"private\":true,\"type\":\"relation\",\"relation\":\"manyToMany\",\"inversedBy\":\"users\",\"target\":\"admin::role\",\"collectionName\":\"strapi_users_roles\"},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false,\"private\":true},\"preferedLanguage\":{\"type\":\"string\",\"configurable\":false,\"required\":false,\"searchable\":false}},\"kind\":\"collectionType\"},\"modelName\":\"user\",\"options\":{\"draftAndPublish\":false}},\"admin::role\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::role\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"admin_roles\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminRole\",\"uid\":\"admin::role\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"admin_roles\",\"info\":{\"name\":\"Role\",\"description\":\"\",\"singularName\":\"role\",\"pluralName\":\"roles\",\"displayName\":\"Role\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"code\":{\"type\":\"string\",\"minLength\":1,\"unique\":true,\"configurable\":false,\"required\":true},\"description\":{\"type\":\"string\",\"configurable\":false},\"users\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToMany\",\"mappedBy\":\"roles\",\"target\":\"admin::user\"},\"permissions\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"oneToMany\",\"mappedBy\":\"role\",\"target\":\"admin::permission\"}},\"kind\":\"collectionType\"},\"modelName\":\"role\"},\"admin::api-token\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::api-token\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_api_tokens\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminApiToken\",\"uid\":\"admin::api-token\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_tokens\",\"info\":{\"name\":\"Api Token\",\"singularName\":\"api-token\",\"pluralName\":\"api-tokens\",\"displayName\":\"Api Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"type\":{\"type\":\"enumeration\",\"enum\":[\"read-only\",\"full-access\",\"custom\"],\"configurable\":false,\"required\":true,\"default\":\"read-only\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"searchable\":false},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::api-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelName\":\"api-token\"},\"admin::api-token-permission\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::api-token-permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_api_token_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminApiTokenPermission\",\"uid\":\"admin::api-token-permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_api_token_permissions\",\"info\":{\"name\":\"API Token Permission\",\"description\":\"\",\"singularName\":\"api-token-permission\",\"pluralName\":\"api-token-permissions\",\"displayName\":\"API Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::api-token\"}},\"kind\":\"collectionType\"},\"modelName\":\"api-token-permission\"},\"admin::transfer-token\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::transfer-token\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_transfer_tokens\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminTransferToken\",\"uid\":\"admin::transfer-token\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_tokens\",\"info\":{\"name\":\"Transfer Token\",\"singularName\":\"transfer-token\",\"pluralName\":\"transfer-tokens\",\"displayName\":\"Transfer Token\",\"description\":\"\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true,\"unique\":true},\"description\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":false,\"default\":\"\"},\"accessKey\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"lastUsedAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"permissions\":{\"type\":\"relation\",\"target\":\"admin::transfer-token-permission\",\"relation\":\"oneToMany\",\"mappedBy\":\"token\",\"configurable\":false,\"required\":false},\"expiresAt\":{\"type\":\"datetime\",\"configurable\":false,\"required\":false},\"lifespan\":{\"type\":\"biginteger\",\"configurable\":false,\"required\":false}},\"kind\":\"collectionType\"},\"modelName\":\"transfer-token\"},\"admin::transfer-token-permission\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{\"draftAndPublish\":false},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"},\"createdAt\":{\"type\":\"datetime\"},\"updatedAt\":{\"type\":\"datetime\"},\"publishedAt\":{\"type\":\"datetime\",\"configurable\":false,\"writable\":true,\"visible\":false},\"createdBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"updatedBy\":{\"type\":\"relation\",\"relation\":\"oneToOne\",\"target\":\"admin::user\",\"configurable\":false,\"writable\":false,\"visible\":false,\"useJoinTable\":false,\"private\":true},\"locale\":{\"writable\":true,\"private\":true,\"configurable\":false,\"visible\":false,\"type\":\"string\"},\"localizations\":{\"type\":\"relation\",\"relation\":\"oneToMany\",\"target\":\"admin::transfer-token-permission\",\"writable\":false,\"private\":true,\"configurable\":false,\"visible\":false,\"unstable_virtual\":true,\"joinColumn\":{\"name\":\"document_id\",\"referencedColumn\":\"document_id\",\"referencedTable\":\"strapi_transfer_token_permissions\"}}},\"plugin\":\"admin\",\"globalId\":\"AdminTransferTokenPermission\",\"uid\":\"admin::transfer-token-permission\",\"modelType\":\"contentType\",\"kind\":\"collectionType\",\"__schema__\":{\"collectionName\":\"strapi_transfer_token_permissions\",\"info\":{\"name\":\"Transfer Token Permission\",\"description\":\"\",\"singularName\":\"transfer-token-permission\",\"pluralName\":\"transfer-token-permissions\",\"displayName\":\"Transfer Token Permission\"},\"options\":{},\"pluginOptions\":{\"content-manager\":{\"visible\":false},\"content-type-builder\":{\"visible\":false}},\"attributes\":{\"action\":{\"type\":\"string\",\"minLength\":1,\"configurable\":false,\"required\":true},\"token\":{\"configurable\":false,\"type\":\"relation\",\"relation\":\"manyToOne\",\"inversedBy\":\"permissions\",\"target\":\"admin::transfer-token\"}},\"kind\":\"collectionType\"},\"modelName\":\"transfer-token-permission\"}}','object',NULL,NULL),(2,'plugin_content_manager_configuration_content_types::plugin::upload.file','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"alternativeText\":{\"edit\":{\"label\":\"alternativeText\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"alternativeText\",\"searchable\":true,\"sortable\":true}},\"caption\":{\"edit\":{\"label\":\"caption\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"caption\",\"searchable\":true,\"sortable\":true}},\"width\":{\"edit\":{\"label\":\"width\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"width\",\"searchable\":true,\"sortable\":true}},\"height\":{\"edit\":{\"label\":\"height\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"height\",\"searchable\":true,\"sortable\":true}},\"formats\":{\"edit\":{\"label\":\"formats\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"formats\",\"searchable\":false,\"sortable\":false}},\"hash\":{\"edit\":{\"label\":\"hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"hash\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"previewUrl\":{\"edit\":{\"label\":\"previewUrl\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"previewUrl\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"provider_metadata\":{\"edit\":{\"label\":\"provider_metadata\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"provider_metadata\",\"searchable\":false,\"sortable\":false}},\"folder\":{\"edit\":{\"label\":\"folder\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"folder\",\"searchable\":true,\"sortable\":true}},\"folderPath\":{\"edit\":{\"label\":\"folderPath\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"folderPath\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"alternativeText\",\"caption\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"alternativeText\",\"size\":6}],[{\"name\":\"caption\",\"size\":6},{\"name\":\"width\",\"size\":4}],[{\"name\":\"height\",\"size\":4}],[{\"name\":\"formats\",\"size\":12}],[{\"name\":\"hash\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":4}],[{\"name\":\"url\",\"size\":6},{\"name\":\"previewUrl\",\"size\":6}],[{\"name\":\"provider\",\"size\":6}],[{\"name\":\"provider_metadata\",\"size\":12}],[{\"name\":\"folder\",\"size\":6},{\"name\":\"folderPath\",\"size\":6}]]},\"uid\":\"plugin::upload.file\"}','object',NULL,NULL),(3,'plugin_content_manager_configuration_content_types::plugin::upload.folder','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"pathId\":{\"edit\":{\"label\":\"pathId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"pathId\",\"searchable\":true,\"sortable\":true}},\"parent\":{\"edit\":{\"label\":\"parent\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"parent\",\"searchable\":true,\"sortable\":true}},\"children\":{\"edit\":{\"label\":\"children\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"children\",\"searchable\":false,\"sortable\":false}},\"files\":{\"edit\":{\"label\":\"files\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"files\",\"searchable\":false,\"sortable\":false}},\"path\":{\"edit\":{\"label\":\"path\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"path\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"pathId\",\"parent\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"pathId\",\"size\":4}],[{\"name\":\"parent\",\"size\":6},{\"name\":\"children\",\"size\":6}],[{\"name\":\"files\",\"size\":6},{\"name\":\"path\",\"size\":6}]]},\"uid\":\"plugin::upload.folder\"}','object',NULL,NULL),(4,'plugin_content_manager_configuration_content_types::plugin::i18n.locale','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"createdAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}]]},\"uid\":\"plugin::i18n.locale\"}','object',NULL,NULL),(5,'plugin_content_manager_configuration_content_types::plugin::content-releases.release','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"releasedAt\":{\"edit\":{\"label\":\"releasedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"releasedAt\",\"searchable\":true,\"sortable\":true}},\"scheduledAt\":{\"edit\":{\"label\":\"scheduledAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"scheduledAt\",\"searchable\":true,\"sortable\":true}},\"timezone\":{\"edit\":{\"label\":\"timezone\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"timezone\",\"searchable\":true,\"sortable\":true}},\"status\":{\"edit\":{\"label\":\"status\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"status\",\"searchable\":true,\"sortable\":true}},\"actions\":{\"edit\":{\"label\":\"actions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"contentType\"},\"list\":{\"label\":\"actions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"releasedAt\",\"scheduledAt\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"releasedAt\",\"size\":6}],[{\"name\":\"scheduledAt\",\"size\":6},{\"name\":\"timezone\",\"size\":6}],[{\"name\":\"status\",\"size\":6},{\"name\":\"actions\",\"size\":6}]]},\"uid\":\"plugin::content-releases.release\"}','object',NULL,NULL),(6,'plugin_content_manager_configuration_content_types::plugin::content-releases.release-action','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"contentType\",\"defaultSortBy\":\"contentType\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"contentType\":{\"edit\":{\"label\":\"contentType\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentType\",\"searchable\":true,\"sortable\":true}},\"entryDocumentId\":{\"edit\":{\"label\":\"entryDocumentId\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"entryDocumentId\",\"searchable\":true,\"sortable\":true}},\"release\":{\"edit\":{\"label\":\"release\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"release\",\"searchable\":true,\"sortable\":true}},\"isEntryValid\":{\"edit\":{\"label\":\"isEntryValid\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isEntryValid\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"type\",\"contentType\",\"entryDocumentId\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"contentType\",\"size\":6}],[{\"name\":\"entryDocumentId\",\"size\":6},{\"name\":\"release\",\"size\":6}],[{\"name\":\"isEntryValid\",\"size\":4}]]},\"uid\":\"plugin::content-releases.release-action\"}','object',NULL,NULL),(7,'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"stages\":{\"edit\":{\"label\":\"stages\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"stages\",\"searchable\":false,\"sortable\":false}},\"stageRequiredToPublish\":{\"edit\":{\"label\":\"stageRequiredToPublish\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"stageRequiredToPublish\",\"searchable\":true,\"sortable\":true}},\"contentTypes\":{\"edit\":{\"label\":\"contentTypes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"contentTypes\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"stages\",\"stageRequiredToPublish\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"stages\",\"size\":6}],[{\"name\":\"stageRequiredToPublish\",\"size\":6}],[{\"name\":\"contentTypes\",\"size\":12}]]},\"uid\":\"plugin::review-workflows.workflow\"}','object',NULL,NULL),(8,'plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"color\":{\"edit\":{\"label\":\"color\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"color\",\"searchable\":true,\"sortable\":true}},\"workflow\":{\"edit\":{\"label\":\"workflow\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"workflow\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"color\",\"workflow\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"color\",\"size\":6}],[{\"name\":\"workflow\",\"size\":6},{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"plugin::review-workflows.workflow-stage\"}','object',NULL,NULL),(9,'plugin_content_manager_configuration_content_types::plugin::users-permissions.permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"role\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.permission\"}','object',NULL,NULL),(10,'plugin_content_manager_configuration_content_types::plugin::users-permissions.role','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"users\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.role\"}','object',NULL,NULL),(11,'plugin_content_manager_configuration_content_types::plugin::users-permissions.user','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmationToken\":{\"edit\":{\"label\":\"confirmationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"confirmationToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"confirmed\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4},{\"name\":\"role\",\"size\":6}]]},\"uid\":\"plugin::users-permissions.user\"}','object',NULL,NULL),(12,'plugin_content_manager_configuration_content_types::admin::permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"actionParameters\":{\"edit\":{\"label\":\"actionParameters\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"actionParameters\",\"searchable\":false,\"sortable\":false}},\"subject\":{\"edit\":{\"label\":\"subject\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"subject\",\"searchable\":true,\"sortable\":true}},\"properties\":{\"edit\":{\"label\":\"properties\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"properties\",\"searchable\":false,\"sortable\":false}},\"conditions\":{\"edit\":{\"label\":\"conditions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"conditions\",\"searchable\":false,\"sortable\":false}},\"role\":{\"edit\":{\"label\":\"role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"role\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"subject\",\"role\"],\"edit\":[[{\"name\":\"action\",\"size\":6}],[{\"name\":\"actionParameters\",\"size\":12}],[{\"name\":\"subject\",\"size\":6}],[{\"name\":\"properties\",\"size\":12}],[{\"name\":\"conditions\",\"size\":12}],[{\"name\":\"role\",\"size\":6}]]},\"uid\":\"admin::permission\"}','object',NULL,NULL),(13,'plugin_content_manager_configuration_content_types::admin::user','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"firstname\",\"defaultSortBy\":\"firstname\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"firstname\":{\"edit\":{\"label\":\"firstname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"firstname\",\"searchable\":true,\"sortable\":true}},\"lastname\":{\"edit\":{\"label\":\"lastname\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastname\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"resetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"resetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"registrationToken\":{\"edit\":{\"label\":\"registrationToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"registrationToken\",\"searchable\":true,\"sortable\":true}},\"isActive\":{\"edit\":{\"label\":\"isActive\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isActive\",\"searchable\":true,\"sortable\":true}},\"roles\":{\"edit\":{\"label\":\"roles\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"roles\",\"searchable\":false,\"sortable\":false}},\"blocked\":{\"edit\":{\"label\":\"blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"blocked\",\"searchable\":true,\"sortable\":true}},\"preferedLanguage\":{\"edit\":{\"label\":\"preferedLanguage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preferedLanguage\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"firstname\",\"lastname\",\"username\"],\"edit\":[[{\"name\":\"firstname\",\"size\":6},{\"name\":\"lastname\",\"size\":6}],[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"isActive\",\"size\":4}],[{\"name\":\"roles\",\"size\":6},{\"name\":\"blocked\",\"size\":4}],[{\"name\":\"preferedLanguage\",\"size\":6}]]},\"uid\":\"admin::user\"}','object',NULL,NULL),(14,'plugin_content_manager_configuration_content_types::admin::role','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"code\":{\"edit\":{\"label\":\"code\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"code\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"users\":{\"edit\":{\"label\":\"users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"users\",\"searchable\":false,\"sortable\":false}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"code\",\"description\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"code\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"users\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6}]]},\"uid\":\"admin::role\"}','object',NULL,NULL),(15,'plugin_content_manager_configuration_content_types::admin::api-token','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6},{\"name\":\"accessKey\",\"size\":6}],[{\"name\":\"lastUsedAt\",\"size\":6},{\"name\":\"permissions\",\"size\":6}],[{\"name\":\"expiresAt\",\"size\":6},{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::api-token\"}','object',NULL,NULL),(16,'plugin_content_manager_configuration_content_types::admin::api-token-permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::api-token-permission\"}','object',NULL,NULL),(17,'plugin_content_manager_configuration_content_types::admin::transfer-token','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"accessKey\":{\"edit\":{\"label\":\"accessKey\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"accessKey\",\"searchable\":true,\"sortable\":true}},\"lastUsedAt\":{\"edit\":{\"label\":\"lastUsedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lastUsedAt\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"action\"},\"list\":{\"label\":\"permissions\",\"searchable\":false,\"sortable\":false}},\"expiresAt\":{\"edit\":{\"label\":\"expiresAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"expiresAt\",\"searchable\":true,\"sortable\":true}},\"lifespan\":{\"edit\":{\"label\":\"lifespan\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"lifespan\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"accessKey\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"accessKey\",\"size\":6},{\"name\":\"lastUsedAt\",\"size\":6}],[{\"name\":\"permissions\",\"size\":6},{\"name\":\"expiresAt\",\"size\":6}],[{\"name\":\"lifespan\",\"size\":4}]]},\"uid\":\"admin::transfer-token\"}','object',NULL,NULL),(18,'plugin_content_manager_configuration_content_types::admin::transfer-token-permission','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"action\",\"defaultSortBy\":\"action\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"action\",\"searchable\":true,\"sortable\":true}},\"token\":{\"edit\":{\"label\":\"token\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"token\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"action\",\"token\",\"createdAt\"],\"edit\":[[{\"name\":\"action\",\"size\":6},{\"name\":\"token\",\"size\":6}]]},\"uid\":\"admin::transfer-token-permission\"}','object',NULL,NULL),(19,'plugin_upload_settings','{\"sizeOptimization\":true,\"responsiveDimensions\":true,\"autoOrientation\":false}','object',NULL,NULL),(20,'plugin_upload_view_configuration','{\"pageSize\":10,\"sort\":\"createdAt:DESC\"}','object',NULL,NULL),(21,'plugin_upload_metrics','{\"weeklySchedule\":\"22 29 12 * * 3\",\"lastWeeklyUpdate\":1758112162105}','object',NULL,NULL),(22,'plugin_i18n_default_locale','\"ru\"','string',NULL,NULL),(23,'plugin_users-permissions_grant','{\"email\":{\"icon\":\"envelope\",\"enabled\":true},\"discord\":{\"icon\":\"discord\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"icon\":\"facebook-square\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"icon\":\"google\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"icon\":\"github\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"icon\":\"windows\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"icon\":\"twitter\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/twitter/callback\"},\"instagram\":{\"icon\":\"instagram\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/instagram/callback\",\"scope\":[\"user_profile\"]},\"vk\":{\"icon\":\"vk\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/vk/callback\",\"scope\":[\"email\"]},\"twitch\":{\"icon\":\"twitch\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/twitch/callback\",\"scope\":[\"user:read:email\"]},\"linkedin\":{\"icon\":\"linkedin\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callbackUrl\":\"api/auth/linkedin/callback\",\"scope\":[\"r_liteprofile\",\"r_emailaddress\"]},\"cognito\":{\"icon\":\"aws\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my.subdomain.com\",\"callback\":\"api/auth/cognito/callback\",\"scope\":[\"email\",\"openid\",\"profile\"]},\"reddit\":{\"icon\":\"reddit\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/reddit/callback\",\"scope\":[\"identity\"]},\"auth0\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"my-tenant.eu\",\"callback\":\"api/auth/auth0/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]},\"cas\":{\"icon\":\"book\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/cas/callback\",\"scope\":[\"openid email\"],\"subdomain\":\"my.subdomain.com/cas\"},\"patreon\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"callback\":\"api/auth/patreon/callback\",\"scope\":[\"identity\",\"identity[email]\"]},\"keycloak\":{\"icon\":\"\",\"enabled\":false,\"key\":\"\",\"secret\":\"\",\"subdomain\":\"myKeycloakProvider.com/realms/myrealm\",\"callback\":\"api/auth/keycloak/callback\",\"scope\":[\"openid\",\"email\",\"profile\"]}}','object',NULL,NULL),(24,'plugin_users-permissions_email','{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"sync\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}','object',NULL,NULL),(25,'plugin_users-permissions_advanced','{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_reset_password\":null,\"email_confirmation_redirection\":null,\"default_role\":\"authenticated\"}','object',NULL,NULL),(26,'core_admin_auth','{\"providers\":{\"autoRegister\":false,\"defaultRole\":null,\"ssoLockedRoles\":null}}','object',NULL,NULL),(31,'plugin_content_manager_configuration_content_types::api::section.section','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"links\":{\"edit\":{\"label\":\"links\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"links\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"edit\":[[{\"name\":\"title\",\"size\":6}],[{\"name\":\"links\",\"size\":12}]],\"list\":[\"id\",\"title\",\"links\"]},\"uid\":\"api::section.section\"}','object',NULL,NULL),(32,'plugin_content_manager_configuration_components::menu.ssylka','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":true,\"sortable\":true}},\"icon\":{\"edit\":{\"label\":\"icon\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"icon\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"url\",\"description\",\"title\"],\"edit\":[[{\"name\":\"url\",\"size\":6}],[{\"name\":\"description\",\"size\":6},{\"name\":\"icon\",\"size\":6}],[{\"name\":\"title\",\"size\":6}]]},\"uid\":\"menu.ssylka\",\"isComponent\":true}','object',NULL,NULL),(33,'plugin_content_manager_configuration_components::menu.vypadayushhee-menyu','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"sections\":{\"edit\":{\"label\":\"sections\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"title\"},\"list\":{\"label\":\"sections\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"title\",\"sections\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"sections\",\"size\":6}]]},\"uid\":\"menu.vypadayushhee-menyu\",\"isComponent\":true}','object',NULL,NULL),(34,'plugin_content_manager_configuration_components::menu.punkt-menyu','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"url\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"url\",\"size\":6}]]},\"uid\":\"menu.punkt-menyu\",\"isComponent\":true}','object',NULL,NULL),(35,'plugin_content_manager_configuration_components::menu.knopka','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"url\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"type\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"url\",\"type\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"url\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]},\"uid\":\"menu.knopka\",\"isComponent\":true}','object',NULL,NULL),(36,'plugin_content_manager_configuration_content_types::api::top-menu.top-menu','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"MainMenuItems\":{\"edit\":{\"label\":\"MainMenuItems\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"MainMenuItems\",\"searchable\":false,\"sortable\":false}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"createdAt\",\"updatedAt\",\"createdBy\"],\"edit\":[[{\"name\":\"MainMenuItems\",\"size\":12}]]},\"uid\":\"api::top-menu.top-menu\"}','object',NULL,NULL),(38,'plugin_content_manager_configuration_components::menu.logo','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"logo\":{\"edit\":{\"label\":\"logo\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"logo\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"logo\"],\"edit\":[[{\"name\":\"logo\",\"size\":6}]]},\"uid\":\"menu.logo\",\"isComponent\":true}','object',NULL,NULL),(40,'plugin_content_manager_configuration_components::page.seo','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"metaTitle\",\"defaultSortBy\":\"metaTitle\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"metaTitle\":{\"edit\":{\"label\":\"metaTitle\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaTitle\",\"searchable\":true,\"sortable\":true}},\"metaDescription\":{\"edit\":{\"label\":\"metaDescription\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaDescription\",\"searchable\":true,\"sortable\":true}},\"metaField\":{\"edit\":{\"label\":\"metaField\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaField\",\"searchable\":false,\"sortable\":false}},\"preventIndexing\":{\"edit\":{\"label\":\"preventIndexing\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"preventIndexing\",\"searchable\":true,\"sortable\":true}},\"structuredData\":{\"edit\":{\"label\":\"structuredData\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"structuredData\",\"searchable\":false,\"sortable\":false}},\"metaImage\":{\"edit\":{\"label\":\"metaImage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"metaImage\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"metaTitle\",\"metaDescription\",\"metaField\"],\"edit\":[[{\"name\":\"metaTitle\",\"size\":6},{\"name\":\"metaDescription\",\"size\":6}],[{\"name\":\"metaField\",\"size\":12}],[{\"name\":\"preventIndexing\",\"size\":4}],[{\"name\":\"structuredData\",\"size\":12}],[{\"name\":\"metaImage\",\"size\":6}]]},\"uid\":\"page.seo\",\"isComponent\":true}','object',NULL,NULL),(41,'plugin_content_manager_configuration_components::page.pervyj-ekran','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"images\":{\"edit\":{\"label\":\"images\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"images\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"text\":{\"edit\":{\"label\":\"text\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"text\",\"searchable\":true,\"sortable\":true}},\"buttons\":{\"edit\":{\"label\":\"buttons\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"buttons\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"images\",\"header\",\"text\"],\"edit\":[[{\"name\":\"images\",\"size\":6}],[{\"name\":\"header\",\"size\":12}],[{\"name\":\"text\",\"size\":6}],[{\"name\":\"buttons\",\"size\":12}]]},\"uid\":\"page.pervyj-ekran\",\"isComponent\":true}','object',NULL,NULL),(42,'plugin_content_manager_configuration_components::seo.meta-field','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\"],\"edit\":[]},\"uid\":\"seo.meta-field\",\"isComponent\":true}','object',NULL,NULL),(43,'plugin_content_manager_configuration_content_types::api::page.page','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"title\",\"defaultSortBy\":\"title\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}},\"slug\":{\"edit\":{\"label\":\"slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"slug\",\"searchable\":true,\"sortable\":true}},\"SEO\":{\"edit\":{\"label\":\"SEO\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"SEO\",\"searchable\":false,\"sortable\":false}},\"block\":{\"edit\":{\"label\":\"block\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"block\",\"searchable\":false,\"sortable\":false}},\"publish_at\":{\"edit\":{\"label\":\"publish_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"publish_at\",\"searchable\":true,\"sortable\":true}},\"createdAt\":{\"edit\":{\"label\":\"createdAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"createdAt\",\"searchable\":true,\"sortable\":true}},\"updatedAt\":{\"edit\":{\"label\":\"updatedAt\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"updatedAt\",\"searchable\":true,\"sortable\":true}},\"createdBy\":{\"edit\":{\"label\":\"createdBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"createdBy\",\"searchable\":true,\"sortable\":true}},\"updatedBy\":{\"edit\":{\"label\":\"updatedBy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true,\"mainField\":\"firstname\"},\"list\":{\"label\":\"updatedBy\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"title\",\"slug\",\"SEO\"],\"edit\":[[{\"name\":\"title\",\"size\":6},{\"name\":\"slug\",\"size\":6}],[{\"name\":\"SEO\",\"size\":12}],[{\"name\":\"block\",\"size\":12}],[{\"name\":\"publish_at\",\"size\":6}]]},\"uid\":\"api::page.page\"}','object',NULL,NULL),(44,'plugin_content_manager_configuration_components::page.zagolovok','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"title\":{\"edit\":{\"label\":\"title\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"title\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"label\",\"title\"],\"edit\":[[{\"name\":\"theme\",\"size\":6},{\"name\":\"label\",\"size\":6}],[{\"name\":\"title\",\"size\":6}]]},\"uid\":\"page.zagolovok\",\"isComponent\":true}','object',NULL,NULL),(45,'plugin_content_manager_configuration_components::page.ssylka','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"href\",\"defaultSortBy\":\"href\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"href\":{\"edit\":{\"label\":\"href\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"href\",\"searchable\":true,\"sortable\":true}},\"label\":{\"edit\":{\"label\":\"label\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"label\",\"searchable\":true,\"sortable\":true}},\"target\":{\"edit\":{\"label\":\"target\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"target\",\"searchable\":true,\"sortable\":true}},\"isExternal\":{\"edit\":{\"label\":\"isExternal\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"isExternal\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"href\",\"label\",\"target\"],\"edit\":[[{\"name\":\"href\",\"size\":6},{\"name\":\"label\",\"size\":6}],[{\"name\":\"target\",\"size\":6},{\"name\":\"isExternal\",\"size\":4}]]},\"uid\":\"page.ssylka\",\"isComponent\":true}','object',NULL,NULL),(46,'plugin_content_manager_configuration_components::page.knopki','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"theme\":{\"edit\":{\"label\":\"theme\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"theme\",\"searchable\":true,\"sortable\":true}},\"link\":{\"edit\":{\"label\":\"link\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"link\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"theme\",\"link\"],\"edit\":[[{\"name\":\"theme\",\"size\":6}],[{\"name\":\"link\",\"size\":12}]]},\"uid\":\"page.knopki\",\"isComponent\":true}','object',NULL,NULL),(47,'plugin_content_manager_configuration_components::page.info-blok','{\"settings\":{\"bulkable\":true,\"filterable\":true,\"searchable\":true,\"pageSize\":10,\"mainField\":\"id\",\"defaultSortBy\":\"id\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"id\",\"searchable\":false,\"sortable\":false}},\"header\":{\"edit\":{\"label\":\"header\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"header\",\"searchable\":false,\"sortable\":false}},\"media\":{\"edit\":{\"label\":\"media\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"media\",\"searchable\":false,\"sortable\":false}},\"description\":{\"edit\":{\"label\":\"description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"description\",\"searchable\":false,\"sortable\":false}},\"is_video\":{\"edit\":{\"label\":\"is_video\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"is_video\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"header\",\"media\",\"is_video\"],\"edit\":[[{\"name\":\"header\",\"size\":12}],[{\"name\":\"description\",\"size\":12}],[{\"name\":\"media\",\"size\":6},{\"name\":\"is_video\",\"size\":4}]]},\"uid\":\"page.info-blok\",\"isComponent\":true}','object',NULL,NULL);
/*!40000 ALTER TABLE `strapi_core_store_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_database_schema`
--

DROP TABLE IF EXISTS `strapi_database_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_database_schema` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `schema` json DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_database_schema`
--

LOCK TABLES `strapi_database_schema` WRITE;
/*!40000 ALTER TABLE `strapi_database_schema` DISABLE KEYS */;
INSERT INTO `strapi_database_schema` VALUES (48,'{\"tables\": [{\"name\": \"files\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"alternative_text\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"caption\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"width\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"height\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"formats\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"hash\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"ext\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"mime\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [10, 2], \"name\": \"size\", \"type\": \"decimal\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"preview_url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider_metadata\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_files_folder_path_index\", \"type\": null, \"columns\": [\"folder_path\"]}, {\"name\": \"upload_files_created_at_index\", \"type\": null, \"columns\": [\"created_at\"]}, {\"name\": \"upload_files_updated_at_index\", \"type\": null, \"columns\": [\"updated_at\"]}, {\"name\": \"upload_files_name_index\", \"type\": null, \"columns\": [\"name\"]}, {\"name\": \"upload_files_size_index\", \"type\": null, \"columns\": [\"size\"]}, {\"name\": \"upload_files_ext_index\", \"type\": null, \"columns\": [\"ext\"]}, {\"name\": \"files_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"files_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path_id\", \"type\": \"integer\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"path\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_path_id_index\", \"type\": \"unique\", \"columns\": [\"path_id\"]}, {\"name\": \"upload_folders_path_index\", \"type\": \"unique\", \"columns\": [\"path\"]}, {\"name\": \"upload_folders_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"i18n_locale\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"i18n_locale_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"i18n_locale_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"i18n_locale_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_releases\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"released_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"scheduled_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"timezone\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"status\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_releases_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_releases_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_releases_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_releases_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_releases_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_release_actions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"content_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"entry_document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_entry_valid\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_release_actions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_release_actions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_release_actions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_release_actions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_release_actions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"content_types\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_workflows_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_workflows_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"color\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stages_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_workflows_stages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_workflows_stages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_roles_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"provider\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmation_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"confirmed\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"up_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"pages_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"pages_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"pages_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"pages_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"pages_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"pages_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"pages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"pages\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"slug\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"publish_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"pages_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"pages_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"pages_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"pages_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sections_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sections_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"sections_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"sections_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"sections_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"sections_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sections\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"sections\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"sections_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"sections_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"sections_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"sections_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"sections_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"top_menus_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"top_menus_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"top_menus_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"top_menus_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"top_menus_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"top_menus_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"top_menus\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"top_menus\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"top_menus_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"top_menus_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"top_menus_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"top_menus_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"top_menus_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action_parameters\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"subject\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"properties\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"conditions\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"firstname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lastname\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"username\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"email\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"password\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"reset_password_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"registration_token\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_active\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"blocked\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"prefered_language\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_users_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_roles\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"code\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_roles_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"admin_roles_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_roles_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_tokens_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_tokens\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"description\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"access_key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"last_used_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"expires_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"lifespan\", \"type\": \"bigInteger\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_tokens_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_tokens_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_tokens_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"action\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"updated_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"published_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"updated_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_documents_idx\", \"columns\": [\"document_id\", \"locale\", \"published_at\"]}, {\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_updated_by_id_fk\", \"columns\": [\"updated_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_seo_meta_fields\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_page_zagolovok\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"theme\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"label\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"title\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_page_ssylka\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"href\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"label\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"target\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_external\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_page_seos_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_page_seos_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"components_page_seos_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"components_page_seos_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_page_seos_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_page_seos_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_page_seos\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_page_seos\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"meta_title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"meta_description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"prevent_indexing\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"structured_data\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_page_pervyj_ekran_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_page_pervyj_ekran_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"components_page_pervyj_ekran_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"components_page_pervyj_ekran_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_page_pervyj_ekran_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_page_pervyj_ekran_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_page_pervyj_ekran\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_page_pervyj_ekran\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [\"longtext\"], \"name\": \"text\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_page_knopki_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_page_knopki_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"components_page_knopki_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"components_page_knopki_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_page_knopki_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_page_knopki_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_page_knopki\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_page_knopki\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"theme\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_page_info_blok_cmps\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"entity_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"cmp_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"component_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_page_info_blok_field_idx\", \"columns\": [\"field\"]}, {\"name\": \"components_page_info_blok_component_type_idx\", \"columns\": [\"component_type\"]}, {\"name\": \"components_page_info_blok_entity_fk\", \"columns\": [\"entity_id\"]}, {\"name\": \"components_page_info_blok_uq\", \"type\": \"unique\", \"columns\": [\"entity_id\", \"cmp_id\", \"field\", \"component_type\"]}], \"foreignKeys\": [{\"name\": \"components_page_info_blok_entity_fk\", \"columns\": [\"entity_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_page_info_blok\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_page_info_blok\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"description\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"is_video\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_menu_vypadayushhee_menyu\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_menu_ssylka\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"description\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_menu_punkt_menyu\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_menu_logos\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"components_menu_knopka\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"title\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"url\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_core_store_settings\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"key\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"value\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"environment\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"tag\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_webhooks\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"name\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [\"longtext\"], \"name\": \"url\", \"type\": \"text\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"headers\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"events\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"enabled\", \"type\": \"boolean\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [], \"foreignKeys\": []}, {\"name\": \"strapi_history_versions\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"content_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"related_document_id\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"locale\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"status\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"data\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"schema\", \"type\": \"jsonb\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [{\"useTz\": false, \"precision\": 6}], \"name\": \"created_at\", \"type\": \"datetime\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"created_by_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_history_versions_created_by_id_fk\", \"columns\": [\"created_by_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_history_versions_created_by_id_fk\", \"columns\": [\"created_by_id\"], \"onDelete\": \"SET NULL\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_related_mph\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"related_type\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"field\", \"type\": \"string\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"order\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_related_mph_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_related_mph_oidx\", \"columns\": [\"order\"]}, {\"name\": \"files_related_mph_idix\", \"columns\": [\"related_id\"]}], \"foreignKeys\": [{\"name\": \"files_related_mph_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"files_folder_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"file_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"file_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"files_folder_lnk_fk\", \"columns\": [\"file_id\"]}, {\"name\": \"files_folder_lnk_ifk\", \"columns\": [\"folder_id\"]}, {\"name\": \"files_folder_lnk_uq\", \"type\": \"unique\", \"columns\": [\"file_id\", \"folder_id\"]}, {\"name\": \"files_folder_lnk_oifk\", \"columns\": [\"file_ord\"]}], \"foreignKeys\": [{\"name\": \"files_folder_lnk_fk\", \"columns\": [\"file_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"files\", \"referencedColumns\": [\"id\"]}, {\"name\": \"files_folder_lnk_ifk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"upload_folders_parent_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"inv_folder_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"folder_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"upload_folders_parent_lnk_fk\", \"columns\": [\"folder_id\"]}, {\"name\": \"upload_folders_parent_lnk_ifk\", \"columns\": [\"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_lnk_uq\", \"type\": \"unique\", \"columns\": [\"folder_id\", \"inv_folder_id\"]}, {\"name\": \"upload_folders_parent_lnk_oifk\", \"columns\": [\"folder_ord\"]}], \"foreignKeys\": [{\"name\": \"upload_folders_parent_lnk_fk\", \"columns\": [\"folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}, {\"name\": \"upload_folders_parent_lnk_ifk\", \"columns\": [\"inv_folder_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"upload_folders\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_release_actions_release_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"release_action_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"release_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"release_action_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_release_actions_release_lnk_fk\", \"columns\": [\"release_action_id\"]}, {\"name\": \"strapi_release_actions_release_lnk_ifk\", \"columns\": [\"release_id\"]}, {\"name\": \"strapi_release_actions_release_lnk_uq\", \"type\": \"unique\", \"columns\": [\"release_action_id\", \"release_id\"]}, {\"name\": \"strapi_release_actions_release_lnk_oifk\", \"columns\": [\"release_action_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_release_actions_release_lnk_fk\", \"columns\": [\"release_action_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_release_actions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_release_actions_release_lnk_ifk\", \"columns\": [\"release_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_releases\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"workflow_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"workflow_stage_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stage_required_to_publish_lnk_fk\", \"columns\": [\"workflow_id\"]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk_ifk\", \"columns\": [\"workflow_stage_id\"]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk_uq\", \"type\": \"unique\", \"columns\": [\"workflow_id\", \"workflow_stage_id\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stage_required_to_publish_lnk_fk\", \"columns\": [\"workflow_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stage_required_to_publish_lnk_ifk\", \"columns\": [\"workflow_stage_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows_stages\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stages_workflow_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"workflow_stage_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"workflow_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"workflow_stage_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stages_workflow_lnk_fk\", \"columns\": [\"workflow_stage_id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_ifk\", \"columns\": [\"workflow_id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_uq\", \"type\": \"unique\", \"columns\": [\"workflow_stage_id\", \"workflow_id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_oifk\", \"columns\": [\"workflow_stage_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stages_workflow_lnk_fk\", \"columns\": [\"workflow_stage_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows_stages\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stages_workflow_lnk_ifk\", \"columns\": [\"workflow_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_workflows_stages_permissions_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"workflow_stage_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_workflows_stages_permissions_lnk_fk\", \"columns\": [\"workflow_stage_id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_ifk\", \"columns\": [\"permission_id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_uq\", \"type\": \"unique\", \"columns\": [\"workflow_stage_id\", \"permission_id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_ofk\", \"columns\": [\"permission_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_workflows_stages_permissions_lnk_fk\", \"columns\": [\"workflow_stage_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_workflows_stages\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_workflows_stages_permissions_lnk_ifk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_permissions_role_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"up_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_permissions_role_lnk_uq\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"up_permissions_role_lnk_oifk\", \"columns\": [\"permission_ord\"]}], \"foreignKeys\": [{\"name\": \"up_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"up_users_role_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"up_users_role_lnk_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"up_users_role_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"up_users_role_lnk_uq\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"up_users_role_lnk_oifk\", \"columns\": [\"user_ord\"]}], \"foreignKeys\": [{\"name\": \"up_users_role_lnk_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"up_users_role_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"up_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_permissions_role_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"]}, {\"name\": \"admin_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_permissions_role_lnk_uq\", \"type\": \"unique\", \"columns\": [\"permission_id\", \"role_id\"]}, {\"name\": \"admin_permissions_role_lnk_oifk\", \"columns\": [\"permission_ord\"]}], \"foreignKeys\": [{\"name\": \"admin_permissions_role_lnk_fk\", \"columns\": [\"permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_permissions_role_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"admin_users_roles_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"user_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"role_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"user_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"admin_users_roles_lnk_fk\", \"columns\": [\"user_id\"]}, {\"name\": \"admin_users_roles_lnk_ifk\", \"columns\": [\"role_id\"]}, {\"name\": \"admin_users_roles_lnk_uq\", \"type\": \"unique\", \"columns\": [\"user_id\", \"role_id\"]}, {\"name\": \"admin_users_roles_lnk_ofk\", \"columns\": [\"role_ord\"]}, {\"name\": \"admin_users_roles_lnk_oifk\", \"columns\": [\"user_ord\"]}], \"foreignKeys\": [{\"name\": \"admin_users_roles_lnk_fk\", \"columns\": [\"user_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_users\", \"referencedColumns\": [\"id\"]}, {\"name\": \"admin_users_roles_lnk_ifk\", \"columns\": [\"role_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"admin_roles\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_api_token_permissions_token_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"api_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"api_token_permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_api_token_permissions_token_lnk_fk\", \"columns\": [\"api_token_permission_id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_ifk\", \"columns\": [\"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_uq\", \"type\": \"unique\", \"columns\": [\"api_token_permission_id\", \"api_token_id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_oifk\", \"columns\": [\"api_token_permission_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_api_token_permissions_token_lnk_fk\", \"columns\": [\"api_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_api_token_permissions_token_lnk_ifk\", \"columns\": [\"api_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_api_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"transfer_token_permission_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"transfer_token_permission_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"strapi_transfer_token_permissions_token_lnk_fk\", \"columns\": [\"transfer_token_permission_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_ifk\", \"columns\": [\"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_uq\", \"type\": \"unique\", \"columns\": [\"transfer_token_permission_id\", \"transfer_token_id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_oifk\", \"columns\": [\"transfer_token_permission_ord\"]}], \"foreignKeys\": [{\"name\": \"strapi_transfer_token_permissions_token_lnk_fk\", \"columns\": [\"transfer_token_permission_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_token_permissions\", \"referencedColumns\": [\"id\"]}, {\"name\": \"strapi_transfer_token_permissions_token_lnk_ifk\", \"columns\": [\"transfer_token_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"strapi_transfer_tokens\", \"referencedColumns\": [\"id\"]}]}, {\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk\", \"columns\": [{\"args\": [{\"primary\": true, \"primaryKey\": true}], \"name\": \"id\", \"type\": \"increments\", \"unsigned\": false, \"defaultTo\": null, \"notNullable\": true}, {\"args\": [], \"name\": \"vypadayushhee_menyu_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"section_id\", \"type\": \"integer\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}, {\"args\": [], \"name\": \"section_ord\", \"type\": \"double\", \"unsigned\": true, \"defaultTo\": null, \"notNullable\": false}], \"indexes\": [{\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk_fk\", \"columns\": [\"vypadayushhee_menyu_id\"]}, {\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk_ifk\", \"columns\": [\"section_id\"]}, {\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk_uq\", \"type\": \"unique\", \"columns\": [\"vypadayushhee_menyu_id\", \"section_id\"]}, {\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk_ofk\", \"columns\": [\"section_ord\"]}], \"foreignKeys\": [{\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk_fk\", \"columns\": [\"vypadayushhee_menyu_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"components_menu_vypadayushhee_menyu\", \"referencedColumns\": [\"id\"]}, {\"name\": \"components_menu_vypadayushhee_menyu_sections_lnk_ifk\", \"columns\": [\"section_id\"], \"onDelete\": \"CASCADE\", \"referencedTable\": \"sections\", \"referencedColumns\": [\"id\"]}]}]}','2025-09-23 14:37:26','aebb6def19abb24202dabf70306a3002');
/*!40000 ALTER TABLE `strapi_database_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_history_versions`
--

DROP TABLE IF EXISTS `strapi_history_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_history_versions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) NOT NULL,
  `related_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `data` json DEFAULT NULL,
  `schema` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_history_versions_created_by_id_fk` (`created_by_id`),
  CONSTRAINT `strapi_history_versions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_history_versions`
--

LOCK TABLES `strapi_history_versions` WRITE;
/*!40000 ALTER TABLE `strapi_history_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_history_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations`
--

DROP TABLE IF EXISTS `strapi_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations`
--

LOCK TABLES `strapi_migrations` WRITE;
/*!40000 ALTER TABLE `strapi_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_migrations_internal`
--

DROP TABLE IF EXISTS `strapi_migrations_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_migrations_internal` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_migrations_internal`
--

LOCK TABLES `strapi_migrations_internal` WRITE;
/*!40000 ALTER TABLE `strapi_migrations_internal` DISABLE KEYS */;
INSERT INTO `strapi_migrations_internal` VALUES (1,'5.0.0-rename-identifiers-longer-than-max-length','2025-09-10 12:29:06'),(2,'5.0.0-02-created-document-id','2025-09-10 12:29:06'),(3,'5.0.0-03-created-locale','2025-09-10 12:29:06'),(4,'5.0.0-04-created-published-at','2025-09-10 12:29:06'),(5,'5.0.0-05-drop-slug-fields-index','2025-09-10 12:29:06'),(6,'core::5.0.0-discard-drafts','2025-09-10 12:29:06');
/*!40000 ALTER TABLE `strapi_migrations_internal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_release_actions`
--

DROP TABLE IF EXISTS `strapi_release_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_release_actions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `entry_document_id` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `is_entry_valid` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_release_actions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_release_actions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_release_actions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_release_actions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_release_actions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_release_actions`
--

LOCK TABLES `strapi_release_actions` WRITE;
/*!40000 ALTER TABLE `strapi_release_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_release_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_release_actions_release_lnk`
--

DROP TABLE IF EXISTS `strapi_release_actions_release_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_release_actions_release_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `release_action_id` int unsigned DEFAULT NULL,
  `release_id` int unsigned DEFAULT NULL,
  `release_action_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_release_actions_release_lnk_uq` (`release_action_id`,`release_id`),
  KEY `strapi_release_actions_release_lnk_fk` (`release_action_id`),
  KEY `strapi_release_actions_release_lnk_ifk` (`release_id`),
  KEY `strapi_release_actions_release_lnk_oifk` (`release_action_ord`),
  CONSTRAINT `strapi_release_actions_release_lnk_fk` FOREIGN KEY (`release_action_id`) REFERENCES `strapi_release_actions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_release_actions_release_lnk_ifk` FOREIGN KEY (`release_id`) REFERENCES `strapi_releases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_release_actions_release_lnk`
--

LOCK TABLES `strapi_release_actions_release_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_release_actions_release_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_release_actions_release_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_releases`
--

DROP TABLE IF EXISTS `strapi_releases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_releases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `released_at` datetime(6) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_releases_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_releases_created_by_id_fk` (`created_by_id`),
  KEY `strapi_releases_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_releases_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_releases_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_releases`
--

LOCK TABLES `strapi_releases` WRITE;
/*!40000 ALTER TABLE `strapi_releases` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_releases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_token_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_transfer_token_permissions_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_token_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_token_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_token_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions`
--

LOCK TABLES `strapi_transfer_token_permissions` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_token_permissions_token_lnk`
--

DROP TABLE IF EXISTS `strapi_transfer_token_permissions_token_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_token_permissions_token_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transfer_token_permission_id` int unsigned DEFAULT NULL,
  `transfer_token_id` int unsigned DEFAULT NULL,
  `transfer_token_permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_transfer_token_permissions_token_lnk_uq` (`transfer_token_permission_id`,`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_fk` (`transfer_token_permission_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_ifk` (`transfer_token_id`),
  KEY `strapi_transfer_token_permissions_token_lnk_oifk` (`transfer_token_permission_ord`),
  CONSTRAINT `strapi_transfer_token_permissions_token_lnk_fk` FOREIGN KEY (`transfer_token_permission_id`) REFERENCES `strapi_transfer_token_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_transfer_token_permissions_token_lnk_ifk` FOREIGN KEY (`transfer_token_id`) REFERENCES `strapi_transfer_tokens` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_token_permissions_token_lnk`
--

LOCK TABLES `strapi_transfer_token_permissions_token_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_token_permissions_token_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_transfer_tokens`
--

DROP TABLE IF EXISTS `strapi_transfer_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_transfer_tokens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `access_key` varchar(255) DEFAULT NULL,
  `last_used_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `lifespan` bigint DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_transfer_tokens_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_transfer_tokens_created_by_id_fk` (`created_by_id`),
  KEY `strapi_transfer_tokens_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_transfer_tokens_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_transfer_tokens_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_transfer_tokens`
--

LOCK TABLES `strapi_transfer_tokens` WRITE;
/*!40000 ALTER TABLE `strapi_transfer_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_transfer_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_webhooks`
--

DROP TABLE IF EXISTS `strapi_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_webhooks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` longtext,
  `headers` json DEFAULT NULL,
  `events` json DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_webhooks`
--

LOCK TABLES `strapi_webhooks` WRITE;
/*!40000 ALTER TABLE `strapi_webhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_webhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows`
--

DROP TABLE IF EXISTS `strapi_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content_types` json DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_workflows_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_workflows_created_by_id_fk` (`created_by_id`),
  KEY `strapi_workflows_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_workflows_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_workflows_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows`
--

LOCK TABLES `strapi_workflows` WRITE;
/*!40000 ALTER TABLE `strapi_workflows` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stage_required_to_publish_lnk`
--

DROP TABLE IF EXISTS `strapi_workflows_stage_required_to_publish_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stage_required_to_publish_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `workflow_id` int unsigned DEFAULT NULL,
  `workflow_stage_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stage_required_to_publish_lnk_uq` (`workflow_id`,`workflow_stage_id`),
  KEY `strapi_workflows_stage_required_to_publish_lnk_fk` (`workflow_id`),
  KEY `strapi_workflows_stage_required_to_publish_lnk_ifk` (`workflow_stage_id`),
  CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_fk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stage_required_to_publish_lnk_ifk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stage_required_to_publish_lnk`
--

LOCK TABLES `strapi_workflows_stage_required_to_publish_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stage_required_to_publish_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stages`
--

DROP TABLE IF EXISTS `strapi_workflows_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strapi_workflows_stages_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `strapi_workflows_stages_created_by_id_fk` (`created_by_id`),
  KEY `strapi_workflows_stages_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `strapi_workflows_stages_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `strapi_workflows_stages_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stages`
--

LOCK TABLES `strapi_workflows_stages` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stages` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stages_permissions_lnk`
--

DROP TABLE IF EXISTS `strapi_workflows_stages_permissions_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stages_permissions_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `workflow_stage_id` int unsigned DEFAULT NULL,
  `permission_id` int unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stages_permissions_lnk_uq` (`workflow_stage_id`,`permission_id`),
  KEY `strapi_workflows_stages_permissions_lnk_fk` (`workflow_stage_id`),
  KEY `strapi_workflows_stages_permissions_lnk_ifk` (`permission_id`),
  KEY `strapi_workflows_stages_permissions_lnk_ofk` (`permission_ord`),
  CONSTRAINT `strapi_workflows_stages_permissions_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stages_permissions_lnk_ifk` FOREIGN KEY (`permission_id`) REFERENCES `admin_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stages_permissions_lnk`
--

LOCK TABLES `strapi_workflows_stages_permissions_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stages_permissions_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stages_permissions_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strapi_workflows_stages_workflow_lnk`
--

DROP TABLE IF EXISTS `strapi_workflows_stages_workflow_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strapi_workflows_stages_workflow_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `workflow_stage_id` int unsigned DEFAULT NULL,
  `workflow_id` int unsigned DEFAULT NULL,
  `workflow_stage_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `strapi_workflows_stages_workflow_lnk_uq` (`workflow_stage_id`,`workflow_id`),
  KEY `strapi_workflows_stages_workflow_lnk_fk` (`workflow_stage_id`),
  KEY `strapi_workflows_stages_workflow_lnk_ifk` (`workflow_id`),
  KEY `strapi_workflows_stages_workflow_lnk_oifk` (`workflow_stage_ord`),
  CONSTRAINT `strapi_workflows_stages_workflow_lnk_fk` FOREIGN KEY (`workflow_stage_id`) REFERENCES `strapi_workflows_stages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `strapi_workflows_stages_workflow_lnk_ifk` FOREIGN KEY (`workflow_id`) REFERENCES `strapi_workflows` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strapi_workflows_stages_workflow_lnk`
--

LOCK TABLES `strapi_workflows_stages_workflow_lnk` WRITE;
/*!40000 ALTER TABLE `strapi_workflows_stages_workflow_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `strapi_workflows_stages_workflow_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_menus`
--

DROP TABLE IF EXISTS `top_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `top_menus_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `top_menus_created_by_id_fk` (`created_by_id`),
  KEY `top_menus_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `top_menus_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `top_menus_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_menus`
--

LOCK TABLES `top_menus` WRITE;
/*!40000 ALTER TABLE `top_menus` DISABLE KEYS */;
INSERT INTO `top_menus` VALUES (1,'dhynfeizmrbkwveh74r30lc1','2025-09-11 07:22:06.989000','2025-09-16 08:36:55.892000',NULL,1,1,'ru'),(13,'dhynfeizmrbkwveh74r30lc1','2025-09-11 07:22:06.989000','2025-09-16 08:36:55.892000','2025-09-16 08:36:55.920000',1,1,'ru');
/*!40000 ALTER TABLE `top_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_menus_cmps`
--

DROP TABLE IF EXISTS `top_menus_cmps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top_menus_cmps` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entity_id` int unsigned DEFAULT NULL,
  `cmp_id` int unsigned DEFAULT NULL,
  `component_type` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `order` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `top_menus_uq` (`entity_id`,`cmp_id`,`field`,`component_type`),
  KEY `top_menus_field_idx` (`field`),
  KEY `top_menus_component_type_idx` (`component_type`),
  KEY `top_menus_entity_fk` (`entity_id`),
  CONSTRAINT `top_menus_entity_fk` FOREIGN KEY (`entity_id`) REFERENCES `top_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_menus_cmps`
--

LOCK TABLES `top_menus_cmps` WRITE;
/*!40000 ALTER TABLE `top_menus_cmps` DISABLE KEYS */;
INSERT INTO `top_menus_cmps` VALUES (137,1,3,'menu.logo','MainMenuItems',1),(138,1,1,'menu.vypadayushhee-menyu','MainMenuItems',2),(139,1,12,'menu.ssylka','MainMenuItems',3),(140,1,47,'menu.ssylka','MainMenuItems',4),(141,1,13,'menu.ssylka','MainMenuItems',5),(142,1,1,'menu.knopka','MainMenuItems',6),(143,13,6,'menu.logo','MainMenuItems',1),(144,13,20,'menu.vypadayushhee-menyu','MainMenuItems',2),(145,13,68,'menu.ssylka','MainMenuItems',3),(146,13,69,'menu.ssylka','MainMenuItems',4),(147,13,70,'menu.ssylka','MainMenuItems',5),(148,13,12,'menu.knopka','MainMenuItems',6);
/*!40000 ALTER TABLE `top_menus_cmps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions`
--

DROP TABLE IF EXISTS `up_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_permissions_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_permissions_created_by_id_fk` (`created_by_id`),
  KEY `up_permissions_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_permissions_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_permissions_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions`
--

LOCK TABLES `up_permissions` WRITE;
/*!40000 ALTER TABLE `up_permissions` DISABLE KEYS */;
INSERT INTO `up_permissions` VALUES (1,'xapm06ygppcbt61sld5h66il','plugin::users-permissions.user.me','2025-09-10 12:29:07.652000','2025-09-10 12:29:07.652000','2025-09-10 12:29:07.653000',NULL,NULL,NULL),(2,'z6rdeehjxlj28zirrgf6n6t7','plugin::users-permissions.auth.changePassword','2025-09-10 12:29:07.652000','2025-09-10 12:29:07.652000','2025-09-10 12:29:07.653000',NULL,NULL,NULL),(3,'yfxxiyt0umy6pd8iz8jft2pi','plugin::users-permissions.auth.callback','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000',NULL,NULL,NULL),(4,'gmsjrchtdf0inpy2v4ub1upt','plugin::users-permissions.auth.connect','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000',NULL,NULL,NULL),(5,'cuigwkkavqze0xyh4be7n5km','plugin::users-permissions.auth.forgotPassword','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000',NULL,NULL,NULL),(6,'n0k0i38k02akq07eayts2zyd','plugin::users-permissions.auth.resetPassword','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000',NULL,NULL,NULL),(7,'gi84bh8lliu7tszy0hilxx9r','plugin::users-permissions.auth.register','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000',NULL,NULL,NULL),(8,'ja94g1esg68el3eskxwvftqk','plugin::users-permissions.auth.emailConfirmation','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.660000',NULL,NULL,NULL),(9,'cxntksu3yto7gipdinzl7o82','plugin::users-permissions.auth.sendEmailConfirmation','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.659000','2025-09-10 12:29:07.660000',NULL,NULL,NULL),(10,'pr8a7il41abu3sl0v61d4oqg','plugin::content-type-builder.components.getComponents','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.841000',NULL,NULL,NULL),(11,'y8ibox9zeh85a9ierxi5slec','plugin::content-type-builder.components.getComponent','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.842000',NULL,NULL,NULL),(12,'pvezkt0mzkfi57cvnzq8y0un','plugin::content-type-builder.content-types.getContentTypes','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.842000',NULL,NULL,NULL),(13,'np41y8e3qft1uak3y8k2gqjc','plugin::content-type-builder.content-types.getContentType','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.843000',NULL,NULL,NULL),(14,'f5a8owekqxegy0ghfik1vmq1','plugin::email.email.send','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.844000',NULL,NULL,NULL),(15,'o7pujyq3f2ebwxu3rq4imff8','plugin::upload.content-api.find','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.844000',NULL,NULL,NULL),(16,'irxknr5v46ojwk48eoopmbsg','plugin::upload.content-api.findOne','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.845000',NULL,NULL,NULL),(17,'hucqiqavwa6fyvxx8cwotfgy','plugin::upload.content-api.destroy','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.845000',NULL,NULL,NULL),(18,'ey5w5gdcii9klwkbd4u3a1hp','plugin::upload.content-api.upload','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.846000',NULL,NULL,NULL),(19,'duoms0yjwawqv5s11zbg71a0','plugin::i18n.locales.listLocales','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.847000',NULL,NULL,NULL),(20,'gcfbhq4jqnrs6opa8dket1q5','plugin::users-permissions.auth.callback','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.847000',NULL,NULL,NULL),(21,'qksk3dvawzicjm67av75xwew','plugin::users-permissions.auth.resetPassword','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.848000',NULL,NULL,NULL),(22,'zfaujs0qlhub181i68w2yffo','plugin::users-permissions.auth.connect','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.848000',NULL,NULL,NULL),(23,'oaplbk7arvuj2ug7fwf60kxm','plugin::users-permissions.auth.forgotPassword','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.849000',NULL,NULL,NULL),(24,'khxe302fx225y36kg6nqsj01','plugin::users-permissions.auth.register','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(25,'fv3nl2hf82zfcygiddyepilw','plugin::users-permissions.auth.emailConfirmation','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(26,'csrbnopeipvnq7km2q2tz1pn','plugin::users-permissions.auth.sendEmailConfirmation','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(27,'ec75a0wtiephn3io6d70rca5','plugin::users-permissions.user.create','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(28,'tql0dnhv1vuxoxv1yfm9amuh','plugin::users-permissions.user.update','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(29,'xl8g0bkkbo5cjg0p0331ik27','plugin::users-permissions.user.find','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(30,'dfso63vvm01n3zxetreo2fo0','plugin::users-permissions.user.findOne','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(31,'xo9qt8m6cy44hg9jvrv4hmin','plugin::users-permissions.user.count','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(32,'wn9gycicv9d3dtkf7pyg2uum','plugin::users-permissions.user.destroy','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(33,'heys96qdn1ahqubazbfsukoe','plugin::users-permissions.role.createRole','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(34,'sw2lsi3doqusc3etngq3t76m','plugin::users-permissions.role.findOne','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(35,'f22q4cbw5urogm4t6sguy5ag','plugin::users-permissions.role.find','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(36,'bqlqcfkntuz45cgu508vx14f','plugin::users-permissions.role.updateRole','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(37,'zlw4owk3gmep2u1jzqj1i41d','plugin::users-permissions.role.deleteRole','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.850000',NULL,NULL,NULL),(38,'l09l7g2ryd90joqqdhb6td0s','plugin::users-permissions.permissions.getPermissions','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.839000','2025-09-10 12:32:42.851000',NULL,NULL,NULL),(48,'gpcjecdpjgudluavugnkzui5','api::top-menu.top-menu.find','2025-09-11 08:05:46.369000','2025-09-11 08:05:46.369000','2025-09-11 08:05:46.370000',NULL,NULL,NULL),(49,'tddw9jbr0nul9bpa69wb8pdv','api::section.section.find','2025-09-11 08:59:24.100000','2025-09-11 08:59:24.100000','2025-09-11 08:59:24.102000',NULL,NULL,NULL),(50,'ogararu7zjok2rlqtrragl2k','api::section.section.findOne','2025-09-11 08:59:24.100000','2025-09-11 08:59:24.100000','2025-09-11 08:59:24.103000',NULL,NULL,NULL),(51,'zcsmmou7m1ufn7wfta9l6033','api::section.section.find','2025-09-12 11:33:27.001000','2025-09-12 11:33:27.001000','2025-09-12 11:33:27.002000',NULL,NULL,NULL),(52,'dk7dwt1amigrlau6se9mj95n','api::section.section.findOne','2025-09-12 11:33:27.001000','2025-09-12 11:33:27.001000','2025-09-12 11:33:27.003000',NULL,NULL,NULL),(53,'jbxr7koa84n5st2z8z2mgc91','api::top-menu.top-menu.find','2025-09-12 11:33:27.001000','2025-09-12 11:33:27.001000','2025-09-12 11:33:27.004000',NULL,NULL,NULL),(54,'ilpaao8zpw3rc8ab2kxltgwm','api::page.page.find','2025-09-16 11:24:24.165000','2025-09-16 11:24:24.165000','2025-09-16 11:24:24.167000',NULL,NULL,NULL),(55,'oipj2bb4jej4igasv9ola5hg','api::page.page.findOne','2025-09-16 11:24:24.165000','2025-09-16 11:24:24.165000','2025-09-16 11:24:24.169000',NULL,NULL,NULL),(56,'fa04htjd7z5ufy4juykgosbd','api::page.page.find','2025-09-16 14:17:23.705000','2025-09-16 14:17:23.705000','2025-09-16 14:17:23.706000',NULL,NULL,NULL),(57,'x2zi9p2khub4hzxshfwzo4dy','api::page.page.findOne','2025-09-16 14:17:23.705000','2025-09-16 14:17:23.705000','2025-09-16 14:17:23.707000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `up_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_permissions_role_lnk`
--

DROP TABLE IF EXISTS `up_permissions_role_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_permissions_role_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `permission_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_permissions_role_lnk_uq` (`permission_id`,`role_id`),
  KEY `up_permissions_role_lnk_fk` (`permission_id`),
  KEY `up_permissions_role_lnk_ifk` (`role_id`),
  KEY `up_permissions_role_lnk_oifk` (`permission_ord`),
  CONSTRAINT `up_permissions_role_lnk_fk` FOREIGN KEY (`permission_id`) REFERENCES `up_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_permissions_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_permissions_role_lnk`
--

LOCK TABLES `up_permissions_role_lnk` WRITE;
/*!40000 ALTER TABLE `up_permissions_role_lnk` DISABLE KEYS */;
INSERT INTO `up_permissions_role_lnk` VALUES (1,1,1,1),(2,2,1,1),(3,3,2,1),(4,4,2,1),(5,8,2,2),(6,6,2,2),(7,5,2,2),(8,9,2,2),(9,7,2,2),(10,10,1,2),(11,11,1,2),(12,12,1,2),(13,15,1,2),(14,14,1,2),(15,13,1,2),(16,16,1,2),(17,19,1,2),(18,18,1,3),(19,25,1,3),(20,23,1,3),(21,24,1,3),(22,22,1,3),(23,17,1,4),(24,21,1,4),(25,20,1,4),(26,26,1,4),(27,27,1,4),(28,29,1,4),(29,32,1,4),(30,31,1,4),(31,33,1,4),(32,36,1,5),(33,30,1,5),(34,34,1,6),(35,35,1,6),(36,28,1,6),(37,37,1,6),(38,38,1,6),(48,48,1,7),(49,49,1,8),(50,50,1,8),(51,51,2,3),(52,52,2,3),(53,53,2,3),(54,54,2,4),(55,55,2,4),(56,56,1,9),(57,57,1,9);
/*!40000 ALTER TABLE `up_permissions_role_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_roles`
--

DROP TABLE IF EXISTS `up_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_roles_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_roles_created_by_id_fk` (`created_by_id`),
  KEY `up_roles_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_roles_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_roles_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_roles`
--

LOCK TABLES `up_roles` WRITE;
/*!40000 ALTER TABLE `up_roles` DISABLE KEYS */;
INSERT INTO `up_roles` VALUES (1,'zshf0yqh6fnq7ijye3eg1aut','Authenticated','Default role given to authenticated user.','authenticated','2025-09-10 12:29:07.645000','2025-09-16 14:17:23.691000','2025-09-10 12:29:07.646000',NULL,NULL,NULL),(2,'ymfcvmda2qjw8ng0e3yo2usd','Public','Default role given to unauthenticated user.','public','2025-09-10 12:29:07.648000','2025-09-16 11:24:24.151000','2025-09-10 12:29:07.649000',NULL,NULL,NULL);
/*!40000 ALTER TABLE `up_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users`
--

DROP TABLE IF EXISTS `up_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `up_users_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `up_users_created_by_id_fk` (`created_by_id`),
  KEY `up_users_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `up_users_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `up_users_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users`
--

LOCK TABLES `up_users` WRITE;
/*!40000 ALTER TABLE `up_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `up_users_role_lnk`
--

DROP TABLE IF EXISTS `up_users_role_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `up_users_role_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned DEFAULT NULL,
  `role_id` int unsigned DEFAULT NULL,
  `user_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `up_users_role_lnk_uq` (`user_id`,`role_id`),
  KEY `up_users_role_lnk_fk` (`user_id`),
  KEY `up_users_role_lnk_ifk` (`role_id`),
  KEY `up_users_role_lnk_oifk` (`user_ord`),
  CONSTRAINT `up_users_role_lnk_fk` FOREIGN KEY (`user_id`) REFERENCES `up_users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `up_users_role_lnk_ifk` FOREIGN KEY (`role_id`) REFERENCES `up_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `up_users_role_lnk`
--

LOCK TABLES `up_users_role_lnk` WRITE;
/*!40000 ALTER TABLE `up_users_role_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `up_users_role_lnk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders`
--

DROP TABLE IF EXISTS `upload_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `document_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path_id` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `published_at` datetime(6) DEFAULT NULL,
  `created_by_id` int unsigned DEFAULT NULL,
  `updated_by_id` int unsigned DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_path_id_index` (`path_id`),
  UNIQUE KEY `upload_folders_path_index` (`path`),
  KEY `upload_folders_documents_idx` (`document_id`,`locale`,`published_at`),
  KEY `upload_folders_created_by_id_fk` (`created_by_id`),
  KEY `upload_folders_updated_by_id_fk` (`updated_by_id`),
  CONSTRAINT `upload_folders_created_by_id_fk` FOREIGN KEY (`created_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `upload_folders_updated_by_id_fk` FOREIGN KEY (`updated_by_id`) REFERENCES `admin_users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders`
--

LOCK TABLES `upload_folders` WRITE;
/*!40000 ALTER TABLE `upload_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_folders_parent_lnk`
--

DROP TABLE IF EXISTS `upload_folders_parent_lnk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upload_folders_parent_lnk` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `folder_id` int unsigned DEFAULT NULL,
  `inv_folder_id` int unsigned DEFAULT NULL,
  `folder_ord` double unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upload_folders_parent_lnk_uq` (`folder_id`,`inv_folder_id`),
  KEY `upload_folders_parent_lnk_fk` (`folder_id`),
  KEY `upload_folders_parent_lnk_ifk` (`inv_folder_id`),
  KEY `upload_folders_parent_lnk_oifk` (`folder_ord`),
  CONSTRAINT `upload_folders_parent_lnk_fk` FOREIGN KEY (`folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `upload_folders_parent_lnk_ifk` FOREIGN KEY (`inv_folder_id`) REFERENCES `upload_folders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_folders_parent_lnk`
--

LOCK TABLES `upload_folders_parent_lnk` WRITE;
/*!40000 ALTER TABLE `upload_folders_parent_lnk` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_folders_parent_lnk` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23 15:07:37
