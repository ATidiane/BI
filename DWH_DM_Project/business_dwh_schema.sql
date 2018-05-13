CREATE DATABASE /*!32312 IF NOT EXISTS*/ business_dwh /*!40100 DEFAULT CHARACTER SET latin1 */;

USE business_dwh;


DROP TABLE IF EXISTS dim_pays;
CREATE TABLE dim_pays (
  pays_key int NOT NULL,
  code varchar(3) NOT NULL,
  nom_pays varchar(64) NOT NULL,
  continent varchar(64) NOT NULL,
  region varchar(64) NOT NULL,
  population enum('1-10,000', '10,000-100,000', '100,000-500,000', '500,000-1,000,000', '1,000,000-5,000,000', '5,000,000-10,000,000', '10,000,000-50,000,000', '50,000,000-100,000,000', '100,000,000+') NOT NULL,
  life_expectancy enum('1-50', '50-70', '70+') NOT NULL,

  PRIMARY KEY (pays_key)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS dim_date;
CREATE TABLE dim_date (
  date_key int NOT NULL,
  year int NOT NULL,

  PRIMARY KEY (date_key)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS fact_pib;
CREATE TABLE fact_pib (
  pib_key int NOT NULL,
  pays_key int NOT NULL,
  date_key int NOT NULL,

  pib real NOT NULL,
  croissance_pib real NOT NULL,

  KEY dim_pays_fact_pib_fk (pays_key),
  KEY dim_date_fact_pib_fk (date_key),

  PRIMARY KEY (pib_key)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS fact_smic;
CREATE TABLE fact_smic (
  smic_key int NOT NULL,
  pays_key int NOT NULL,
  date_key int NOT NULL,

  smic real NOT NULL,

  KEY dim_pays_fact_smic_fk (pays_key),
  KEY dim_date_fact_smic_fk (date_key),

  PRIMARY KEY (smic_key)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS fact_immigres;
CREATE TABLE fact_immigres (
  immigres_key int NOT NULL,
  pays_key int NOT NULL,
  date_key int NOT NULL,

  immigres_AUS bigint NOT NULL,
  immigres_AUT bigint NOT NULL,
  immigres_BEL bigint NOT NULL,
  immigres_CAN bigint NOT NULL,
  immigres_CHE bigint NOT NULL,
  immigres_CHL bigint NOT NULL,
  immigres_CZE bigint NOT NULL,
  immigres_DEU bigint NOT NULL,
  immigres_DNK bigint NOT NULL,
  immigres_ESP bigint NOT NULL,
  immigres_EST bigint NOT NULL,
  immigres_FIN bigint NOT NULL,
  immigres_FRA bigint NOT NULL,
  immigres_GBR bigint NOT NULL,
  immigres_GRC bigint NOT NULL,
  immigres_HUN bigint NOT NULL,
  immigres_IRL bigint NOT NULL,
  immigres_ISL bigint NOT NULL,
  immigres_ISR bigint NOT NULL,
  immigres_ITA bigint NOT NULL,
  immigres_JPN bigint NOT NULL,
  immigres_KOR bigint NOT NULL,
  immigres_LUX bigint NOT NULL,
  immigres_LVA bigint NOT NULL,
  immigres_MEX bigint NOT NULL,
  immigres_NLD bigint NOT NULL,
  immigres_NOR bigint NOT NULL,
  immigres_NZL bigint NOT NULL,
  immigres_POL bigint NOT NULL,
  immigres_PRT bigint NOT NULL,
  immigres_SVK bigint NOT NULL,
  immigres_SVN bigint NOT NULL,
  immigres_SWE bigint NOT NULL,
  immigres_TUR bigint NOT NULL,
  immigres_USA bigint NOT NULL,

  KEY dim_pays_fact_immigres_fk (pays_key),
  KEY dim_date_fact_immigres_fk (date_key),

  PRIMARY KEY (immigres_key)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
