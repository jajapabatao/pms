

CREATE TABLE `audit_trail` (
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;






CREATE TABLE `billing` (
  `billing_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(50) NOT NULL,
  `project` varchar(123) NOT NULL,
  `totalcost` decimal(10,2) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `topay` decimal(10,2) NOT NULL,
  `datee` varchar(50) NOT NULL,
  `enddate` date NOT NULL,
  `prepared` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`billing_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;


INSERT INTO billing VALUES
("3","ESCOBINAS, CARMINA","ROAD WIDENING","2620.00","2320.00","0.00","2017-02-01","0000-00-00","BELTRAN, EUNICE S.","hidden"),
("4","ESCOBINAS, CARMINA","ROAD WIDENING","2320.00","1320.00","13220.00","2017-02-01","2017-02-01","BELTRAN, EUNICE S.","hidden"),
("5","ESCOBINAS, CARMINA","PERSAN","1500.00","1000.00","0.00","2017-02-01","0000-00-00","BELTRAN, EUNICE S.","hidden"),
("6","ESCOBINAS, CARMINA","CONDOMINIUM","1040.00","540.00","0.00","2017-02-01","2017-02-23","BELTRAN, EUNICE S.","Active"),
("7","ESCOBINAS, CARMINA","","0.00","0.00","0.00","2017-11-23","0000-00-00","",""),
("8","ESCOBINAS, CARMINA","","0.00","0.00","0.00","2017-11-23","0000-00-00","",""),
("9","ESCOBINAS, CARMINA","CONDOMINIUM","150.00","150.00","150.00","2017-11-23","0000-00-00","BELTRAN, EUNICE S.","Active"),
("10","SARABIA. CHESTER .","FINAL PROJECT","2100.00","0.00","0.00","2018-02-09","2018-07-18","BELTRAN, EUNICE  S","Active"),
("11","ESCOBINAS, CARMINA","PERSAN","1000.00","0.00","0.00","2018-02-09","2018-02-28","BELTRAN, EUNICE S.","Active"),
("12","ESCOBINAS, CARMINA","PERSAN","1000.00","1000.00","1000.00","2018-02-16","0000-00-00","BELTRAN, EUNICE S.","Active"),
("13","ESCOBINAS, CARMINA","PERSAN","1000.00","1000.00","1000.00","2018-02-16","0000-00-00","BELTRAN, EUNICE S.","Active"),
("14","ESCOBINAS, CARMINA","PERSAN","1000.00","1000.00","1000.00","2018-02-16","0000-00-00","BELTRAN, EUNICE S.","Active"),
("15","ESCOBINAS, CARMINA","PERSAN","1000.00","500.00","0.00","2018-02-16","2018-02-24","BELTRAN, EUNICE S.","Active"),
("16","SARABIA. CHESTER .","CONSTRUCTION","1200.00","0.00","0.00","2018-02-20","2018-02-21","BELTRAN, EUNICE  S","Active");




CREATE TABLE `category` (
  `category_no` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`category_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO category VALUES
("1","METAL","active"),
("2","WOOD","Active"),
("3","ELECTRICAL","Active"),
("4","PLASTIC","Active"),
("5","ALUMINUM","Active"),
("6","MARBLE","Active"),
("7","ADOBE","Active");




CREATE TABLE `customer` (
  `customer_no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(123) NOT NULL,
  `password` varchar(123) NOT NULL,
  `cust_type` varchar(50) DEFAULT NULL,
  `comp_name` varchar(100) DEFAULT NULL,
  `phone_num` varchar(12) NOT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;


INSERT INTO customer VALUES
("1","cust","admin","Individual","","","","beltseunice@yahoo.com","CHESTER","","SARABIA","09123786658","PEMBO","MAKATI","inactive"),
("2","finale","admin","Individual","","","","finale@yahoo.com","FINALE","FINALE","FINALE","123","FINALE","FINALE","inactive"),
("3","123","123","Individual","","","","13@yahoo.com","132","13","132","132","13","123","inactive");




CREATE TABLE `delivery` (
  `delivery_no` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(50) DEFAULT NULL,
  `date` varchar(123) DEFAULT NULL,
  `verified_by` varchar(50) DEFAULT NULL,
  `status` varchar(123) NOT NULL,
  PRIMARY KEY (`delivery_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO delivery VALUES
("1","PERSAN","2017-02-01","BELTRAN, EUNICE S.","active"),
("2","PERSAN","2017-02-01","BELTRAN, EUNICE S.","active"),
("3","PERSAN","2017-11-24","BELTRAN, EUNICE S.","active"),
("4","PERSAN","2017-11-24","BELTRAN, EUNICE S.","active"),
("5","PERSAN","2017-11-24","BELTRAN, EUNICE S.","active"),
("6","PERSAN","2017-11-24","BELTRAN, EUNICE S.","active"),
("7","FINAL SUPPLIER","02-23-2018","BELTRAN, EUNICE  S","active");




CREATE TABLE `delivery_cart` (
  `delivery_no` int(11) DEFAULT NULL,
  `po_no` int(123) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `material_no` int(11) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `scategory_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `package` varchar(100) DEFAULT NULL,
  `unit_measurement` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `abbre` varchar(50) NOT NULL,
  `status` varchar(123) NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO delivery_cart VALUES
("1","1","b321a284f16dcfb7f148a006aea26d2e","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","5","m","active"),
("2","2","2d6a0b05c47c1a3e27d0a2f647443ae7","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","5","m","active"),
("2","2","5c8662c6ea9e520a239c37960a207b7b","PERSAN","7","","METALS","POLES","LONG","","BOX","100","5","m","active"),
("2","2","fdbc06badfa5bd6ce7c4266c1031fe9a","PERSAN","6","","ELECTRICAL","WIRES","ALUMINUM","","BOX","100","5","m","active"),
("2","2","9ab3eeeca2c9a1ac4ee6064e87db644b","PERSAN","8","","WOODS","PLY WOOD","","","BOX","50","5","m","active"),
("4","1","5ed5414ecfc96975d84485ce5499bd46","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","1","m","active"),
("4","4","e22a83e4562b8503a4505c60a4ac22e2","PERSAN","6","","ELECTRICAL","WIRES","ALUMINUM","","BOX","100","4","m","active"),
("4","4","b138babf37434cc9d56daf2350c1c0ef","PERSAN","7","","METALS","POLES","LONG","","BOX","100","4","m","active"),
("4","4","0d1bd46b3bf92dd6a7e5c82cd3af618e","PERSAN","8","","WOODS","PLY WOOD","","","BOX","50","3","m","active"),
("4","4","4871dc73552bc48fb3b1e7e411769566","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","8","m","active"),
("4","2","04f85531132aca644472d5e234044acd","PERSAN","6","","ELECTRICAL","WIRES","ALUMINUM","","BOX","100","5","m","active"),
("4","2","c070f79afc24633b07fae6c47a2e8f7b","PERSAN","7","","METALS","POLES","LONG","","BOX","100","5","m","active"),
("4","2","54d2373127f4a4eb3eda41c0cffc1c9c","PERSAN","8","","WOODS","PLY WOOD","","","BOX","50","5","m","active"),
("4","2","3531472ae8d217b0985024741ac1bcac","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","5","m","active"),
("4","1","87cae00af54d2e4190500b756df5aaa4","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","1","m","active"),
("7","5","d855a9b5786c2ae5624d5c39eb8eaa66","FINAL SUPPLIER","9","FINALE","FINALE","SUBCATEGORY TESTING","FINALE","FINALE","FINALE","123","17","finale","active");




CREATE TABLE `employee` (
  `image` text,
  `emp_no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(30) DEFAULT NULL,
  `middlename` varchar(30) DEFAULT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `position` varchar(30) DEFAULT NULL,
  `contact` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`emp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;


INSERT INTO employee VALUES
("profile.jpg","1","admin","admin","JAJA","SARTE","PABATAO","ADMIN","09561574211","jajapabatao@8layertech.com","KAPITOLYO","PASIG CITY","active"),
("profile2.jpg","2","carlito","admin","CARL","","KALABAW","FOREMAN","09489338914","edni@gmail.com","STA. ANA","MANILA","inactive"),
("avatar3.png","3","erika","admin","PETER"," QUEVA","MARQUEZ","FOREMAN","09093354326","petermarquez89@gmail.com","ANGELES","PAMPANGA","Active"),
("image/external-hard-drive.jpg","4","john","admin","MARIANNE","F","LUIS","QUANTITY SURVEYOR","09235637824","marianneseoul@gmail.com","D. MACAPAGAL","MANILA","inactive"),
("download.jpeg","5","user1","admin","ASHLEY","SEJAS","GRAY","SECRETARY","09167872845","ashleygray@gmail.com","89 IRIS STREET, BRGY. ADDITION","MANDALUYONG","Active"),
("user7-128x128.jpg","6","fake","admin","MIGUEL","MERIC","DOMINGO","STOCKMAN","09237658902","kleopatra@yahoo.com","BONI","MANDALUYONG","Active"),
("image/external-hard-drive.jpg","7","celeena","admin","STEPH"," ","CURRY","STOCKMAN","09127589903","shitty@yahoo.com","KALENTONG","MANDALUYONG","inactive"),
("avatar5.png","8","monica","admin","MONICA","ROCHELLE","PADILLA","ACCOUNTANT","09186352227","monicapadilla@gmail.com","FRISCO","QUEZON CITY","Active"),
("avatar.png","9","admin1","admin","NEIL","ELIJAH","KALAW","ADMIN","09124676689","neilkalaw@gmail.com","MAYBUNGA","PASIG CITY","Active"),
("external-hard-drive.jpg","10","naruto","admin","NARUTO"," E","UZUMAKI","QUANTITY SURVEYOR","09364693975","narutoship@gmail.com","SAN MIGUEL","PASIG CITY","inactive"),
("image/external-hard-drive.jpg","11","test","admin","TEST","CABAN","O\'NEAL","FOREMAN","12345678901","antonio_santos@17yahoo.com","1 GOLD","PASIG CITY","inactive"),
("mbuntu-11.jpg","12","asd","admin","ASDASD","DASDASD","ASDASD","ADMIN","12312","asdsad@yahoo.com","ASDAS","DASD","inactive"),
("image/external-hard-drive.jpg","13","admin","","SSSS","LSSSS","L","ADMIN","123","l@yahoo.com","123","123","inactive"),
("user3-128x128.jpg","14","belts","admin","EUNICE","SAUS","BELTRAN","ADMIN","09567330463","beltstran@gmail.com","TALANAY","QUEZON CITY","Active"),
("avatar2.png","15","gabby","admin","GABBY","KISA","REYES","FOREMAN","09587452136","gabbyreyes@gmail.com","FILINVEST","QUEZON CITY","Active"),
("camera.jpg","16","test","test","TEST","TEST","TEST","FOREMAN","123","test@yahoo.com","TEST","TEST","inactive"),
("avatar04.png","17","enrique","admin","ENRIQUE","JOHN","REYES","STOCKMAN","09568974139","enriquereyes@gmail.com","MONTALBAN","SAN MATEO","Active"),
("avatar5.png","18","finale","admin","TRISTAN","JEN","RODRIGUEZ","SECRETARY","09568315963","tristanrodriguqez@gmail.com","FINALE","FINALE","Active"),
("avatar.png","19","mel","admin","MEL","MEL","MEL","FOREMAN","123","mel@yahoo.com","MEL","MEL","inactive"),
("avatar.png","20","mel","mel","MEL","MEL","MEL","FOREMAN","123","mel@yahoo.com","MEL","MEL","inactive"),
("avatar.png","21","mel","mel","MEL","MEL","MEL","FOREMAN","123","mel@yahoo.com","MEL","MEL","inactive"),
("avatar.png","22","mel","mel","MEL","MEL","MEL","FOREMAN","123","mel@yahoo.com","MEL","MEL","inactive"),
("avatar.png","23","mel","mel","MEL","MEL","MEL","FOREMAN","123","mel@yahoo.com","MEL","MEL","inactive"),
("user1-128x128.jpg","24","1","c4ca4238a0b923820dcc509a6f75849b","QWEQWEQW","EQQWEQEW","1EQWEQWEQW","ADMIN","1","1@yahoo.com","1","1","Active"),
("user1-128x128.jpg","25","surveyor","admin","CHRISTOPHER","MERIDAN","DELA PAZ","QUANTITY SURVEYOR","09789321469","christoperdelapax@gmail.com","LIFEHOMES","PASIG CITY","Active");




CREATE TABLE `materialreq` (
  `req_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(123) NOT NULL,
  `project` varchar(123) NOT NULL,
  `date` varchar(123) NOT NULL,
  `requested_by` varchar(123) NOT NULL,
  `status` varchar(123) NOT NULL,
  PRIMARY KEY (`req_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO materialreq VALUES
("1","ESCOBINAS, CARMINA S.","PERSAN","01/02/2017","BELTRAN, EUNICE S.","active"),
("2","ESCOBINAS, CARMINA S.","CONDOMINIUM","01/02/2017","BELTRAN, EUNICE S.","active"),
("3","ESCOBINAS, CARMINA S.","CONDOMINIUM","07/02/2017","BELTRAN, EUNICE S.","active"),
("4","SARABIA. CHESTER .","FINAL PROJECT","09/02/2018","BELTRAN, EUNICE  S","active"),
("5","SARABIA. CHESTER .","CONSTRUCTION","20/02/2018","BELTRAN, EUNICE  S","active"),
("6","132, 132 1.","FINALE PROYEKTO","23/02/2018","BELTRAN, EUNICE  S","active");




CREATE TABLE `materialreq_cart` (
  `req_no` int(11) DEFAULT NULL,
  `code` varchar(123) NOT NULL,
  `customer` varchar(123) NOT NULL,
  `project` varchar(50) DEFAULT NULL,
  `material_no` int(11) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `scategory_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `unit_measurement` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `abbre` varchar(50) NOT NULL,
  `status` varchar(123) NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO materialreq_cart VALUES
("4","0a84ee0953b62452bcb90119bca34c94","DOE, JOHN .","FINAL PROJECT","7","","METALS","POLES","LONG","","BOX","100","0","m","active"),
("6","11c61d87412c7ad3c1f0cdf2c4fda990","132, 132 1.","FINALE PROYEKTO","9","FINALE","FINALE","SUBCATEGORY TESTING","FINALE","FINALE","FINALE","123","0","finale","active"),
("3","2d46f7bd000ba733dcd071f9245a05f8","ESCOBINAS, CARMINA","CONDOMINIUM","6","","ELECTRICAL","WIRES","ALUMINUM","","","100","1","m","active"),
("4","35e8e2c284c86c05d348d7c2f4e8d579","DOE, JOHN .","FINAL PROJECT","8","","WOODS","PLY WOOD","","","BOX","50","0","m","active"),
("4","36db2df8531600073f3c4f39dc412d8f","DOE, JOHN .","FINAL PROJECT","6","","ELECTRICAL","WIRES","ALUMINUM","","BOX","100","0","m","active"),
("2","55e783de4345fd9ae5f370b83cef5b47","ESCOBINAS, CARMINA","CONDOMINIUM","8","","WOODS","PLY WOOD","","","","50","0","m","active"),
("1","9312f61cd346132f1f3d8852739952cd","ESCOBINAS, CARMINA","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","1","m","active"),
("2","a97ae82b5602aba3ba053fffcb6936a7","ESCOBINAS, CARMINA","CONDOMINIUM","5","METS","METALS","NAIL","HEYYA","SILVER","","100","0","m","active"),
("2","c66f0edddecf766ec22a696558561a4c","ESCOBINAS, CARMINA","CONDOMINIUM","7","","METALS","POLES","LONG","","","100","0","m","active"),
("5","d1808bc1c7ee936bc9d80ecdae20c7f0","DOE, JOHN .","CONSTRUCTION","6","","ELECTRICAL","WIRES","ALUMINUM","","","100","0","m","active"),
("4","f5fb3a4d2516bad00dc5bba7000602bf","DOE, JOHN .","FINAL PROJECT","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","0","m","active");




CREATE TABLE `materials` (
  `material_no` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `scategory_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `unit_measurement` varchar(50) DEFAULT NULL,
  `abbre` varchar(50) DEFAULT NULL,
  `quantity` int(12) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`material_no`),
  UNIQUE KEY `product_code` (`code`),
  UNIQUE KEY `product_code_2` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


INSERT INTO materials VALUES
("5","mtrl1","METALS","NAIL","1-INCH NAIL","METS","SILVER","PACK","100","m","15","100.00","active"),
("6","mtrl6","ELECTRICAL","WIRES","ROD","","","PACK","100","m","0","150.00","Active"),
("7","mtrl7","METALS","POLES","LONG","","","","100","m","7","20.00","Active"),
("8","mtrl8","WOODS","PLY WOOD","FLATWOOD","POLYWORX","BROWN","PIECE","50","m","6","150.00","active"),
("9","mtrl9","PLASTIC","PLASTIC TOOL","FINALE","FINALE","FINALE","FINALE","123","finale","12","123.00","inactive"),
("10","mtrl10","PLASTIC","PLASTIC TOOL","PLASTIC WIRE","ELIQUOR","SILVER","PACK","25","m","0","250.00","inactive"),
("11","mtrl11","PLASTIC","PLASTIC TOOL","PLASTIC WIRE","ELIQUOR","SILVER","PACK","25","m","0","250.00","inactive");




CREATE TABLE `payment` (
  `payment_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(50) NOT NULL,
  `project` varchar(123) NOT NULL,
  `topay` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `bankname` varchar(50) NOT NULL,
  `chequeno` int(20) NOT NULL,
  `chequedate` date NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


INSERT INTO payment VALUES
("1","ESCOBINAS, CARMINA","","300.00","300.00","","0","0000-00-00","Cash","hidden"),
("2","ESCOBINAS, CARMINA","","1000.00","1000.00","","0","0000-00-00","Cash","Active"),
("3","ESCOBINAS, CARMINA","","500.00","500.00","","0","0000-00-00","Cash","Active"),
("4","ESCOBINAS, CARMINA","","500.00","500.00","","0","0000-00-00","Cash","Active"),
("5","","","150.00","111.00","","0","0000-00-00","","hidden"),
("6","SARABIA. CHESTER .","","2100.00","2100.00","","0","0000-00-00","Cash","Active"),
("7","ESCOBINAS, CARMINA","","500.00","500.00","","0","0000-00-00","Cash","Active"),
("8","ESCOBINAS, CARMINA","","1000.00","1000.00","","0","0000-00-00","Cheque","Active"),
("9","SARABIA. CHESTER .","","1200.00","1200.00","","0","0000-00-00","Cash","Active");




CREATE TABLE `position` (
  `position_no` int(11) NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`position_no`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;


INSERT INTO position VALUES
("1","ADMIN","Active"),
("2","FOREMAN","Active"),
("9","QUANTITY SURVEYOR","Active"),
("10","SECRETARY","Active"),
("11","STOCKMAN","Active"),
("12","ACCOUNTANT","Active"),
("13","USER","Active"),
("14","FOREMAN","active"),
("15","SAMPLE POSITION","Active"),
("16","PROJECT MANAGER","Active");




CREATE TABLE `pullout` (
  `pullout_no` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(123) NOT NULL,
  `project` varchar(123) NOT NULL,
  `date` varchar(123) DEFAULT NULL,
  `accepted_by` varchar(123) NOT NULL,
  `status` varchar(123) NOT NULL,
  PRIMARY KEY (`pullout_no`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;


INSERT INTO pullout VALUES
("1","ESCOBINAS, CARMINA","PERSAN","2017-02-01","BELTRAN, EUNICE S","active"),
("2","ESCOBINAS, CARMINA","CONDOMINIUM","2017-02-01","BELTRAN, EUNICE S","active"),
("3","ESCOBINAS, CARMINA","CONDOMINIUM","2017-02-07","BELTRAN, EUNICE S","active"),
("4","ESCOBINAS, CARMINA","CONDOMINIUM","2017-02-10","BELTRAN, EUNICE S","active"),
("5","SARABIA. CHESTER .","FINAL PROJECT","2018-02-09","BELTRAN, EUNICE  S","active"),
("6","SARABIA. CHESTER .","CONSTRUCTION","2018-02-20","BELTRAN, EUNICE  S","active"),
("7","132, 132 1.","FINALE PROYEKTO","2018-02-23","BELTRAN, EUNICE  S","active");




CREATE TABLE `pullout_cart` (
  `pullout_no` int(11) DEFAULT NULL,
  `req_no` int(123) NOT NULL,
  `code` varchar(123) NOT NULL,
  `customer` varchar(123) NOT NULL,
  `project` varchar(123) NOT NULL,
  `material_no` int(11) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `scategory_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `unit_measurement` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `abbre` varchar(50) NOT NULL,
  `status` varchar(123) NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO pullout_cart VALUES
("5","4","03f45224144150fabe51ffded1e9cc94","SARABIA. CHESTER .","FINAL PROJECT","7","","METALS","POLES","LONG","","BOX","100","5","m","active"),
("1","1","0638fc039c98a2d90e3414cabbe171b3","SARABIA. CHESTER .","PERSAN","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","4","m","active"),
("5","4","095c68f47258fce505a1e5c35a3b19e7","SARABIA. CHESTER .","FINAL PROJECT","8","","WOODS","PLY WOOD","","","BOX","50","5","m","active"),
("5","4","1de32c3b04c2dcd3b9e457e8bc37dfad","SARABIA. CHESTER .","FINAL PROJECT","5","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","5","m","active"),
("2","2","351e52cf533540975d33c1762aae6694","SARABIA. CHESTER .","CONDOMINIUM","7","","METALS","POLES","LONG","","","100","2","m","active"),
("2","2","48f4e333ec7bcbdd4a0abf45af429437","SARABIA. CHESTER .","CONDOMINIUM","8","","WOODS","PLY WOOD","","","","50","2","m","active"),
("4","3","749f88508fa2044990a629edbeb64796","SARABIA. CHESTER .","CONDOMINIUM","6","","ELECTRICAL","WIRES","ALUMINUM","","","100","1","m","active"),
("6","5","80db1ec7eeef6c4c5c7e7ca79eb9a794","SARABIA. CHESTER .","CONSTRUCTION","6","","ELECTRICAL","WIRES","ALUMINUM","","","100","5","m","active"),
("7","6","bf4daf7cf397a9ef6e7981382e7219a4","SARABIA. CHESTER .","FINALE PROYEKTO","9","FINALE","FINALE","SUBCATEGORY TESTING","FINALE","FINALE","FINALE","123","5","finale","active"),
("3","3","c135eed170fda1a6e6f273f9ce508122","SARABIA. CHESTER .","CONDOMINIUM","6","","ELECTRICAL","WIRES","ALUMINUM","","","100","3","m","active"),
("2","2","c7a425f5b1257a058200d77d4a587b1a","SARABIA. CHESTER .","CONDOMINIUM","5","METS","METALS","NAIL","HEYYA","SILVER","","100","2","m","active"),
("5","4","f101349d19e28d8dfb518d91e1acff89","SARABIA. CHESTER .","FINAL PROJECT","6","","ELECTRICAL","WIRES","ALUMINUM","","BOX","100","5","m","active");




CREATE TABLE `purchase_cart` (
  `po_no` int(11) DEFAULT NULL,
  `code` varchar(123) NOT NULL,
  `supplier` varchar(100) DEFAULT NULL,
  `material_no` int(11) DEFAULT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `scategory_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `package` varchar(100) DEFAULT NULL,
  `unit_measurement` varchar(100) DEFAULT NULL,
  `abbre` varchar(123) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(123) NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO purchase_cart VALUES
("2","09a2d1e1aec9aee0352a13e3eda84895","1","8","","WOODS","PLY WOOD","","","box","50","m","0","active"),
("4","1084296a50a665719dbdcc982b5c2a9b","1","7","","METALS","POLES","LONG","","box","100","m","0","active"),
("2","4af97ceed7071d0bae0f3e6dc6e5bd11","1","5","METS","METALS","NAIL","","SILVER","box","100","m","0","active"),
("2","69f66b85404bed4680be69b8e8b57700","1","6","","ELECTRICAL","WIRES","ALUMINUM","","box","100","m","0","active"),
("4","81f3232159c4930c74cf89bf79fd1b58","1","6","","ELECTRICAL","WIRES","ALUMINUM","","box","100","m","0","active"),
("1","8b11c545a802b4c508c2943ff7c8849b","1","5","METS","METALS","NAIL","HEYYA","SILVER","box","100","m","3","active"),
("6","9c9d693c54cd6d7d9d44c64238d64267","3","6","","ELECTRICAL","WIRES","ALUMINUM","","","100","m","15","active"),
("5","bae41e3e5d70bfa7cca77eab4a1fe80c","4","9","FINALE","FINALE","SUBCATEGORY TESTING","FINALE","FINALE","finale","123","finale","0","active"),
("4","e3286f6d2058a02d67b373e5077761ca","1","8","","WOODS","PLY WOOD","","","box","50","m","0","active"),
("2","ece9f3d3e39d7b0d37d176198307543c","1","7","","METALS","POLES","LONG","","box","100","m","0","active"),
("4","fe029477f7b244cbc16bdd0fe7b35b1d","1","5","METS","METALS","NAIL","HEYYA","SILVER","box","100","m","0","active");




CREATE TABLE `purchase_order` (
  `po_no` int(11) NOT NULL AUTO_INCREMENT,
  `supplier` varchar(50) DEFAULT NULL,
  `date` varchar(123) DEFAULT NULL,
  `ordered_by` varchar(50) DEFAULT NULL,
  `status` varchar(123) NOT NULL,
  PRIMARY KEY (`po_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO purchase_order VALUES
("1","PERSAN","01/02/2017","BELTRAN, EUNICE S.","active"),
("2","PERSAN","01/02/2017","BELTRAN, EUNICE S.","active"),
("4","PERSAN","24/11/2017","BELTRAN, EUNICE S.","active"),
("5","FINAL SUPPLIER","02-23-2018","BELTRAN, EUNICE  S","active"),
("6","8LAYER","03-07-2018","PABATAO, JAJA S","active");




CREATE TABLE `quotation` (
  `quote_no` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(123) NOT NULL,
  `password` varchar(123) NOT NULL,
  `customer` varchar(100) DEFAULT NULL,
  `project` varchar(100) DEFAULT NULL,
  `date` varchar(123) DEFAULT NULL,
  `due_date` varchar(123) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sales_person` varchar(100) DEFAULT NULL,
  `prepared_by` varchar(100) DEFAULT NULL,
  `status` varchar(123) NOT NULL,
  `total_amount` double(100,2) DEFAULT NULL,
  `balance` decimal(10,2) NOT NULL,
  PRIMARY KEY (`quote_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;


INSERT INTO quotation VALUES
("1","cust","admin","ESCOBINAS, CARMINA","PERSAN","2017-02-01","2018-02-28","NOVALICHES","","nizbelts@yahoo.com","","BELTRAN, EUNICE S.","active","1500.00","0.00"),
("2","cust","admin","ESCOBINAS, CARMINA","CONDOMINIUM","2017-02-01","2017-11-30","QUEZON CITY","","nizbelts@yahoo.com","","BELTRAN, EUNICE S.","active","150.00","150.00"),
("3","cust","admin","SARABIA. CHESTER .","FINAL PROJECT","2018-02-09","2018-07-25","MARIKINA CITY","","nizbelts@yahoo.com","","BELTRAN, EUNICE  S","active","2100.00","0.00"),
("4","cust","admin","SARABIA. CHESTER .","CONSTRUCTION","2018-02-20","2018-07-07","SAN JUAN CITY","","nizbelts@yahoo.com","","BELTRAN, EUNICE  S","active","1200.00","0.00"),
("5","123","123","SARABIA. CHESTER .","FINALE PROYEKTO","2018-02-23","2018-02-28","CALIFORNIA","","austingrego@yahoo.com","","BELTRAN, EUNICE  S","active","615.00","365.00"),
("6","cust","admin","SARABIA, CHESTER .","BRIDGES","2018-03-12","","PEMBO","","beltseunice@yahoo.com","","","requested","","0.00");




CREATE TABLE `quotation_cart` (
  `quote_no` int(11) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `material_no` int(11) NOT NULL,
  `code` varchar(123) NOT NULL,
  `brand_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `scategory_name` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `unit_measurement` varchar(50) DEFAULT NULL,
  `quantity` int(100) DEFAULT NULL,
  `quantity_remaining` int(123) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `abbre` varchar(11) NOT NULL,
  `status` varchar(123) NOT NULL,
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO quotation_cart VALUES
("4","SARABIA. CHESTER .","FINAL PROJECT","8","070d94720e2eb553186018050d5759b5","","WOODS","PLY WOOD","","","BOX","50","5","0","150","m","active"),
("2","PERSAN","CONDOMINIUM","7","07bd9ad622ebfc020cdc8c83fd9c048f","","METALS","POLES","LONG","","","100","2","3","20","m","active"),
("2","PERSAN","CONDOMINIUM","5","1a0f7df48b464edffa43d2e12788a7f1","METS","METALS","NAIL","HEYYA","SILVER","","100","4","1","100","m","active"),
("4","SARABIA. CHESTER .","CONSTRUCTION","6","6bcebdde33ad61c5f4c33fd57716eb28","","ELECTRICAL","WIRES","ALUMINUM","","","100","8","3","150","m","active"),
("5","132, 132 1.","FINALE PROYEKTO","9","792945a53155bd9e160b9bb1c8f1d9b6","FINALE","FINALE","SUBCATEGORY TESTING","FINALE","FINALE","FINALE","123","5","0","123","finale","active"),
("3","PERSAN","CONDOMINIUM","6","8b82d85f60e1ce5ba2984e4fca9acfd0","","ELECTRICAL","WIRES","ALUMINUM","","","100","1","0","150","m","active"),
("4","SARABIA. CHESTER .","FINAL PROJECT","7","8b91347fe9b4e24f34d4153b72ef8646","","METALS","POLES","LONG","","BOX","100","5","0","20","m","active"),
("4","SARABIA. CHESTER .","FINAL PROJECT","5","d2f77aae4e211be1012d6a6fe0b2062d","METS","METALS","NAIL","HEYYA","SILVER","BOX","100","5","0","100","m","active"),
("4","SARABIA. CHESTER .","FINAL PROJECT","6","f13ddb7e72b549ed8dfd36084598a46f","","ELECTRICAL","WIRES","ALUMINUM","","BOX","100","5","0","150","m","active");




CREATE TABLE `sample` (
  `no` int(100) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `status` varchar(123) NOT NULL,
  `account_status` varchar(11) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;


INSERT INTO sample VALUES
("1","admin","admin","admin","active","active"),
("2","belts","admin","admin","inactive","active"),
("3","user1","admin","Foreman","inactive","active"),
("4","user2","admin","Quantity Surveyor","inactive","inactive"),
("5","user3","admin","Secretary","inactive","Active"),
("6","user4","admin","Stockman","inactive","inactive"),
("8","user5","admin","Accountant","inactive","inactive"),
("9","cust","admin","customer","inactive","active"),
("10","admin1","admin","Admin","inactive","Active"),
("11","nina","nina","Quantity Surveyor","inactive","inactive"),
("12","cj","cj","Foreman","inactive","inactive"),
("13","asd","asd","Admin","inactive","Active"),
("15","jaja","admin","Admin","inactive","Active"),
("16","test","test","Foreman","inactive","inactive"),
("17","emp","emp","Stockman","inactive","Active"),
("18","finale","admin","Secretary","inactive","Active"),
("20","123","123","customer","active","active"),
("21","surveyor","admin","QUANTITY SURVEYOR","inactive","Active");




CREATE TABLE `subcategory` (
  `scategory_no` int(100) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `scategory_name` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`scategory_no`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO subcategory VALUES
("1","METALS","TRUSSES","Active"),
("2","WOODS","PLY WOOD","Active"),
("3","METALS","NAIL","Active"),
("4","METALS","POLES","active"),
("5","ELECTRICAL","WIRES","active"),
("6","PLASTIC","PLASTIC TOOL","Active"),
("7","ALUMINUM","ROD","Active"),
("8","MARBLE","TILES","Active"),
("9","ADOBE","ROCK","Active"),
("10","ADOBE","ROCK","Active");




CREATE TABLE `supplier` (
  `supplier_no` int(11) NOT NULL AUTO_INCREMENT,
  `supp_name` varchar(25) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `middlename` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`supplier_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO supplier VALUES
("1","MARALABS","123456789","6546846546","supplier1@yahoo.com","EDWIN","","MARQUEZ","09236873123","MAGINHAWA","NEGROS","active"),
("2","PERSAN","7245961","1234567891","persaninc@yahoo.com","KOBE","","BRYANT","09353791848","23 ORTEGA ST.","SAN JUAN","Active"),
("3","8LAYER","45698745","","geekineers@8layertech.com","MERIC","","MARA","9512364","EAST DRIVE","PASIG CITY","Active"),
("4","FINAL SUPPLIER","123","123","finale@yahoo.com","FINALE","FINALE","FINALEQ","123","FINALE","FINALE","Active");




CREATE TABLE `unitmeasurement` (
  `unit_no` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `unit_measurment` varchar(50) DEFAULT NULL,
  `Abbreviation` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`unit_no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;


INSERT INTO unitmeasurement VALUES
("1","","","KILOGRAM","kg","Active"),
("2","","","GRAM","g","Active"),
("3","","","MILLIGRAM","mg","active"),
("4","","","INCH","in","Active"),
("5","","","CENTIMETER","cm","Active"),
("6","","","METER","m","Active"),
("7","","","LITERS","L","active"),
("8","","","FINALE","finale","Active");


