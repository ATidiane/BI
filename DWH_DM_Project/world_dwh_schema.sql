--- Host: localhost Database: world_dwh

--
-- Current Database: world_dwh
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `world_dwh` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `world_dwh`;
--
-- Table structure for table `dim_time`
--

DROP TABLE IF EXISTS `dim_time`;

CREATE TABLE `dim_time` (
  `time_key` int(8) NOT NULL,
  `time_value` time NOT NULL,
  `hours24` tinyint(3) NOT NULL,
  `hours12` tinyint(3) DEFAULT NULL,
  `minutes` tinyint(3) DEFAULT NULL,
  `seconds` tinyint(3) DEFAULT NULL,
  `am_pm` char(3) DEFAULT NULL,
  PRIMARY KEY (`time_key`),
  UNIQUE KEY `time_value` (`time_value`)
);


--
-- Table structure for table `dim_date`
--

DROP TABLE IF EXISTS `dim_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dim_date` (
  `date_key` int(8) NOT NULL,
  `date_value` date NOT NULL,
  `date_full` char(32) NOT NULL,
  `day_in_year` smallint(5) NOT NULL,
  `day_in_month` tinyint(3) NOT NULL,
  `is_first_day_in_month` char(10) NOT NULL,
  `is_last_day_in_month` char(10) NOT NULL,
  `day_abbreviation` char(3) NOT NULL,
  `day_name` char(12) NOT NULL,
  `week_in_year` tinyint(3) NOT NULL,
  `week_in_month` tinyint(3) NOT NULL,
  `is_first_day_in_week` char(10) NOT NULL,
  `is_last_day_in_week` char(10) NOT NULL,
  `month_number` tinyint(3) NOT NULL,
  `month_abbreviation` char(3) NOT NULL,
  `month_name` char(12) NOT NULL,
  `year_month_number` char(7) NOT NULL,
  PRIMARY KEY (`date_key`),
  UNIQUE KEY `date` (`date_value`) USING BTREE,
  UNIQUE KEY `date_value` (`date_value`)
);

--
-- Table structure for table `dim_loc`
--

DROP TABLE IF EXISTS `dim_loc`;

CREATE TABLE `dim_loc` (
       `loc_key` int(8) NOT NULL,
       `country_value` char(40) NOT NULL,
       `continent_value` enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL,
       `region`char (36) NOT NULL,
       `population` char (30) NOT NULL,
       PRIMARY KEY (`loc_key`),
       UNIQUE KEY `country_value` (`country_value`)
	);

--
-- Table structure for table `fact_foreign_pop`
--

DROP TABLE IF EXISTS `fact_foreign_pop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_foreign_pop` (
  `country_key` int(8) NOT NULL ,
  `country_code` char(3) NOT NULL,
  `loc_key` int(8) NOT NULL,
  `time_key` int(8) NOT NULL,
  `date_key` int(8) NOT NULL,
  `continent_key` int(8) NOT NULL,
  `region_key` int(8) NOT NULL,
  `foreign_pop_percentage` int(11) DEFAULT NULL,
   KEY `dim_loc_fact_foreign_pop_fk` (`loc_key`),
   KEY `dim_time_fact_rental_foreign_pop_fk` (`time_key`),
   KEY `dim_date_fact_rental_foreign_pop_fk` (`date_key`)
);

       

--
-- Table structure for table `fact_women_state`
--

DROP TABLE IF EXISTS `fact_women_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fact_women_state` (
  `country_code` char(3) NOT NULL,
  `country_key` int(8) NOT NULL,
  `loc_key` int(8) NOT NULL,
  `time_key` int(8) NOT NULL,
  `date_key` int(8) NOT NULL,
  `continent_key` int(8) NOT NULL,
  `region_key` int(8) NOT NULL,
  `mortalite_infantile_percentage` int(8) NOT NULL,
  `niv_education_moy` char(30) NOT NULL,
  KEY `dim_loc_fact_women_state_fk` (`loc_key`),
  KEY `dim_time_fact_rental_women_state_fk` (`time_key`),
  KEY `dim_date_fact_rental_women_state_fk` (`date_key`)
);
