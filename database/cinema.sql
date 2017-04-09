# Host: localhost  (Version 5.7.17-log)
# Date: 2017-04-08 20:40:10
# Generator: MySQL-Front 6.0  (Build 1.117)


#
# Structure for table "advertisers"
#

DROP TABLE IF EXISTS `advertisers`;
CREATE TABLE `advertisers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AD_COMPANY` varchar(255) NOT NULL DEFAULT '',
  `REP_NAME` varchar(30) NOT NULL,
  `REP_EMAIL` varchar(255) NOT NULL DEFAULT '',
  `REP_PHONE_NO` bigint(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`AD_COMPANY`),
  UNIQUE KEY `AD_COMPANY` (`AD_COMPANY`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

#
# Data for table "advertisers"
#

INSERT INTO `advertisers` VALUES (1,'PepsiCo','James','James@PepsiCo.com',2147483647),(2,'Nike','Jack','jack@nike.com',1234567891),(3,'Adidas','Jill','jill@adidas.com',1234567892),(4,'Reebok','Moe','moe@reebok.com',1234567893),(5,'Wal-Mart','Matthew','Matthew@Wal-Mart.com',2147483647),(6,'ExxonMobil','Tod','Tod@ExxonMobil.com',2147483647),(7,'Chevron','Esta','Esta@Chevron.com',1029064122),(8,'BerkshireHathaway','Dominique','Dominique@BerkshireHathaway.com',2147483647),(9,'Apple','Daniella','Daniella@Apple.com',2147483647),(10,'Phillips66','Julianna','Julianna@Phillips66.com',2147483647),(11,'GeneralMotors','Federico','Federico@GeneralMotors.com',1262013217),(12,'FordMotor','Norine','Norine@FordMotor.com',2147483647),(13,'GeneralElectric','Danuta','Danuta@GeneralElectric.com',2147483647),(14,'ValeroEnergy','Jamar','Jamar@ValeroEnergy.com',2147483647),(15,'CVSCaremark','Charis','Charis@CVSCaremark.com',1702419412),(16,'FannieMae','Roxanne','Roxanne@FannieMae.com',2147483647),(17,'UnitedHealthGroup','Shannon','Shannon@UnitedHealthGroup.com',2147483647),(18,'McKesson','Esteban','Esteban@McKesson.com',1506649647),(19,'VerizonCommunications','Lindsay','Lindsay@VerizonCommunications.com',2147483647),(20,'Hewlett-Packard','Krystin','Krystin@Hewlett-Packard.com',2147483647),(21,'J.P.MorganChase','Huong','Huong@J.P.MorganChaseCo.com',2128613958),(22,'CostcoWholesale','Rea','Rea@CostcoWholesale.com',1755172119),(23,'ExpressScriptsHolding','Nohemi','Nohemi@ExpressScriptsHolding.com',1722502533),(24,'BankofAmerica','Scotty','Scotty@BankofAmerica.com',2147483647),(25,'CardinalHealth','Lola','Lola@CardinalHealth.com',2147483647),(26,'IBM','Gerardo','Gerardo@ibm.com',2147483647);

#
# Structure for table "concessions"
#

DROP TABLE IF EXISTS `concessions`;
CREATE TABLE `concessions` (
  `SKU` varchar(40) NOT NULL DEFAULT '0',
  `ITEM` varchar(20) NOT NULL DEFAULT '',
  `PRICE` double(5,2) NOT NULL DEFAULT '0.00',
  `BARCODE` varchar(30) DEFAULT NULL,
  `QUANTITY` int(11) NOT NULL DEFAULT '0',
  `ORDERED` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "concessions"
#

INSERT INTO `concessions` VALUES ('CHO-KIT-S','KitKat Small',3.49,'38957858',1046,1427),('CHP-LY-R','Lays Reg Small',2.99,'88079893',915,1239),('CNDY-SKIT-S','Skittles Small',2.99,'68721821',1029,1224),('HOT-CH','Hotdog Cheese',7.99,'11629962',619,681),('HOT-CHCL','Hotdog Chili Cheese',11.99,'11629964',860,967),('HOT-CL','Hotdog Chili',8.99,'11629963',1237,734),('HOT-R','Hotdog Reg',4.99,'11629961',1562,525),('PEPS-B-591-R','Pepsi Bottle Small',4.25,'97182108',1324,542),('PEPS-B-735-R','Pepsi BottleMed',5.00,'97182109',1023,123),('PEPS-C-375-R','Pepsi Can',2.00,'97182110',2000,414),('POPC-L','Popcorn Lrg',7.99,'54689589',751,954),('POPC-M','Popcorn Med',6.99,'54689587',634,1324),('POPC-S','Popcorn Small',5.99,'54689586',1032,964);

#
# Structure for table "customers"
#

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "customers"
#

INSERT INTO `customers` VALUES (1,'Rolando','Hoeppner','1970-06-20','M','78 Talbot Drive Princeton, NJ 08540',8943486628520170,'Hoeppner@hotmail.com',8148785473,'password'),(2,'Cassidy','Cendejas','1970-08-29','M','8832 Sunnyslope Dr. Painesville, OH 44077',6617726585993990,'Cendejas@hotmail.com',8248217414,'password'),(3,'Zena','Amezquita','1971-01-08','M','64A South Olive Ave. Orange Park, FL 32065',8357826614899030,'Amezquita@hotmail.com',7195641278,'password'),(4,'Doloris','Sanderlin','1974-01-09','M','7800 Oak Meadow St. Chandler, AZ 85224',6729941605246030,'Sanderlin@hotmail.com',9501151486,'password'),(5,'Kalyn','Detweiler','1974-03-31','M','663 Wakehurst Ave. Apt 1 Hixson, TN 37343',7496662434374370,'Detweiler@hotmail.com',9894158459,'password'),(6,'Hazel','Gehlert','1975-03-15','M','54 E. Vale Court Branford, CT 06405',1139910666355020,'Gehlert@hotmail.com',6072908724,'password'),(7,'Lawanna','Bongiorno','1975-03-22','M','63 N. Mayfair Street Central Islip, NY 11722',3782648803732250,'Bongiorno@hotmail.com',3539892227,'password'),(8,'Hugo','Ramerez','1975-05-30','M','344 Lexington Drive Wellington, FL 33414',8301178309102200,'Ramerez@hotmail.com',7666529214,'password'),(9,'Cecila','Victory','1976-01-15','M','397 La Sierra St. San Jose, CA 95127',3176323667730500,'Victory@hotmail.com',4744112183,'password'),(10,'Charlyn','Parkin','1976-03-27','M','96 East Railroad Street Parlin, NJ 08859',4853185226691570,'Parkin@hotmail.com',2513200608,'password'),(11,'Carin','Kellerman','1976-08-05','M','8007 Stonybrook St. Chesterfield, VA 23832',2117785865773900,'Kellerman@hotmail.com',2068212665,'password'),(12,'Rhea','Lebouef','1977-04-14','M','9013 Central Street Lynnwood, WA 98037',9123139629578760,'Lebouef@hotmail.com',1817354331,'password'),(13,'Carroll','Gerstein','1978-06-25','M','4 Pleasant Drive West Des Moines, IA 50265',9157106467855330,'Gerstein@hotmail.com',8593650539,'password'),(14,'Kory','Rotenberry','1978-09-18','M','7 Strawberry Ave. Merrillville, IN 46410',2450655822819900,'Rotenberry@hotmail.com',5682343101,'password'),(15,'Karey','Cates','1981-04-18','M','255 Bohemia Rd. Baldwin, NY 11510',7402384724383790,'Cates@hotmail.com',1206633726,'password'),(16,'Manuel','Meneely','1983-02-12','M','8498 New Lane Kalispell, MT 59901',6873081599812870,'Meneely@hotmail.com',7168155262,'password'),(17,'Cleo','Loughlin','1986-07-25','M','8297 Arcadia St. North Olmsted, OH 44070',2493317607556520,'Loughlin@hotmail.com',7876998542,'password'),(18,'Evita','Bader','1990-02-03','M','853 10th Street Lorton, VA 22079',5526241172969130,'Bader@hotmail.com',5317677324,'password'),(19,'William','Serna','1990-09-13','M','44 Summer Road Montgomery Village, MD 20886',7718706758031430,'Serna@hotmail.com',9496783005,'password'),(20,'Emeline','Artist','1991-02-02','M','95 Oxford St. Titusville, FL 32780',3613234430112990,'Artist@hotmail.com',8905254534,'password'),(21,'Melony','Matzen','1991-02-22','M','730 Ashley St. Peabody, MA 01960',4729260023313560,'Matzen@hotmail.com',3298506585,'password'),(22,'Keila','Mash','1992-01-27','M','997 Lake Forest Drive Kearny, NJ 07032',6226271018123940,'Mash@hotmail.com',1437381392,'password'),(23,'Vince','Dombrowski','1993-01-24','M','629 Border St. Hagerstown, MD 21740',5409389495638290,'Dombrowski@hotmail.com',5753236652,'password'),(24,'Suzanne','Luebbers','2000-11-22','M','994 Glenridge Street High Point, NC 27265',2965422338100780,'Luebbers@hotmail.com',6519387743,'password'),(25,'Ramiro','Morabito','2002-10-17','F','857 Miles Lane Charlotte, NC 28205',8930437403155840,'Morabito@hotmail.com',9052903543,'password'),(26,'Vernetta','Mosher','1970-12-05','F','37 N. Blue Spring Lane Harrisonburg, VA 22801',4197121023900300,'Mosher@hotmail.com',1381927440,'password'),(27,'Patricia','Man','1971-02-11','F','9420 N. Rockville Lane Miami, FL 33125',7627198409229970,'Man@hotmail.com',9856625871,'password'),(28,'Caryl','Billingsly','1971-11-06','F','563 Cherry Hill Drive Upper Darby, PA 19082',5401040913777660,'Billingsly@hotmail.com',2891479148,'password'),(29,'Erwin','Pujol','1972-02-06','F','374 Anderson St. Baton Rouge, LA 70806',5445499611612920,'Pujol@hotmail.com',1828060670,'password'),(30,'Sylvester','Nordin','1972-11-13','F','496 West Constitution Circle Columbia, MD 21044',7042364697631680,'Nordin@hotmail.com',4664984245,'password'),(31,'Joane','Poage','1973-05-04','F','58 Southampton Drive Ann Arbor, MI 48103',7503938583139330,'Poage@hotmail.com',3711922290,'password'),(32,'Evon','Sawyer','1976-09-03','F','9176 West Meadowbrook Street Dracut, MA 01826',4757585294462640,'Sawyer@hotmail.com',9917995129,'password'),(33,'Thomasine','Gibbons','1977-06-01','F','54 Arnold Ave. Galloway, OH 43119',1704727680570980,'Gibbons@hotmail.com',1705474703,'password'),(34,'Damaris','Sessums','1978-07-02','F','406 Campfire Street Westwood, NJ 07675',9739933585470360,'Sessums@hotmail.com',3195699471,'password'),(35,'Linsey','Hollon','1982-07-30','F','7 Old Sheffield St. Cordova, TN 38016',7250464067477160,'Hollon@hotmail.com',8182180631,'password'),(36,'Cammie','Karle','1983-12-19','F','8923 Hickory Lane Riverdale, GA 30274',5184050174921760,'Karle@hotmail.com',3437452911,'password'),(37,'Roosevelt','Cochran','1984-08-04','F','654 Monroe St. Unit 209 West Bend, WI 53095',3488468563703060,'Cochran@hotmail.com',7706386208,'password'),(38,'Natashia','Wible','1984-08-23','F','891 S. Bedford Street Ocean Springs, MS 39564',6087478745202830,'Wible@hotmail.com',3417542431,'password'),(39,'Isidro','Whitsett','1984-11-06','F','93 SW. Lafayette Drive Barrington, IL 60010',6541517290493680,'Whitsett@hotmail.com',4599811237,'password'),(40,'Anh','Beaudette','1985-10-01','F','8110 North Augusta Drive Clarksburg, WV 26301',4612086565120310,'Beaudette@hotmail.com',6208190278,'password'),(41,'Moshe','Hankey','1986-06-17','F','23 S. Miller Road Fishers, IN 46037',9860244103434080,'Hankey@hotmail.com',1953972160,'password'),(42,'Nettie','Levar','1989-07-30','F','1 William Road Covington, GA 30014',9419729332362560,'Levar@hotmail.com',2052769885,'password'),(43,'Rachel','Swan','1990-02-14','F','985 Deerfield Court Riverview, FL 33569',1484729129867380,'Swan@hotmail.com',3736316137,'password'),(44,'Frederic','Aburto','1994-05-02','F','5 Country Club Drive Hartselle, AL 35640',3806784678854480,'Aburto@hotmail.com',7744278153,'password'),(45,'Lenore','Guel','1994-10-12','F','794 Illinois Street Fort Lee, NJ 07024',3282030072941340,'Guel@hotmail.com',2518444804,'password'),(46,'Maryjane','Skowron','1997-05-16','F','7110 Forest Street Butler, PA 16001',4759048774456210,'Skowron@hotmail.com',7521506144,'password'),(47,'Shannon','Staples','1997-10-01','F','37 Cambridge Drive Eastpointe, MI 48021',9265054931113690,'Staples@hotmail.com',3577142408,'password'),(48,'Branden','Hiltz','1997-11-01','F','62 Poor House Dr. Matthews, NC 28104',8204180119721200,'Hiltz@hotmail.com',6231146859,'password'),(49,'Tawny','Mcinerney','2000-07-13','F','7802 Del Monte St. Kingston, NY 12401',9587399672054330,'Mcinerney@hotmail.com',9618733967,'password'),(50,'Kittie','Ruckman','2001-09-08','F','7470 E. Lower River Street Arlington Heights, IL 60004',1788733563604060,'Ruckman@hotmail.com',1625701751,'password');

#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DNO` int(9) NOT NULL AUTO_INCREMENT,
  `MNGR_SSN` int(9) DEFAULT NULL,
  `DNAME` varchar(10) NOT NULL,
  PRIMARY KEY (`DNO`),
  UNIQUE KEY `DNAME` (`DNAME`),
  KEY `MNGR_SSN` (`MNGR_SSN`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "department"
#

INSERT INTO `department` VALUES (1,612696795,'RESEARCH'),(2,643264285,'MARKETING'),(3,841972318,'CUSSERVICE'),(4,905141829,'CUSTODIAL'),(5,365251878,'FINANCE'),(6,553590555,'IT'),(7,139184070,'ADMIN'),(8,926590613,'HR'),(9,957373433,'MERCH'),(10,705219478,'SECURITY');

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

INSERT INTO `employee` VALUES (139124570,'Lula','Parmer','1988-01-19',7,'F','9916 West Piper Street Depew, NY 14043',2147483647,30189,'LulaParmer@cinema.com','password'),(139184070,'Lavonda','Cray','1978-11-15',7,'M','505 West Glenwood Drive Fargo, ND 58102',1885928864,21452,'LavondaCray@cinema.com','password'),(147107432,'Kristan','Pendelton','1971-02-18',5,'F','25 Leatherwood Rd. Ashtabula, OH 44004',2147483647,19824,'KristanPendelton@cinema.com','password'),(151678918,'Ismael','Zimmerman','1972-02-04',3,'F','496 Green St. Dearborn, MI 48124',2147483647,19730,'IsmaelZimmerman@cinema.com','password'),(151714150,'Trista','Hamp','2002-09-04',7,'F','8682 Hamilton Street Dunedin, FL 34698',2147483647,39719,'TristaHamp@cinema.com','password'),(169497765,'Emeline','Reza','1983-01-03',1,'F','600 Amerige Drive Lansdowne, PA 19050',2147483647,21537,'EmelineReza@cinema.com','password'),(206942714,'Retha','Pulice','1998-04-16',5,'M','403 Chestnut Court Malden, MA 02148',1321545669,13979,'RethaPulice@cinema.com','pssword'),(216061384,'Joslyn','Winkleman','1998-03-31',1,'F','732 Broad Dr. Latrobe, PA 15650',4596567370,21141,'JoslynWinkleman@cinema.com','pssword'),(231616954,'Jaqueline','Oullette','1982-07-24',7,'F','561 Wood Ave. Methuen, MA 01844',8282192677,38467,'JaquelineOullette@cinema.com','pssword'),(253256586,'Lula','Parmer','1988-01-19',7,'F','9916 West Piper Street Depew, NY 14043',9183193267,30189,'LulaParmer@cinema.com','pssword'),(282753390,'Collin','Eiler','1984-03-30',2,'M','20 South Railroad St. Elk Grove Village, IL 60007',6841190243,36098,'CollinEiler@cinema.com','pssword'),(296265734,'Mimi','Walquist','1990-10-17',1,'M','86 Cleveland Lane Hicksville, NY 11801',5475084874,16478,'MimiWalquist@cinema.com','pssword'),(332030992,'Benito','Valasquez','1973-11-23',2,'M','22 3rd St. Winter Haven, FL 33880',5642134206,28611,'BenitoValasquez@cinema.com','pssword'),(365251878,'Kitty','Mounce','1990-02-28',5,'F','7141 West Pendergast Dr. Danvers, MA 01923',4929282982,27659,'KittyMounce@cinema.com','pssword'),(379014912,'Ceola','Acheson','1982-08-16',3,'M','47 Alderwood St. Lake Villa, IL 60046',9532190949,18754,'CeolaAcheson@cinema.com','pssword'),(456344230,'Ocie','Mccawley','1971-09-14',1,'M','33 North Sleepy Hollow Drive Saint Joseph, MI 49085',9352451752,17241,'OcieMccawley@cinema.com','pssword'),(464510077,'Anastacia','Marshal','1989-10-19',3,'F','7628 West Meadowbrook Street Crystal Lake, IL 60014',1712373608,16661,'AnastaciaMarshal@cinema.com','pssword'),(481489237,'Abby','Pons','1971-05-30',3,'F','46 S. New Saddle Rd. Mentor, OH 44060',9355518570,34808,'AbbyPons@cinema.com','pssword'),(488138342,'Gerald','Trower','2000-07-17',7,'F','9069 Winchester Ave. Grove City, OH 43123',8323386419,14813,'GeraldTrower@cinema.com','pssword'),(553428895,'Jong','Rutland','1991-11-04',7,'F','84 South Orchard Street Lynn, MA 01902',5804226658,33453,'JongRutland@cinema.com','pssword'),(553590555,'Carlena','Rayford','1991-08-10',6,'F','20 Addison Lane Braintree, MA 02184',3035261620,21718,'CarlenaRayford@cinema.com','pssword'),(578815862,'Dinah','Whalley','1987-05-14',9,'F','9103 W. Santa Clara Ave. Glastonbury, CT 06033',2806019839,39287,'DinahWhalley@cinema.com','pssword'),(579204799,'Johnson','Houtz','1979-09-24',6,'M','842 Pin Oak Drive Mechanicsville, VA 23111',3411576606,26630,'JohnsonHoutz@cinema.com','pssword'),(596454599,'Julianne','Freeberg','1983-03-16',7,'M','9421 St Louis Avenue Lynn, MA 01902',1414226531,25838,'JulianneFreeberg@cinema.com','pssword'),(612696795,'Pam','Lohr','1973-07-10',1,'M','7 West Oak St. Smithtown, NY 11787',7151599079,33144,'PamLohr@cinema.com','pssword'),(627639647,'Brigid','Terry','1975-10-12',6,'M','653 Wayne Dr. Graham, NC 27253',8444756089,29164,'BrigidTerry@cinema.com','pssword'),(643264285,'Marybeth','Haun','1991-04-30',2,'M','776 Lakeshore St. Fort Wayne, IN 46804',8480962385,12889,'MarybethHaun@cinema.com','pssword'),(648793326,'Nohemi','Kaminsky','1993-10-30',4,'F','230 Rosewood Street Howard Beach, NY 11414',2788368079,11814,'NohemiKaminsky@cinema.com','pssword'),(705219478,'Catina','Caron','1974-02-08',10,'M','8862 W. Strawberry Street Vernon Rockville, CT 06066',2820079019,39516,'CatinaCaron@cinema.com','pssword'),(740896641,'Carmine','Marcucci','1979-09-15',3,'F','96 Rockwell Lane New Berlin, WI 53151',4528965473,28094,'CarmineMarcucci@cinema.com','pssword'),(752900308,'Beatriz','Spradley','1971-07-05',4,'F','50 Lantern Avenue Middle River, MD 21220',7409446817,26499,'BeatrizSpradley@cinema.com','pssword'),(756020616,'Linn','Gibbens','1990-06-19',4,'M','9238 Cross Lane Fresh Meadows, NY 11365',5934312618,18157,'LinnGibbens@cinema.com','pssword'),(758321333,'Myrtice','Gaiter','1990-06-05',7,'F','44 Bedford St. Schaumburg, IL 60193',4775071047,11154,'MyrticeGaiter@cinema.com','pssword'),(770585654,'Danny','Milum','2001-03-13',9,'F','85 Pennsylvania Drive Middletown, CT 06457',4946296715,35227,'DannyMilum@cinema.com','pssword'),(826107766,'Elisabeth','Mcdonough','1999-05-01',8,'M','308 Winding Way Lane Valley Stream, NY 11580',5449516780,14210,'ElisabethMcdonough@cinema.com','pssword'),(827189609,'Eldora','Gaines','1999-06-07',5,'F','7710 Bowman Court Waterbury, CT 06705',7136301991,30800,'EldoraGaines@cinema.com','pssword'),(841972318,'Lilly','Hearns','1985-09-14',3,'F','227 Big Rock Cove Street Kent, OH 44240',9632068808,31515,'LillyHearns@cinema.com','pssword'),(849431964,'Jennell','Meneses','1971-08-30',7,'F','110 Edgewood Street New Windsor, NY 12553',7677802797,11224,'JennellMeneses@cinema.com','pssword'),(857034935,'Lessie','Viveros','1974-01-30',9,'F','7123 North Jackson St. Lenoir, NC 28645',1279113579,31887,'LessieViveros@cinema.com','pssword'),(892348753,'Aurora','Chaparro','1979-10-09',3,'F','784 West Glenwood St. Southaven, MS 38671',2737381859,15109,'AuroraChaparro@cinema.com','pssword'),(901988299,'Ioan','Kosslyn','1967-08-12',10,'M',NULL,NULL,NULL,NULL,'pssword'),(905141829,'Ardelle','Jamerson','1975-11-10',4,'M','7840 Bedford Drive Frederick, MD 21701',1034235454,10904,'ArdelleJamerson@cinema.com','pssword'),(909902542,'Sharda','Gemmell','1971-10-05',2,'M','7622 High Ridge Lane North Tonawanda, NY 14120',1251359757,27017,'ShardaGemmell@cinema.com','pssword'),(924327241,'Ashlea','Petry','1994-04-03',9,'F','143 Courtland St. Saint Augustine, FL 32084',6978123375,20863,'AshleaPetry@cinema.com','pssword'),(926590613,'Agustina','Nuzzo','1996-10-05',8,'M','7632 W. Snake Hill Street Covington, GA 30014',4906722172,24056,'AgustinaNuzzo@cinema.com','pssword'),(946443845,'Casey','Callanan','1989-08-16',2,'M','157 Wild Horse Road Ooltewah, TN 37363',6081140045,26901,'CaseyCallanan@cinema.com','pssword'),(957373433,'Maryjo','Bingman','1995-02-11',9,'F','654 Livingston Avenue Baton Rouge, LA 70806',2849902172,34789,'MaryjoBingman@cinema.com','pssword'),(970417984,'Julianna','Kates','1978-12-08',3,'M','7325 Kent Drive Sicklerville, NJ 08081',4865977192,18867,'JuliannaKates@cinema.com','pssword'),(971024289,'Hellen','Chartrand','1983-11-03',7,'M','614 East Sage Dr. Manchester Township, NJ 08759',2358022784,29835,'HellenChartrand@cinema.com','pssword'),(971588083,'Corene','Raulston','1983-09-13',3,'M','68 San Pablo Street Flint, MI 48504',1372817097,27434,'CoreneRaulston@cinema.com','pssword'),(978785753,'Lilian','Montesinos','1979-09-13',9,'M','7500 Shub Farm Dr. Oak Park, MI 48237',9802394512,37631,'LilianMontesinos@cinema.com','pssword'),(980355605,'Madelaine','Springfield','2000-08-31',1,'F','975 South Bow Ridge Street Des Moines, IA 50310',7980898181,18841,'MadelaineSpringfield@cinema.com','pssword');

#
# Structure for table "movie"
#

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(30) NOT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  `LENGTH` time NOT NULL,
  `EARNINGS` double DEFAULT NULL,
  `AIR_LENGTH` int(11) DEFAULT NULL,
  `POSTER_PATH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#

INSERT INTO `movie` VALUES (1,'Beauty and the Beast','2017-02-23','02:19:00',61843,60,'../../movie_images/Beauty_and_the_Beast_2017.jpg'),(2,'Doctor Strange','2016-10-13','01:55:00',197205,86,'../../movie_images/Doctor_Strange.jpg'),(3,'Finding Dory','2016-06-17','01:40:00',523498,217,'../../movie_images/Finding_Dory.jpg'),(4,'Ghost in the Shell','2017-03-31','02:00:00',6,5000,'../../movie_images/Ghost_in_the_Shell.jpg'),(5,'Hell or High Water','2016-08-19','01:43:00',18612,190,'../../movie_images/Hell_or_High_Water.jpg'),(6,'Manchester by the Sea','2016-11-18','02:17:00',54612,126,'../../movie_images/Manchester_By_The_Sea.jpg'),(7,'Moana','2016-11-23','01:53:00',1000000,136,'../../movie_images/Moana.jpg'),(8,'Star Wars: Rogue One','2016-12-16','02:13:00',2000000,100,'../../movie_images/Rogue_One_A_Star_Wars_Story.jpg'),(9,'Spider-Man: Homecoming','2017-06-17','00:00:00',0,0,'../../movie_images/Spiderman_Homecoming.jpg'),(10,'The Jungle Book','2016-04-15','01:51:00',500000,269,'../../movie_images/The_Jungle_Book.jpg'),(11,'The Circle','2017-04-28','00:00:00',0,0,'../../movie_images/The_Circle.jpg'),(12,'Baywatch','2017-05-26','00:00:00',0,0,'../../movie_images/Baywatch.jpg');

#
# Structure for table "review"
#

DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONTENT` varchar(255) DEFAULT NULL,
  `RATING` int(2) DEFAULT NULL,
  `MOVIE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MOVIE_ID` (`MOVIE_ID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "review"
#

INSERT INTO `review` VALUES (1,'\"Awesome music, CGI, action, and story! I\'d give this a 10 but the beginning is slow and a bit confusing, and there isn\'t enough Darth Vader…\"',8,8),(2,'\"Emma Watson was great. Otherwise, not a bad rendition of the movie. Some continuity errors. The original was better by far though.\"',6,1),(3,'\"Amazing follow up to a classic! My kid and I loved the original movie and this movie is a great spiritual successor to such a classic. 9/10!\"',9,3),(4,'\"lol this is too fruity\"',1,7),(5,'\"mediocre rendition. Good CGI and idea, but doesn\'t go nearly in depth, have meaning, or the flair of the original. \"',5,4),(6,'\"Hell or High Water is a genre film that transcends genre, an iconic American tale that is nonetheless firmly grounded in both place and time.\"',10,5),(7,'\"I\'d probably love this movie, but the auditorim was way too loud, and the goers were way too disruptive, along with the state of the place! This review is more for the theatre.\"',6,6),(8,'\"Tense, intensive, high impact, and witty. Doctor Strange in a nutshell. Great movie. Would watch again!\"',8,2),(9,'\"It\'s not a bad movie, but it\'s been airing in this theatre for a long time. I think it\'s time to shelve it.\"',6,10),(10,'\"Why is the copy of the movie shown so low quality? And the people watching it were terrible. Awful experience.\"',2,6),(11,'\"Good standalone movie, but for something that\'s supposed to be a Finding Nemo sequel, it falls short.\"',7,3),(12,'\"It\'s not a bad movie by any means, but there\'s so many stupid Superhero movies… Can\'t there be something new, like a good fantasy movie not tied to comic books for once??\"',5,2),(13,'\"Great, mysterious, captivating, and awe inspiring.\"',8,10),(14,'\"Great CGI, thought provoking, and Scarlett Johansson alone makes the movie great. You could say I\'m her biggest fan… :)\"',8,4),(15,'\"lol way too edgy… try harder…\"',5,5),(16,'\"A bit light on the Force related aspects of the series, but otherwise a pretty good movie, and a good tie in for the Prequels and the OT. Worth your time and money. The ending is especially worth it.\"',7,8),(17,'\"washed up actor only good in one series trying another show…. Nice job disney, pushing your misogynistic views on everyone… terrible, disgusting….\"',2,1),(18,'\"One of the worst movies of 2016. Why this is still airing is beneath me. Don\'t waste your time or your money on this garbage.\"',4,7);

#
# Structure for table "showing"
#

DROP TABLE IF EXISTS `showing`;
CREATE TABLE `showing` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `START_TIME` time DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `MOVIE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MOVIE_ID` (`MOVIE_ID`),
  CONSTRAINT `showing_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

#
# Data for table "showing"
#

INSERT INTO `showing` VALUES (1,'15:00:00',12,1),(2,'12:15:00',11,2),(3,'13:00:00',15,3),(4,'12:30:00',10,4),(5,'15:15:00',8,5),(6,'14:00:00',6,6),(7,'15:30:00',8,7),(8,'19:30:00',13,8),(10,'19:00:00',5,10);

#
# Structure for table "auditorium"
#

DROP TABLE IF EXISTS `auditorium`;
CREATE TABLE `auditorium` (
  `AUD_NO` int(11) NOT NULL AUTO_INCREMENT,
  `SEAT_COUNT` int(11) NOT NULL,
  `SHOWING_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AUD_NO`),
  KEY `SHOWING_ID` (`SHOWING_ID`),
  CONSTRAINT `auditorium_ibfk_1` FOREIGN KEY (`SHOWING_ID`) REFERENCES `showing` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

#
# Data for table "auditorium"
#

INSERT INTO `auditorium` VALUES (16,250,1),(17,257,2),(18,300,3),(19,240,4),(20,233,5),(21,301,6),(22,180,7),(23,260,8),(24,270,10);

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

#
# Data for table "tickets"
#

INSERT INTO `tickets` VALUES (1,233,5,4),(2,271,6,32),(3,210,10,5),(4,192,4,43),(5,112,2,42),(6,210,8,9),(7,84,3,10),(8,117,7,20),(9,166,1,46),(10,221,8,41),(11,136,4,30),(12,201,3,18),(13,55,10,21),(14,76,5,45),(15,5,6,23),(16,213,2,44),(17,206,1,33),(18,60,7,34),(19,93,5,36),(20,109,6,19),(21,116,2,29),(22,124,4,13),(23,239,8,50),(24,162,7,11),(25,263,3,25),(26,153,10,49),(27,88,1,48),(28,173,2,15),(29,96,6,1),(30,36,1,26),(31,110,4,24),(32,48,8,22),(33,178,7,47),(34,80,5,39),(35,148,10,8),(36,220,3,16),(37,171,10,35),(38,222,3,17),(39,94,7,37),(40,161,4,28),(41,116,2,7),(42,116,1,2),(43,229,5,6),(44,294,6,40),(45,195,8,38),(46,12,6,12),(47,29,4,27),(48,263,3,3),(49,141,8,14),(50,49,8,31);
