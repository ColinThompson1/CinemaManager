# Host: localhost  (Version 5.7.17-log)
# Date: 2017-04-04 09:59:07
# Generator: MySQL-Front 6.0  (Build 1.82)


#
# Structure for table "advertisers"
#


DROP TABLE IF EXISTS `advertisers`;
CREATE TABLE `advertisers` (
  `ID` int(11) NOT NULL,
  `AD_COMPANY` varchar(255) NOT NULL DEFAULT '',
  `REP_NAME` varchar(30) NOT NULL,
  `REP_EMAIL` varchar(255) NOT NULL DEFAULT '',
  `REP_PHONE_NO` bigint(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`AD_COMPANY`),
  UNIQUE KEY `AD_COMPANY` (`AD_COMPANY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "advertisers"
#

INSERT INTO `advertisers` VALUES (100,'PepsiCo','James','James@PepsiCo.com',2147483647),(101,'Nike','Jack','jack@nike.com',1234567891),(102,'Adidas','Jill','jill@adidas.com',1234567892),(103,'Reebok','Moe','moe@reebok.com',1234567893),(104,'Wal-Mart','Matthew','Matthew@Wal-Mart.com',2147483647),(105,'ExxonMobil','Tod','Tod@ExxonMobil.com',2147483647),(106,'Chevron','Esta','Esta@Chevron.com',1029064122),(107,'BerkshireHathaway','Dominique','Dominique@BerkshireHathaway.com',2147483647),(108,'Apple','Daniella','Daniella@Apple.com',2147483647),(109,'Phillips66','Julianna','Julianna@Phillips66.com',2147483647),(110,'GeneralMotors','Federico','Federico@GeneralMotors.com',1262013217),(111,'FordMotor','Norine','Norine@FordMotor.com',2147483647),(112,'GeneralElectric','Danuta','Danuta@GeneralElectric.com',2147483647),(113,'ValeroEnergy','Jamar','Jamar@ValeroEnergy.com',2147483647),(114,'CVSCaremark','Charis','Charis@CVSCaremark.com',1702419412),(115,'FannieMae','Roxanne','Roxanne@FannieMae.com',2147483647),(116,'UnitedHealthGroup','Shannon','Shannon@UnitedHealthGroup.com',2147483647),(117,'McKesson','Esteban','Esteban@McKesson.com',1506649647),(118,'VerizonCommunications','Lindsay','Lindsay@VerizonCommunications.com',2147483647),(119,'Hewlett-Packard','Krystin','Krystin@Hewlett-Packard.com',2147483647),(120,'J.P.MorganChase','Huong','Huong@J.P.MorganChaseCo.com',2128613958),(121,'CostcoWholesale','Rea','Rea@CostcoWholesale.com',1755172119),(122,'ExpressScriptsHolding','Nohemi','Nohemi@ExpressScriptsHolding.com',1722502533),(123,'BankofAmerica','Scotty','Scotty@BankofAmerica.com',2147483647),(124,'CardinalHealth','Lola','Lola@CardinalHealth.com',2147483647),(125,'IBM','Gerardo','Gerardo@ibm.com',2147483647);

#
# Structure for table "concessions"
#

DROP TABLE IF EXISTS `concessions`;
CREATE TABLE `concessions` (
  `SKU` varchar(40) NOT NULL DEFAULT '0',
  `ITEM` varchar(20) NOT NULL DEFAULT '',
  `PRICE` double(5,2) NOT NULL DEFAULT '0.00',
  `BARCODE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "concessions"
#


#
# Structure for table "customers"
#

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `FNAME` varchar(20) NOT NULL DEFAULT 'guest',
  `LNAME` varchar(20) DEFAULT NULL,
  `BDATE` date DEFAULT NULL,
  `SEX` varchar(6) DEFAULT 'female',
  `ADDRESS` varchar(255) DEFAULT NULL,
  `CREDIT_CARD_NO` bigint(16) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE_NO` bigint(12) DEFAULT NULL,
  `PASSWORD` varchar(255) NOT NULL DEFAULT 'pssword',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "customers"
#

INSERT INTO `customers` VALUES (1001,'Rolando','Hoeppner','1970-06-20','M','78 Talbot Drive Princeton, NJ 08540',2086832888563900,'Hoeppner@hotmail.com',8148785473,'password'),(1002,'Cassidy','Cendejas','1970-08-29','M','8832 Sunnyslope Dr. Painesville, OH 44077',9838094005542800,'Cendejas@hotmail.com',8248217414,'password'),(1003,'Zena','Amezquita','1971-01-08','M','64A South Olive Ave. Orange Park, FL 32065',7106093529292300,'Amezquita@hotmail.com',7195641278,'password'),(1004,'Doloris','Sanderlin','1974-01-09','M','7800 Oak Meadow St. Chandler, AZ 85224',2132541079199080,'Sanderlin@hotmail.com',9501151486,'password'),(1005,'Kalyn','Detweiler','1974-03-31','M','663 Wakehurst Ave. Apt 1 Hixson, TN 37343',6292365298701890,'Detweiler@hotmail.com',9894158459,'password'),(1006,'Hazel','Gehlert','1975-03-15','M','54 E. Vale Court Branford, CT 06405',4290076603593700,'Gehlert@hotmail.com',6072908724,'password'),(1007,'Lawanna','Bongiorno','1975-03-22','M','63 N. Mayfair Street Central Islip, NY 11722',3057162325605250,'Bongiorno@hotmail.com',3539892227,'password'),(1008,'Hugo','Ramerez','1975-05-30','M','344 Lexington Drive Wellington, FL 33414',2228933115934460,'Ramerez@hotmail.com',7666529214,'password'),(1009,'Cecila','Victory','1976-01-15','M','397 La Sierra St. San Jose, CA 95127',5452492779429520,'Victory@hotmail.com',4744112183,'password'),(1010,'Charlyn','Parkin','1976-03-27','M','96 East Railroad Street Parlin, NJ 08859',6896587098831830,'Parkin@hotmail.com',2513200608,'password'),(1011,'Carin','Kellerman','1976-08-05','M','8007 Stonybrook St. Chesterfield, VA 23832',5600056631661150,'Kellerman@hotmail.com',2068212665,'password'),(1012,'Rhea','Lebouef','1977-04-14','M','9013 Central Street Lynnwood, WA 98037',1672860203104710,'Lebouef@hotmail.com',1817354331,'password'),(1013,'Carroll','Gerstein','1978-06-25','M','4 Pleasant Drive West Des Moines, IA 50265',8462316950174770,'Gerstein@hotmail.com',8593650539,'password'),(1014,'Kory','Rotenberry','1978-09-18','M','7 Strawberry Ave. Merrillville, IN 46410',7592122557926720,'Rotenberry@hotmail.com',5682343101,'password'),(1015,'Karey','Cates','1981-04-18','M','255 Bohemia Rd. Baldwin, NY 11510',1467659167627340,'Cates@hotmail.com',1206633726,'password'),(1016,'Manuel','Meneely','1983-02-12','M','8498 New Lane Kalispell, MT 59901',2863227963583280,'Meneely@hotmail.com',7168155262,'password'),(1017,'Cleo','Loughlin','1986-07-25','M','8297 Arcadia St. North Olmsted, OH 44070',2293004238932680,'Loughlin@hotmail.com',7876998542,'password'),(1018,'Evita','Bader','1990-02-03','M','853 10th Street Lorton, VA 22079',8193048762724140,'Bader@hotmail.com',5317677324,'password'),(1019,'William','Serna','1990-09-13','M','44 Summer Road Montgomery Village, MD 20886',4691224798480170,'Serna@hotmail.com',9496783005,'password'),(1020,'Emeline','Artist','1991-02-02','M','95 Oxford St. Titusville, FL 32780',9425949508444710,'Artist@hotmail.com',8905254534,'password'),(1021,'Melony','Matzen','1991-02-22','M','730 Ashley St. Peabody, MA 01960',9333250237548570,'Matzen@hotmail.com',3298506585,'password'),(1022,'Keila','Mash','1992-01-27','M','997 Lake Forest Drive Kearny, NJ 07032',9660197612700860,'Mash@hotmail.com',1437381392,'password'),(1023,'Vince','Dombrowski','1993-01-24','M','629 Border St. Hagerstown, MD 21740',6082114668333410,'Dombrowski@hotmail.com',5753236652,'password'),(1024,'Suzanne','Luebbers','2000-11-22','M','994 Glenridge Street High Point, NC 27265',2134692202092560,'Luebbers@hotmail.com',6519387743,'password'),(1025,'Ramiro','Morabito','2002-10-17','F','857 Miles Lane Charlotte, NC 28205',3539065808368470,'Morabito@hotmail.com',9052903543,'password'),(1026,'Vernetta','Mosher','1970-12-05','F','37 N. Blue Spring Lane Harrisonburg, VA 22801',8289355292346710,'Mosher@hotmail.com',1381927440,'password'),(1027,'Patricia','Man','1971-02-11','F','9420 N. Rockville Lane Miami, FL 33125',7932809886117160,'Man@hotmail.com',9856625871,'password'),(1028,'Caryl','Billingsly','1971-11-06','F','563 Cherry Hill Drive Upper Darby, PA 19082',4884599004333200,'Billingsly@hotmail.com',2891479148,'password'),(1029,'Erwin','Pujol','1972-02-06','F','374 Anderson St. Baton Rouge, LA 70806',8717197276559090,'Pujol@hotmail.com',1828060670,'password'),(1030,'Sylvester','Nordin','1972-11-13','F','496 West Constitution Circle Columbia, MD 21044',4517033624499950,'Nordin@hotmail.com',4664984245,'password'),(1031,'Joane','Poage','1973-05-04','F','58 Southampton Drive Ann Arbor, MI 48103',6118949606302120,'Poage@hotmail.com',3711922290,'password'),(1032,'Evon','Sawyer','1976-09-03','F','9176 West Meadowbrook Street Dracut, MA 01826',2047066023850320,'Sawyer@hotmail.com',9917995129,'password'),(1033,'Thomasine','Gibbons','1977-06-01','F','54 Arnold Ave. Galloway, OH 43119',5253673126386070,'Gibbons@hotmail.com',1705474703,'password'),(1034,'Damaris','Sessums','1978-07-02','F','406 Campfire Street Westwood, NJ 07675',4718772729061650,'Sessums@hotmail.com',3195699471,'password'),(1035,'Linsey','Hollon','1982-07-30','F','7 Old Sheffield St. Cordova, TN 38016',7291453352587780,'Hollon@hotmail.com',8182180631,'password'),(1036,'Cammie','Karle','1983-12-19','F','8923 Hickory Lane Riverdale, GA 30274',7294666593840950,'Karle@hotmail.com',3437452911,'password'),(1037,'Roosevelt','Cochran','1984-08-04','F','654 Monroe St. Unit 209 West Bend, WI 53095',3363345049469860,'Cochran@hotmail.com',7706386208,'password'),(1038,'Natashia','Wible','1984-08-23','F','891 S. Bedford Street Ocean Springs, MS 39564',4848532350924060,'Wible@hotmail.com',3417542431,'password'),(1039,'Isidro','Whitsett','1984-11-06','F','93 SW. Lafayette Drive Barrington, IL 60010',7794596971687930,'Whitsett@hotmail.com',4599811237,'password'),(1040,'Anh','Beaudette','1985-10-01','F','8110 North Augusta Drive Clarksburg, WV 26301',1708080759152660,'Beaudette@hotmail.com',6208190278,'password'),(1041,'Moshe','Hankey','1986-06-17','F','23 S. Miller Road Fishers, IN 46037',7570434539899560,'Hankey@hotmail.com',1953972160,'password'),(1042,'Nettie','Levar','1989-07-30','F','1 William Road Covington, GA 30014',3230113380590840,'Levar@hotmail.com',2052769885,'password'),(1043,'Rachel','Swan','1990-02-14','F','985 Deerfield Court Riverview, FL 33569',4949436422891210,'Swan@hotmail.com',3736316137,'password'),(1044,'Frederic','Aburto','1994-05-02','F','5 Country Club Drive Hartselle, AL 35640',1963856516983610,'Aburto@hotmail.com',7744278153,'password'),(1045,'Lenore','Guel','1994-10-12','F','794 Illinois Street Fort Lee, NJ 07024',2570482151866990,'Guel@hotmail.com',2518444804,'password'),(1046,'Maryjane','Skowron','1997-05-16','F','7110 Forest Street Butler, PA 16001',1077002570684610,'Skowron@hotmail.com',7521506144,'password'),(1047,'Shannon','Staples','1997-10-01','F','37 Cambridge Drive Eastpointe, MI 48021',3617938187010750,'Staples@hotmail.com',3577142408,'password'),(1048,'Branden','Hiltz','1997-11-01','F','62 Poor House Dr. Matthews, NC 28104',9919921777500360,'Hiltz@hotmail.com',6231146859,'password'),(1049,'Tawny','Mcinerney','2000-07-13','F','7802 Del Monte St. Kingston, NY 12401',1493897978295120,'Mcinerney@hotmail.com',9618733967,'password'),(1050,'Kittie','Ruckman','2001-09-08','F','7470 E. Lower River Street Arlington Heights, IL 60004',2904054343407150,'Ruckman@hotmail.com',1625701751,'password');

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DNO` int(9) NOT NULL DEFAULT '1',
  `MNGR_SSN` int(9) DEFAULT NULL,
  `DNAME` varchar(10) NOT NULL,
  PRIMARY KEY (`DNO`),
  UNIQUE KEY `DNAME` (`DNAME`),
  KEY `MNGR_SSN` (`MNGR_SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "department"
#

INSERT INTO `department` VALUES (1,NULL,'RESEARCH'),(2,NULL,'MARKETING'),(3,NULL,'CUSSERVICE'),(4,NULL,'CUSTODIAL'),(5,NULL,'FINANCE'),(6,NULL,'IT'),(7,NULL,'ADMIN'),(8,NULL,'HR'),(9,NULL,'MERCH'),(10,NULL,'SECURITY');

#
# Structure for table "employee"
#

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `SSN` int(9) NOT NULL DEFAULT '0',
  `FNAME` varchar(30) NOT NULL,
  `LNAME` varchar(30) NOT NULL,
  `BDATE` date DEFAULT NULL,
  `DNO` int(9) DEFAULT NULL,
  `SUPERSSN` int(9) DEFAULT NULL,
  `SEX` varchar(6) DEFAULT NULL,
  `ADDRESS` varchar(255) DEFAULT NULL,
  `PHONE_NO` bigint(12) DEFAULT NULL,
  `SALARY` int(10) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) NOT NULL DEFAULT 'pssword',
  PRIMARY KEY (`SSN`),
  KEY `employee_ibfk_1` (`DNO`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "employee"
#

INSERT INTO `employee` VALUES (0,'Lula','Parmer','1988-01-19',7,NULL,'F','9916 West Piper Street Depew, NY 14043',2147483647,30189,'LulaParmer@cinema.com','password'),(139184070,'Lavonda','Cray','1978-11-15',7,NULL,'M','505 West Glenwood Drive Fargo, ND 58102',1885928864,21452,'LavondaCray@cinema.com','password'),(147107432,'Kristan','Pendelton','1971-02-18',5,NULL,'F','25 Leatherwood Rd. Ashtabula, OH 44004',2147483647,19824,'KristanPendelton@cinema.com','password'),(151678918,'Ismael','Zimmerman','1972-02-04',3,NULL,'F','496 Green St. Dearborn, MI 48124',2147483647,19730,'IsmaelZimmerman@cinema.com','password'),(151714150,'Trista','Hamp','2002-09-04',7,NULL,'F','8682 Hamilton Street Dunedin, FL 34698',2147483647,39719,'TristaHamp@cinema.com','password'),(169497765,'Emeline','Reza','1983-01-03',1,NULL,'F','600 Amerige Drive Lansdowne, PA 19050',2147483647,21537,'EmelineReza@cinema.com','password'),(206942714,'Retha','Pulice','1998-04-16',5,NULL,'M','403 Chestnut Court Malden, MA 02148',1321545669,13979,'RethaPulice@cinema.com','pssword'),(216061384,'Joslyn','Winkleman','1998-03-31',1,NULL,'F','732 Broad Dr. Latrobe, PA 15650',4596567370,21141,'JoslynWinkleman@cinema.com','pssword'),(231616954,'Jaqueline','Oullette','1982-07-24',7,NULL,'F','561 Wood Ave. Methuen, MA 01844',8282192677,38467,'JaquelineOullette@cinema.com','pssword'),(253256586,'Lula','Parmer','1988-01-19',7,NULL,'F','9916 West Piper Street Depew, NY 14043',9183193267,30189,'LulaParmer@cinema.com','pssword'),(282753390,'Collin','Eiler','1984-03-30',2,NULL,'M','20 South Railroad St. Elk Grove Village, IL 60007',6841190243,36098,'CollinEiler@cinema.com','pssword'),(296265734,'Mimi','Walquist','1990-10-17',1,NULL,'M','86 Cleveland Lane Hicksville, NY 11801',5475084874,16478,'MimiWalquist@cinema.com','pssword'),(332030992,'Benito','Valasquez','1973-11-23',2,NULL,'M','22 3rd St. Winter Haven, FL 33880',5642134206,28611,'BenitoValasquez@cinema.com','pssword'),(365251878,'Kitty','Mounce','1990-02-28',5,NULL,'F','7141 West Pendergast Dr. Danvers, MA 01923',4929282982,27659,'KittyMounce@cinema.com','pssword'),(379014912,'Ceola','Acheson','1982-08-16',3,NULL,'M','47 Alderwood St. Lake Villa, IL 60046',9532190949,18754,'CeolaAcheson@cinema.com','pssword'),(456344230,'Ocie','Mccawley','1971-09-14',1,NULL,'M','33 North Sleepy Hollow Drive Saint Joseph, MI 49085',9352451752,17241,'OcieMccawley@cinema.com','pssword'),(464510077,'Anastacia','Marshal','1989-10-19',3,NULL,'F','7628 West Meadowbrook Street Crystal Lake, IL 60014',1712373608,16661,'AnastaciaMarshal@cinema.com','pssword'),(481489237,'Abby','Pons','1971-05-30',3,NULL,'F','46 S. New Saddle Rd. Mentor, OH 44060',9355518570,34808,'AbbyPons@cinema.com','pssword'),(488138342,'Gerald','Trower','2000-07-17',7,NULL,'F','9069 Winchester Ave. Grove City, OH 43123',8323386419,14813,'GeraldTrower@cinema.com','pssword'),(553428895,'Jong','Rutland','1991-11-04',7,NULL,'F','84 South Orchard Street Lynn, MA 01902',5804226658,33453,'JongRutland@cinema.com','pssword'),(553590555,'Carlena','Rayford','1991-08-10',6,NULL,'F','20 Addison Lane Braintree, MA 02184',3035261620,21718,'CarlenaRayford@cinema.com','pssword'),(578815862,'Dinah','Whalley','1987-05-14',9,NULL,'F','9103 W. Santa Clara Ave. Glastonbury, CT 06033',2806019839,39287,'DinahWhalley@cinema.com','pssword'),(579204799,'Johnson','Houtz','1979-09-24',6,NULL,'M','842 Pin Oak Drive Mechanicsville, VA 23111',3411576606,26630,'JohnsonHoutz@cinema.com','pssword'),(596454599,'Julianne','Freeberg','1983-03-16',7,NULL,'M','9421 St Louis Avenue Lynn, MA 01902',1414226531,25838,'JulianneFreeberg@cinema.com','pssword'),(612696795,'Pam','Lohr','1973-07-10',1,NULL,'M','7 West Oak St. Smithtown, NY 11787',7151599079,33144,'PamLohr@cinema.com','pssword'),(627639647,'Brigid','Terry','1975-10-12',6,NULL,'M','653 Wayne Dr. Graham, NC 27253',8444756089,29164,'BrigidTerry@cinema.com','pssword'),(643264285,'Marybeth','Haun','1991-04-30',2,NULL,'M','776 Lakeshore St. Fort Wayne, IN 46804',8480962385,12889,'MarybethHaun@cinema.com','pssword'),(648793326,'Nohemi','Kaminsky','1993-10-30',4,NULL,'F','230 Rosewood Street Howard Beach, NY 11414',2788368079,11814,'NohemiKaminsky@cinema.com','pssword'),(705219478,'Catina','Caron','1974-02-08',1,NULL,'M','8862 W. Strawberry Street Vernon Rockville, CT 06066',2820079019,39516,'CatinaCaron@cinema.com','pssword'),(740896641,'Carmine','Marcucci','1979-09-15',3,NULL,'F','96 Rockwell Lane New Berlin, WI 53151',4528965473,28094,'CarmineMarcucci@cinema.com','pssword'),(752900308,'Beatriz','Spradley','1971-07-05',4,NULL,'F','50 Lantern Avenue Middle River, MD 21220',7409446817,26499,'BeatrizSpradley@cinema.com','pssword'),(756020616,'Linn','Gibbens','1990-06-19',4,NULL,'M','9238 Cross Lane Fresh Meadows, NY 11365',5934312618,18157,'LinnGibbens@cinema.com','pssword'),(758321333,'Myrtice','Gaiter','1990-06-05',7,NULL,'F','44 Bedford St. Schaumburg, IL 60193',4775071047,11154,'MyrticeGaiter@cinema.com','pssword'),(770585654,'Danny','Milum','2001-03-13',9,NULL,'F','85 Pennsylvania Drive Middletown, CT 06457',4946296715,35227,'DannyMilum@cinema.com','pssword'),(826107766,'Elisabeth','Mcdonough','1999-05-01',8,NULL,'M','308 Winding Way Lane Valley Stream, NY 11580',5449516780,14210,'ElisabethMcdonough@cinema.com','pssword'),(827189609,'Eldora','Gaines','1999-06-07',5,NULL,'F','7710 Bowman Court Waterbury, CT 06705',7136301991,30800,'EldoraGaines@cinema.com','pssword'),(841972318,'Lilly','Hearns','1985-09-14',3,NULL,'F','227 Big Rock Cove Street Kent, OH 44240',9632068808,31515,'LillyHearns@cinema.com','pssword'),(849431964,'Jennell','Meneses','1971-08-30',7,NULL,'F','110 Edgewood Street New Windsor, NY 12553',7677802797,11224,'JennellMeneses@cinema.com','pssword'),(857034935,'Lessie','Viveros','1974-01-30',9,NULL,'F','7123 North Jackson St. Lenoir, NC 28645',1279113579,31887,'LessieViveros@cinema.com','pssword'),(892348753,'Aurora','Chaparro','1979-10-09',3,NULL,'F','784 West Glenwood St. Southaven, MS 38671',2737381859,15109,'AuroraChaparro@cinema.com','pssword'),(905141829,'Ardelle','Jamerson','1975-11-10',4,NULL,'M','7840 Bedford Drive Frederick, MD 21701',1034235454,10904,'ArdelleJamerson@cinema.com','pssword'),(909902542,'Sharda','Gemmell','1971-10-05',2,NULL,'M','7622 High Ridge Lane North Tonawanda, NY 14120',1251359757,27017,'ShardaGemmell@cinema.com','pssword'),(924327241,'Ashlea','Petry','1994-04-03',9,NULL,'F','143 Courtland St. Saint Augustine, FL 32084',6978123375,20863,'AshleaPetry@cinema.com','pssword'),(926590613,'Agustina','Nuzzo','1996-10-05',8,NULL,'M','7632 W. Snake Hill Street Covington, GA 30014',4906722172,24056,'AgustinaNuzzo@cinema.com','pssword'),(946443845,'Casey','Callanan','1989-08-16',2,NULL,'M','157 Wild Horse Road Ooltewah, TN 37363',6081140045,26901,'CaseyCallanan@cinema.com','pssword'),(957373433,'Maryjo','Bingman','1995-02-11',9,NULL,'F','654 Livingston Avenue Baton Rouge, LA 70806',2849902172,34789,'MaryjoBingman@cinema.com','pssword'),(970417984,'Julianna','Kates','1978-12-08',3,NULL,'M','7325 Kent Drive Sicklerville, NJ 08081',4865977192,18867,'JuliannaKates@cinema.com','pssword'),(971024289,'Hellen','Chartrand','1983-11-03',7,NULL,'M','614 East Sage Dr. Manchester Township, NJ 08759',2358022784,29835,'HellenChartrand@cinema.com','pssword'),(971588083,'Corene','Raulston','1983-09-13',3,NULL,'M','68 San Pablo Street Flint, MI 48504',1372817097,27434,'CoreneRaulston@cinema.com','pssword'),(978785753,'Lilian','Montesinos','1979-09-13',9,NULL,'M','7500 Shub Farm Dr. Oak Park, MI 48237',9802394512,37631,'LilianMontesinos@cinema.com','pssword'),(980355605,'Madelaine','Springfield','2000-08-31',1,NULL,'F','975 South Bow Ridge Street Des Moines, IA 50310',7980898181,18841,'MadelaineSpringfield@cinema.com','pssword');

#
# Structure for table "movie"
#

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(30) NOT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  `LENGTH` time NOT NULL,
  `EARNINGS` double DEFAULT NULL,
  `AIR_LENGTH` int DEFAULT NULL,
  `POSTER_PATH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#
INSERT INTO `movie` VALUES (0, 'Beauty and the Beast', '2017-02-23', '02:19', 61843, 60, '/CinemaManger/public/movie_images/Beauty_and_the_Beast.jpg');
INSERT INTO `movie` VALUES (1, 'Doctor Strange', '2016-10-13', '01:55', 197205, 86, '/CinemaManger/public/movie_images/Doctor_Strange.jpg');
INSERT INTO `movie` VALUES (2, 'Finding Dory', '2016-06-17', '01:40', 523498, 217, '/CinemaManger/public/movie_images/Finding_Dory.jpg');
INSERT INTO `movie` VALUES (3, 'Ghost in the Shell', '2017-03-31', '02:00', 6, 5000, '/CinemaManger/public/movie_images/Ghost_in_the_Shell.jpg');
INSERT INTO `movie` VALUES (4, 'Hell or High Water', '2016-08-19', '01:43', 18612, 190, '/CinemaManger/public/movie_images/Hell_or_High_Water.jpg');
INSERT INTO `movie` VALUES (5, 'Manchester by the Sea', '2016-11-18', '02:17', 54612, 126, '/CinemaManger/public/movie_images/Manchester_By_The_Sea.jpg');
INSERT INTO `movie` VALUES (6, 'Moana', '2016-11-23', '01:53', 1000000, 136, '/CinemaManger/public/movie_images/Moana.jpg');
INSERT INTO `movie` VALUES (7, 'Rogue One: A Star Wars Story', '2016-12-16', '02:13', 2000000, 100, '/CinemaManger/public/movie_images/Rogue_One_A_Star_Wars_Story.jpg');
INSERT INTO `movie` VALUES (8, 'Spider-Man: Homecoming', '2017-06-17', '00:00', 0, 0, '/CinemaManger/public/movie_images/Spiderman_Homecoming.jpg');
INSERT INTO `movie` VALUES (9, 'The Jungle Book', '2016-04-15', '01:51', 500000, 269, '/CinemaManger/public/movie_images/The_Jungle_Book.jpg');

#
# Structure for table "showing"
#

DROP TABLE IF EXISTS `showing`;
CREATE TABLE `showing` (
  `ID` int(11) NOT NULL,
  `START_TIME` time DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `MOVIE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MOVIE_ID` (`MOVIE_ID`),
  CONSTRAINT `showing_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "showing"
#


#
# Structure for table "auditorium"
#

DROP TABLE IF EXISTS `auditorium`;
CREATE TABLE `auditorium` (
  `AUD_NO` int(11) NOT NULL AUTO_INCREMENT,
  `SEAT_COUNT` int(11) NOT NULL,
  `LOCATION` varchar(15) DEFAULT NULL,
  `SHOWING_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AUD_NO`),
  KEY `SHOWING_ID` (`SHOWING_ID`),
  CONSTRAINT `auditorium_ibfk_1` FOREIGN KEY (`SHOWING_ID`) REFERENCES `showing` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

#
# Data for table "auditorium"
#

INSERT INTO `auditorium` VALUES (1,250,NULL,NULL),(2,257,NULL,NULL),(3,300,NULL,NULL),(4,240,NULL,NULL),(5,233,NULL,NULL),(6,301,NULL,NULL),(7,180,NULL,NULL),(8,260,NULL,NULL),(9,270,NULL,NULL),(10,280,NULL,NULL),(11,290,NULL,NULL),(12,258,NULL,NULL),(13,294,NULL,NULL),(14,354,NULL,NULL),(15,245,NULL,NULL);

#
# Structure for table "tickets"
#

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEAT_NO` int(3) DEFAULT NULL,
  `SHOWING_ID` int(11) NOT NULL DEFAULT '0',
  `CUSTOMER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`,`SHOWING_ID`),
  KEY `SHOWING_ID` (`SHOWING_ID`),
  KEY `CUSTOMER_ID` (`CUSTOMER_ID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`SHOWING_ID`) REFERENCES `showing` (`ID`) ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `customers` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tickets"
#

