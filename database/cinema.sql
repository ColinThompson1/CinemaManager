# Host: localhost  (Version 5.7.17-log)
# Date: 2017-03-31 15:27:35
# Generator: MySQL-Front 6.0  (Build 1.82)


#
# Structure for table "advertisers"
#

DROP TABLE IF EXISTS `advertisers`;
CREATE TABLE `advertisers` (
  `ID` int(11) NOT NULL,
  `AD_COMPANY` varchar(15) NOT NULL,
  `REP_NAME` varchar(30) NOT NULL,
  `REP_EMAIL` varchar(30) NOT NULL,
  `REP_PHONE_NO` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`AD_COMPANY`),
  UNIQUE KEY `AD_COMPANY` (`AD_COMPANY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "advertisers"
#

INSERT INTO `advertisers` VALUES (100,'Pepsi Co','James','james@pepsi.com',1234567890),(100,'PepsiCo','James','James@PepsiCo.com',2147483647),(101,'Nike','Jack','jack@nike.com',1234567891),(102,'Adidas','Jill','jill@adidas.com',1234567892),(103,'Reebok','Moe','moe@reebok.com',1234567893),(104,'Wal-Mart','Matthew','Matthew@Wal-Mart.com',2147483647),(105,'ExxonMobil','Tod','Tod@ExxonMobil.com',2147483647),(106,'Chevron','Esta','Esta@Chevron.com',1029064122),(107,'BerkshireHathaw','Dominique','Dominique@BerkshireHathaway.co',2147483647),(108,'Apple','Daniella','Daniella@Apple.com',2147483647),(109,'Phillips66','Julianna','Julianna@Phillips66.com',2147483647),(110,'GeneralMotors','Federico','Federico@GeneralMotors.com',1262013217),(111,'FordMotor','Norine','Norine@FordMotor.com',2147483647),(112,'GeneralElectric','Danuta','Danuta@GeneralElectric.com',2147483647),(113,'ValeroEnergy','Jamar','Jamar@ValeroEnergy.com',2147483647),(114,'CVSCaremark','Charis','Charis@CVSCaremark.com',1702419412),(115,'FannieMae','Roxanne','Roxanne@FannieMae.com',2147483647),(116,'UnitedHealthGro','Shannon','Shannon@UnitedHealthGroup.com',2147483647),(117,'McKesson','Esteban','Esteban@McKesson.com',1506649647),(118,'VerizonCommunic','Lindsay','Lindsay@VerizonCommunications.',2147483647),(119,'Hewlett-Packard','Krystin','Krystin@Hewlett-Packard.com',2147483647),(120,'J.P.MorganChase','Huong','Huong@J.P.MorganChase&Co..com',2128613958),(121,'CostcoWholesale','Rea','Rea@CostcoWholesale.com',1755172119),(122,'ExpressScriptsH','Nohemi','Nohemi@ExpressScriptsHolding.c',1722502533),(123,'BankofAmerica','Scotty','Scotty@BankofAmerica.com',2147483647),(124,'CardinalHealth','Lola','Lola@CardinalHealth.com',2147483647),(125,'InternationalBu','Gerardo','Gerardo@InternationalBusinessM',2147483647);

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
  `ADDRESS` varchar(50) DEFAULT NULL,
  `CREDIT_CARD_NO` bigint(16) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `PHONE_NO` bigint(11) DEFAULT NULL,
  `PASSWORD` varchar(255) NOT NULL DEFAULT 'password',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "customers"
#

INSERT INTO `customers` VALUES (1001,'Rolando','Hoeppner','1970-06-20','M','78 Talbot Drive Princeton, NJ 08540',3787475654640150,'RolandoHoeppner@hotm',8148785473,'password'),(1002,'Cassidy','Cendejas','1970-08-29','M','8832 Sunnyslope Dr. Painesville, OH 44077',7073982773526720,'CassidyCendejas@hotm',8248217414,'password'),(1003,'Zena','Amezquita','1971-01-08','M','64A South Olive Ave. Orange Park, FL 32065',3432194456289050,'ZenaAmezquita@hotmai',7195641278,'password'),(1004,'Doloris','Sanderlin','1974-01-09','M','7800 Oak Meadow St. Chandler, AZ 85224',2953411218102820,'DolorisSanderlin@hot',9501151486,'password'),(1005,'Kalyn','Detweiler','1974-03-31','M','663 Wakehurst Ave. Apt 1 Hixson, TN 37343',3564120674365510,'KalynDetweiler@hotma',9894158459,'password'),(1006,'Hazel','Gehlert','1975-03-15','M','54 E. Vale Court Branford, CT 06405',7648892068562380,'HazelGehlert@hotmail',6072908724,'password'),(1007,'Lawanna','Bongiorno','1975-03-22','M','63 N. Mayfair Street Central Islip, NY 11722',3976458728502910,'LawannaBongiorno@hot',3539892227,'password'),(1008,'Hugo','Ramerez','1975-05-30','M','344 Lexington Drive Wellington, FL 33414',6418872425401900,'HugoRamerez@hotmail.',7666529214,'password'),(1009,'Cecila','Victory','1976-01-15','M','397 La Sierra St. San Jose, CA 95127',1766997064525600,'CecilaVictory@hotmai',4744112183,'password'),(1010,'Charlyn','Parkin','1976-03-27','M','96 East Railroad Street Parlin, NJ 08859',6304970984667640,'CharlynParkin@hotmai',2513200608,'password'),(1011,'Carin','Kellerman','1976-08-05','M','8007 Stonybrook St. Chesterfield, VA 23832',4720467097768030,'CarinKellerman@hotma',2068212665,'password'),(1012,'Rhea','Lebouef','1977-04-14','M','9013 Central Street Lynnwood, WA 98037',8272792886002180,'RheaLebouef@hotmail.',1817354331,'password'),(1013,'Carroll','Gerstein','1978-06-25','M','4 Pleasant Drive West Des Moines, IA 50265',5530879192776730,'CarrollGerstein@hotm',8593650539,'password'),(1014,'Kory','Rotenberry','1978-09-18','M','7 Strawberry Ave. Merrillville, IN 46410',3882811968603930,'KoryRotenberry@hotma',5682343101,'password'),(1015,'Karey','Cates','1981-04-18','M','255 Bohemia Rd. Baldwin, NY 11510',8950064152419190,'KareyCates@hotmail.c',1206633726,'password'),(1016,'Manuel','Meneely','1983-02-12','M','8498 New Lane Kalispell, MT 59901',6671556062370750,'ManuelMeneely@hotmai',7168155262,'password'),(1017,'Cleo','Loughlin','1986-07-25','M','8297 Arcadia St. North Olmsted, OH 44070',1275995801862700,'CleoLoughlin@hotmail',7876998542,'password'),(1018,'Evita','Bader','1990-02-03','M','853 10th Street Lorton, VA 22079',4308215924238670,'EvitaBader@hotmail.c',5317677324,'password'),(1019,'William','Serna','1990-09-13','M','44 Summer Road Montgomery Village, MD 20886',5983069939263980,'WilliamSerna@hotmail',9496783005,'password'),(1020,'Emeline','Artist','1991-02-02','M','95 Oxford St. Titusville, FL 32780',9112372772825820,'EmelineArtist@hotmai',8905254534,'password'),(1021,'Melony','Matzen','1991-02-22','M','730 Ashley St. Peabody, MA 01960',3714867502502300,'MelonyMatzen@hotmail',3298506585,'password'),(1022,'Keila','Mash','1992-01-27','M','997 Lake Forest Drive Kearny, NJ 07032',2295658382453910,'KeilaMash@hotmail.co',1437381392,'password'),(1023,'Vince','Dombrowski','1993-01-24','M','629 Border St. Hagerstown, MD 21740',5785430793452210,'VinceDombrowski@hotm',5753236652,'password'),(1024,'Suzanne','Luebbers','2000-11-22','M','994 Glenridge Street High Point, NC 27265',8135970665804320,'SuzanneLuebbers@hotm',6519387743,'password'),(1025,'Ramiro','Morabito','2002-10-17','F','857 Miles Lane Charlotte, NC 28205',1577784046859960,'RamiroMorabito@hotma',9052903543,'password'),(1026,'Vernetta','Mosher','1970-12-05','F','37 N. Blue Spring Lane Harrisonburg, VA 22801',4030456086717140,'VernettaMosher@hotma',1381927440,'password'),(1027,'Patricia','Man','1971-02-11','F','9420 N. Rockville Lane Miami, FL 33125',7586017448072890,'PatriciaMan@hotmail.',9856625871,'password'),(1028,'Caryl','Billingsly','1971-11-06','F','563 Cherry Hill Drive Upper Darby, PA 19082',5057954105862810,'CarylBillingsly@hotm',2891479148,'password'),(1029,'Erwin','Pujol','1972-02-06','F','374 Anderson St. Baton Rouge, LA 70806',2462157357138090,'ErwinPujol@hotmail.c',1828060670,'password'),(1030,'Sylvester','Nordin','1972-11-13','F','496 West Constitution Circle Columbia, MD 21044',3483591240255390,'SylvesterNordin@hotm',4664984245,'password'),(1031,'Joane','Poage','1973-05-04','F','58 Southampton Drive Ann Arbor, MI 48103',2431760435799940,'JoanePoage@hotmail.c',3711922290,'password'),(1032,'Evon','Sawyer','1976-09-03','F','9176 West Meadowbrook Street Dracut, MA 01826',2074550858415440,'EvonSawyer@hotmail.c',9917995129,'password'),(1033,'Thomasine','Gibbons','1977-06-01','F','54 Arnold Ave. Galloway, OH 43119',1345262675306660,'ThomasineGibbons@hot',1705474703,'password'),(1034,'Damaris','Sessums','1978-07-02','F','406 Campfire Street Westwood, NJ 07675',7256654529652080,'DamarisSessums@hotma',3195699471,'password'),(1035,'Linsey','Hollon','1982-07-30','F','7 Old Sheffield St. Cordova, TN 38016',7313026490402060,'LinseyHollon@hotmail',8182180631,'password'),(1036,'Cammie','Karle','1983-12-19','F','8923 Hickory Lane Riverdale, GA 30274',9799843818870270,'CammieKarle@hotmail.',3437452911,'password'),(1037,'Roosevelt','Cochran','1984-08-04','F','654 Monroe St. Unit 209 West Bend, WI 53095',6707143020990200,'RooseveltCochran@hot',7706386208,'password'),(1038,'Natashia','Wible','1984-08-23','F','891 S. Bedford Street Ocean Springs, MS 39564',1479499886358500,'NatashiaWible@hotmai',3417542431,'password'),(1039,'Isidro','Whitsett','1984-11-06','F','93 SW. Lafayette Drive Barrington, IL 60010',2371791161292260,'IsidroWhitsett@hotma',4599811237,'password'),(1040,'Anh','Beaudette','1985-10-01','F','8110 North Augusta Drive Clarksburg, WV 26301',8101299417884210,'AnhBeaudette@hotmail',6208190278,'password'),(1041,'Moshe','Hankey','1986-06-17','F','23 S. Miller Road Fishers, IN 46037',2766666959888050,'MosheHankey@hotmail.',1953972160,'password'),(1042,'Nettie','Levar','1989-07-30','F','1 William Road Covington, GA 30014',7082049663161620,'NettieLevar@hotmail.',2052769885,'password'),(1043,'Rachel','Swan','1990-02-14','F','985 Deerfield Court Riverview, FL 33569',6529758926731000,'RachelSwan@hotmail.c',3736316137,'password'),(1044,'Frederic','Aburto','1994-05-02','F','5 Country Club Drive Hartselle, AL 35640',2837473736493760,'FredericAburto@hotma',7744278153,'password'),(1045,'Lenore','Guel','1994-10-12','F','794 Illinois Street Fort Lee, NJ 07024',3498674460777760,'LenoreGuel@hotmail.c',2518444804,'password'),(1046,'Maryjane','Skowron','1997-05-16','F','7110 Forest Street Butler, PA 16001',2981234451911020,'MaryjaneSkowron@hotm',7521506144,'password'),(1047,'Shannon','Staples','1997-10-01','F','37 Cambridge Drive Eastpointe, MI 48021',5303430658805660,'ShannonStaples@hotma',3577142408,'password'),(1048,'Branden','Hiltz','1997-11-01','F','62 Poor House Dr. Matthews, NC 28104',8602740146160080,'BrandenHiltz@hotmail',6231146859,'password'),(1049,'Tawny','Mcinerney','2000-07-13','F','7802 Del Monte St. Kingston, NY 12401',7187957464910800,'TawnyMcinerney@hotma',9618733967,'password'),(1050,'Kittie','Ruckman','2001-09-08','F','7470 E. Lower River Street Arlington Heights, IL 6',7415379185852840,'KittieRuckman@hotmai',1625701751,'password');

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
  `ADDRESS` varchar(50) DEFAULT NULL,
  `PHONE_NO` int(11) DEFAULT NULL,
  `SALARY` int(10) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  `PASSWORD` varchar(255) NOT NULL DEFAULT 'password',
  PRIMARY KEY (`SSN`),
  KEY `employee_ibfk_1` (`DNO`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "employee"
#

INSERT INTO `employee` VALUES (139184070,'Lavonda','Cray','1978-11-15',7,NULL,'M','505 West Glenwood Drive Fargo, ND 58102',1885928864,21452,'LavondaCray@cinema.com','password'),(147107432,'Kristan','Pendelton','1971-02-18',5,NULL,'F','25 Leatherwood Rd. Ashtabula, OH 44004',2147483647,19824,'KristanPendelton@cinema.com','password'),(151678918,'Ismael','Zimmerman','1972-02-04',3,NULL,'F','496 Green St. Dearborn, MI 48124',2147483647,19730,'IsmaelZimmerman@cinema.com','password'),(151714150,'Trista','Hamp','2002-09-04',7,NULL,'F','8682 Hamilton Street Dunedin, FL 34698',2147483647,39719,'TristaHamp@cinema.com','password'),(169497765,'Emeline','Reza','1983-01-03',1,NULL,'F','600 Amerige Drive Lansdowne, PA 19050',2147483647,21537,'EmelineReza@cinema.com','password'),(206942714,'Retha','Pulice','1998-04-16',5,NULL,'M','403 Chestnut Court Malden, MA 02148',1321545669,13979,'RethaPulice@cinema.com','password'),(216061384,'Joslyn','Winkleman','1998-03-31',1,NULL,'F','732 Broad Dr. Latrobe, PA 15650',2147483647,21141,'JoslynWinkleman@cinema.com','password'),(231616954,'Jaqueline','Oullette','1982-07-24',7,NULL,'F','561 Wood Ave. Methuen, MA 01844',2147483647,38467,'JaquelineOullette@cinema.com','password'),(253256586,'Lula','Parmer','1988-01-19',7,NULL,'F','9916 West Piper Street Depew, NY 14043',2147483647,30189,'LulaParmer@cinema.com','password'),(282753390,'Collin','Eiler','1984-03-30',2,NULL,'M','20 South Railroad St. Elk Grove Village, IL 60007',2147483647,36098,'CollinEiler@cinema.com','password'),(296265734,'Mimi','Walquist','1990-10-17',1,NULL,'M','86 Cleveland Lane Hicksville, NY 11801',2147483647,16478,'MimiWalquist@cinema.com','password'),(332030992,'Benito','Valasquez','1973-11-23',2,NULL,'M','22 3rd St. Winter Haven, FL 33880',2147483647,28611,'BenitoValasquez@cinema.com','password'),(365251878,'Kitty','Mounce','1990-02-28',5,NULL,'F','7141 West Pendergast Dr. Danvers, MA 01923',2147483647,27659,'KittyMounce@cinema.com','password'),(379014912,'Ceola','Acheson','1982-08-16',3,NULL,'M','47 Alderwood St. Lake Villa, IL 60046',2147483647,18754,'CeolaAcheson@cinema.com','password'),(456344230,'Ocie','Mccawley','1971-09-14',1,NULL,'M','33 North Sleepy Hollow Drive Saint Joseph, MI 4908',2147483647,17241,'OcieMccawley@cinema.com','password'),(464510077,'Anastacia','Marshal','1989-10-19',3,NULL,'F','7628 West Meadowbrook Street Crystal Lake, IL 6001',1712373608,16661,'AnastaciaMarshal@cinema.com','password'),(481489237,'Abby','Pons','1971-05-30',3,NULL,'F','46 S. New Saddle Rd. Mentor, OH 44060',2147483647,34808,'AbbyPons@cinema.com','password'),(488138342,'Gerald','Trower','2000-07-17',7,NULL,'F','9069 Winchester Ave. Grove City, OH 43123',2147483647,14813,'GeraldTrower@cinema.com','password'),(553428895,'Jong','Rutland','1991-11-04',7,NULL,'F','84 South Orchard Street Lynn, MA 01902',2147483647,33453,'JongRutland@cinema.com','password'),(553590555,'Carlena','Rayford','1991-08-10',6,NULL,'F','20 Addison Lane Braintree, MA 02184',2147483647,21718,'CarlenaRayford@cinema.com','password'),(578815862,'Dinah','Whalley','1987-05-14',9,NULL,'F','9103 W. Santa Clara Ave. Glastonbury, CT 06033',2147483647,39287,'DinahWhalley@cinema.com','password'),(579204799,'Johnson','Houtz','1979-09-24',6,NULL,'M','842 Pin Oak Drive Mechanicsville, VA 23111',2147483647,26630,'JohnsonHoutz@cinema.com','password'),(596454599,'Julianne','Freeberg','1983-03-16',7,NULL,'M','9421 St Louis Avenue Lynn, MA 01902',1414226531,25838,'JulianneFreeberg@cinema.com','password'),(612696795,'Pam','Lohr','1973-07-10',1,NULL,'M','7 West Oak St. Smithtown, NY 11787',2147483647,33144,'PamLohr@cinema.com','password'),(627639647,'Brigid','Terry','1975-10-12',6,NULL,'M','653 Wayne Dr. Graham, NC 27253',2147483647,29164,'BrigidTerry@cinema.com','password'),(643264285,'Marybeth','Haun','1991-04-30',2,NULL,'M','776 Lakeshore St. Fort Wayne, IN 46804',2147483647,12889,'MarybethHaun@cinema.com','password'),(648793326,'Nohemi','Kaminsky','1993-10-30',4,NULL,'F','230 Rosewood Street Howard Beach, NY 11414',2147483647,11814,'NohemiKaminsky@cinema.com','password'),(705219478,'Catina','Caron','1974-02-08',1,NULL,'M','8862 W. Strawberry Street Vernon Rockville, CT 060',2147483647,39516,'CatinaCaron@cinema.com','password'),(740896641,'Carmine','Marcucci','1979-09-15',3,NULL,'F','96 Rockwell Lane New Berlin, WI 53151',2147483647,28094,'CarmineMarcucci@cinema.com','password'),(752900308,'Beatriz','Spradley','1971-07-05',4,NULL,'F','50 Lantern Avenue Middle River, MD 21220',2147483647,26499,'BeatrizSpradley@cinema.com','password'),(756020616,'Linn','Gibbens','1990-06-19',4,NULL,'M','9238 Cross Lane Fresh Meadows, NY 11365',2147483647,18157,'LinnGibbens@cinema.com','password'),(758321333,'Myrtice','Gaiter','1990-06-05',7,NULL,'F','44 Bedford St. Schaumburg, IL 60193',2147483647,11154,'MyrticeGaiter@cinema.com','password'),(770585654,'Danny','Milum','2001-03-13',9,NULL,'F','85 Pennsylvania Drive Middletown, CT 06457',2147483647,35227,'DannyMilum@cinema.com','password'),(826107766,'Elisabeth','Mcdonough','1999-05-01',8,NULL,'M','308 Winding Way Lane Valley Stream, NY 11580',2147483647,14210,'ElisabethMcdonough@cinema.com','password'),(827189609,'Eldora','Gaines','1999-06-07',5,NULL,'F','7710 Bowman Court Waterbury, CT 06705',2147483647,30800,'EldoraGaines@cinema.com','password'),(841972318,'Lilly','Hearns','1985-09-14',3,NULL,'F','227 Big Rock Cove Street Kent, OH 44240',2147483647,31515,'LillyHearns@cinema.com','password'),(849431964,'Jennell','Meneses','1971-08-30',7,NULL,'F','110 Edgewood Street New Windsor, NY 12553',2147483647,11224,'JennellMeneses@cinema.com','password'),(857034935,'Lessie','Viveros','1974-01-30',9,NULL,'F','7123 North Jackson St. Lenoir, NC 28645',1279113579,31887,'LessieViveros@cinema.com','password'),(892348753,'Aurora','Chaparro','1979-10-09',3,NULL,'F','784 West Glenwood St. Southaven, MS 38671',2147483647,15109,'AuroraChaparro@cinema.com','password'),(905141829,'Ardelle','Jamerson','1975-11-10',4,NULL,'M','7840 Bedford Drive Frederick, MD 21701',1034235454,10904,'ArdelleJamerson@cinema.com','password'),(909902542,'Sharda','Gemmell','1971-10-05',2,NULL,'M','7622 High Ridge Lane North Tonawanda, NY 14120',1251359757,27017,'ShardaGemmell@cinema.com','password'),(924327241,'Ashlea','Petry','1994-04-03',9,NULL,'F','143 Courtland St. Saint Augustine, FL 32084',2147483647,20863,'AshleaPetry@cinema.com','password'),(926590613,'Agustina','Nuzzo','1996-10-05',8,NULL,'M','7632 W. Snake Hill Street Covington, GA 30014',2147483647,24056,'AgustinaNuzzo@cinema.com','password'),(946443845,'Casey','Callanan','1989-08-16',2,NULL,'M','157 Wild Horse Road Ooltewah, TN 37363',2147483647,26901,'CaseyCallanan@cinema.com','password'),(957373433,'Maryjo','Bingman','1995-02-11',9,NULL,'F','654 Livingston Avenue Baton Rouge, LA 70806',2147483647,34789,'MaryjoBingman@cinema.com','password'),(970417984,'Julianna','Kates','1978-12-08',3,NULL,'M','7325 Kent Drive Sicklerville, NJ 08081',2147483647,18867,'JuliannaKates@cinema.com','password'),(971024289,'Hellen','Chartrand','1983-11-03',7,NULL,'M','614 East Sage Dr. Manchester Township, NJ 08759',2147483647,29835,'HellenChartrand@cinema.com','password'),(971588083,'Corene','Raulston','1983-09-13',3,NULL,'M','68 San Pablo Street Flint, MI 48504',1372817097,27434,'CoreneRaulston@cinema.com','password'),(978785753,'Lilian','Montesinos','1979-09-13',9,NULL,'M','7500 Shub Farm Dr. Oak Park, MI 48237',2147483647,37631,'LilianMontesinos@cinema.com','password'),(980355605,'Madelaine','Springfield','2000-08-31',1,NULL,'F','975 South Bow Ridge Street Des Moines, IA 50310',2147483647,18841,'MadelaineSpringfield@cinema.co','password');

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
  `AIR_LENGTH` time DEFAULT NULL,
  `POSTER_PATH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#


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

