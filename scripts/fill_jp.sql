INSERT INTO `jurassicParkDB`.`country` (`name`)
  VALUES
    ('México'),('EUA'), ('Francia');

INSERT INTO `jurassicParkDB`.`state` (`name`,`country_id`)
  VALUES
    ('Ciudad de México',1),
    ('Chiapas',1),
    ('Florida',2),
    ('Alaska',2),
    ('Occitania',3);

INSERT INTO `jurassicParkDB`.`city` (`name`,`state_id`)
  VALUES 
    ('Iztapalapa',1),
    ('Benito Juarez',1),
    ('San Cristobal de las Casas',2),
    ('Alachua',3),
    ('Juneau',4),
    ('Albi',5);

INSERT INTO `jurassicParkDB`.`address` (`pc`,`street`,`district`,`city_id`)
  VALUES (930896,'312-3140 Dui Avenue','Neder-Over-Heembeek',4),
  (977925,'P.O. Box 538, 7496 Sed Rd.','Bhavnagar',1),
  (934986,'9425 Ac, St.','Vliermaalroot',3),
  (392624,'754-2962 Facilisis, St.','Sovizzo',6),
  (192142,'Ap #399-1396 Posuere Rd.','Osgoode',4),
  (54101,'9181 In Street','Auburn',5),
  (757263,'P.O. Box 809, 9561 Posuere Avenue','Rugby',2),
  (466756,'441-756 Arcu. Ave','Filignano',6),
  (219246,'3419 Luctus St.','Cabras',2),
  (408949,'Ap #218-1839 Euismod St.','Shediac',6),
  (310432,'Ap #906-6121 Nulla. Street','Pettineo',4),
  (400968,'480-3364 Nulla Rd.','Minna',6),
  (609411,'Ap #359-7481 Integer Road','Cap-Rouge',2),
  (239885,'P.O. Box 399, 5004 Massa Ave','Naperville',2),
  (7069549,'Ap #648-9374 Interdum. Rd.','Pomarico',2),
  (9063897,'P.O. Box 856, 6072 Dolor St.','Raymond',2),
  (658374,'4983 Hendrerit Av.','Vejalpur',6),
  (5741577,'793-6570 Donec Rd.','Rae Bareli',2),
  (191239,'447 Metus Avenue','Hisar',2),
  (5865311,'P.O. Box 600, 8477 Et Rd.','Coevorden',4),
  (3202032,'719-1089 A, Rd.','Udaipur',3),
  (3475258,'Ap #573-8057 Mauris Rd.','Lives-sur-Meuse',3),
  (1331711,'784-2486 Nunc Road','Coinco',2),
  (4900737,'Ap #873-9931 Imperdiet Street','Springfield',1),
  (9070113,'869-3627 Vitae Street','Rouvroy',3),
  (8513164,'Ap #396-660 Et Road','Londrina',5),
  (2103729,'2069 Sed Road','Dilbeek',1),
  (3381529,'P.O. Box 363, 7286 Non St.','Finkenstein am Faaker See',4),
  (5376745,'P.O. Box 869, 5964 Ac St.','Magdeburg',2),
  (5035209,'P.O. Box 612, 1421 Pede. Avenue','Cabras',2),
  (7378657,'433-3063 Convallis, Ave','Habergy',6),
  (7227717,'P.O. Box 438, 9945 Pharetra St.','Buzenol',6),
  (7885627,'P.O. Box 775, 7295 Facilisis Av.','Oxford County',5),
  (6135689,'P.O. Box 135, 3213 A Road','Gibsons',2),
  (9789391,'6209 Auctor Ave','Erquelinnes',5),
  (1542076,'P.O. Box 369, 6944 A Rd.','Williams Lake',5),
  (2763972,'P.O. Box 492, 6706 Vitae Avenue','Chicago',6),
  (8526328,'P.O. Box 281, 5915 Et Ave','Castel Colonna',3),
  (8489757,'Ap #848-3260 Pharetra Rd.','Newport News',1),
  (730442,'1495 Arcu. Rd.','Montes Claros',4),
  (1774096,'P.O. Box 710, 6341 Porta St.','Minneapolis',4),
  (1886405,'2266 At Street','Bissegem',4),
  (4488085,'Ap #532-4542 Mauris St.','Namen',4),
  (6958218,'7411 Tortor. Road','Crotta d\'Adda',5);

INSERT INTO `jurassicParkDB`.`school` (`name`,`code`,`address_id`)
  VALUES 
    ('Meyer, Maxine L.','2DE25B7D-0B7F-84CC-9D91-00B572622A8C',7),
    ('Dillon, Zelenia V.','A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',5),
    ('Hester, Irma T.','8E70C8BE-8947-F7B2-612A-ACD3D1354D59',9),
    ('Mcdonald, Dora L.','655D225F-7236-3A69-46D3-42A731E7731A',11);

INSERT INTO `jurassicParkDB`.`school_email` (`email`,`school_code`,`school_id`) 
  VALUES 
    ('quis@anteipsum.edu','2DE25B7D-0B7F-84CC-9D91-00B572622A8C',1),
    ('purus@enimnec.com','2DE25B7D-0B7F-84CC-9D91-00B572622A8C',1),
    ('metus.facilisis@euismodenimEtiam.co.uk','2DE25B7D-0B7F-84CC-9D91-00B572622A8C',1),
    ('urna.nec@nequetellus.net','A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2),
    ('auctor@id.ca','A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2),
    ('tempor.lorem.eget@duisemper.com','8E70C8BE-8947-F7B2-612A-ACD3D1354D59',3),
    ('Nam@orciluctuset.edu','8E70C8BE-8947-F7B2-612A-ACD3D1354D59',3),
    ('nulla@atliberoMorbi.org','655D225F-7236-3A69-46D3-42A731E7731A',4);
    
INSERT INTO `jurassicParkDB`.`school_telephone` (`telephone`,`school_code`,`school_id`) 
  VALUES 
    ('218-3574','2DE25B7D-0B7F-84CC-9D91-00B572622A8C',1),
    ('1-467-253-0171','2DE25B7D-0B7F-84CC-9D91-00B572622A8C',1),
    ('1-707-894-6120','A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2),
    ('844-7082','A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2),
    ('1-377-283-0255','8E70C8BE-8947-F7B2-612A-ACD3D1354D59',3),
    ('1-502-279-4714','8E70C8BE-8947-F7B2-612A-ACD3D1354D59',3),
    ('1-684-847-6056','655D225F-7236-3A69-46D3-42A731E7731A',4),
    ('1-400-213-4992','655D225F-7236-3A69-46D3-42A731E7731A',4);

INSERT INTO `jurassicParkDB`.`address_school` (`address_id`, `school_id`, `school_code`)
  VALUES
    (1,1,'2DE25B7D-0B7F-84CC-9D91-00B572622A8C'),
    (2,2,'A37E9258-37E3-AAF2-7D65-FB60E1C8F80C'),
    (3,3,'8E70C8BE-8947-F7B2-612A-ACD3D1354D59'),
    (4,3,'655D225F-7236-3A69-46D3-42A731E7731A');

INSERT INTO `jurassicParkDB`.`reservation` (`school_code`,`school_id`,`visit_date`,`visit_hour`,`method`)
  VALUES
    ('A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2,'2021-03-04','03:03:13','email'),
    ('A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2,'2020-06-30','13:06:17','email'),
    ('655D225F-7236-3A69-46D3-42A731E7731A',4,'2019-12-03','01:12:23','telephone'),
    ('A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2,'2020-10-26','15:10:11','telephone'),
    ('A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2,'2020-04-29','00:04:49','email'),
    ('A37E9258-37E3-AAF2-7D65-FB60E1C8F80C',2,'2019-06-06','10:06:08','email'),
    ('2DE25B7D-0B7F-84CC-9D91-00B572622A8C',1,'2020-03-07','06:03:58','telephone'),
    ('8E70C8BE-8947-F7B2-612A-ACD3D1354D59',3,'2016-12-29','08:12:02','telephone');

INSERT INTO `jurassicParkDB`.`visit_type` (`code`,`name`)
  VALUES
    ('98E9D98F-98E8-3738-E79E-5646B0445B95','solo visita'),
    ('202410DD-4F78-E776-D2B4-9341C5FBC6EF','vista con experto propio'),
    ('DCF5F5C3-4EE9-2EA3-135C-0E994BE65873','vista con guía del parque'),
    ('A3177A26-C487-4FF1-809A-1D52650FEDB4','visita con guía computarizado');

INSERT INTO `jurassicParkDB`.`product_visit` (`visit_type_id`,`visit_type_code`,`cost`,`is_active`)
  VALUES
    (1,'98E9D98F-98E8-3738-E79E-5646B0445B95',100.59,0),
    (2,'202410DD-4F78-E776-D2B4-9341C5FBC6EF',149.59,0),
    (3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873',100.59,0),
    (4,'A3177A26-C487-4FF1-809A-1D52650FEDB4',100.59,0),
    (1,'98E9D98F-98E8-3738-E79E-5646B0445B95',200.99,1),
    (2,'202410DD-4F78-E776-D2B4-9341C5FBC6EF',349.99,1),
    (3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873',400.99,1),
    (4,'A3177A26-C487-4FF1-809A-1D52650FEDB4',500.99,1),
    (1,'98E9D98F-98E8-3738-E79E-5646B0445B95',220.99,1),
    (2,'202410DD-4F78-E776-D2B4-9341C5FBC6EF',369.99,1),
    (3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873',420.99,1),
    (4,'A3177A26-C487-4FF1-809A-1D52650FEDB4',520.99,1);


INSERT INTO `jurassicParkDB`.`reserve_zone` (`reservation_id`,`visit_type_id`,`visit_type_code`,`principal_teacher`,`grade`)
  VALUES
    (5,4,'A3177A26-C487-4FF1-809A-1D52650FEDB4','Kadeem G. Hickman','1B'),
    (7,3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873','Ursula A. Blackwell','Cinta Negra'),
    (7,2,'202410DD-4F78-E776-D2B4-9341C5FBC6EF','Rina N. Solis','6'),
    (8,3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873','Lydia N. Rojas','Cinta Verde'),
    (6,3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873','Cassandra Y. Lopez','503'),
    (1,1,'98E9D98F-98E8-3738-E79E-5646B0445B95','Cain Z. Coleman','B15'),
    (6,4,'A3177A26-C487-4FF1-809A-1D52650FEDB4','Rina N. Cochran','2A'),
    (4,1,'98E9D98F-98E8-3738-E79E-5646B0445B95','Hannah S. Blackwell','408'),
    (5,3,'DCF5F5C3-4EE9-2EA3-135C-0E994BE65873','Hedda L. Middleton','A5'),
    (8,2,'202410DD-4F78-E776-D2B4-9341C5FBC6EF','Elliott D. Marks','620');


INSERT INTO `jurassicParkDB`.`reserve_zone_teacher` (`reserve_zone_id`,`name`) 
	VALUES 
		(10,'Berry, Burke Z.'),
        (3,'Sanders, Neville U.'),
        (5,'Juarez, Jena V.'),
        (2,'Bender, Oscar N.'),
        (6,'Clayton, Yoshi B.'),
        (5,'England, Kylynn P.'),
        (2,'Weiss, Simone L.'),
        (1,'Mclaughlin, Germane E.'),
        (8,'Wheeler, Daryl H.'),
        (1,'Nixon, Cain F.'),
        (2,'Farley, Randall W.'),
        (1,'Moss, Bradley R.'),
        (3,'Huff, Gwendolyn P.'),
        (5,'Chapman, Wyatt I.'),
        (4,'Webb, Lacota W.'),
        (5,'Burch, Basil K.'),
        (6,'Hinton, Barclay X.'),
        (8,'Mccullough, Chester E.'),
        (6,'Whitney, Madeline E.'),
        (8,'Dunn, Sawyer H.'),
        (1,'Knight, Abbot B.'),
        (3,'Barlow, Elvis U.'),
        (2,'Burnett, Illiana U.'),
        (5,'Obrien, Illana Y.'),
        (1,'Best, Natalie R.'),
        (2,'Burris, Courtney Z.'),
        (1,'Grimes, Fleur K.'),
        (8,'Hooper, Reuben L.'),
        (7,'Cardenas, Amethyst F.'),
        (6,'Moody, Amber G.');

INSERT INTO `jurassicParkDB`.`student` (`reserve_zone_id`,`name`) 
	VALUES
		(4,'Reese, Joseph I.'),
        (5,'Peterson, Farrah D.'),
        (7,'Chen, Evan J.'),
        (2,'Shelton, Dorian D.'),
        (8,'Price, Jeremy P.'),
        (7,'Williams, Levi T.'),
        (7,'Melendez, Deborah M.'),
        (2,'Salas, Wilma Z.'),
        (7,'Mendez, Maite K.'),
        (2,'Kramer, Fletcher Y.'),
        (8,'Wall, Ocean O.'),
        (4,'Hull, Galena Z.'),
        (8,'Santos, Teegan H.'),
        (3,'Edwards, Miranda K.'),
        (3,'Robbins, Ezra K.'),
        (8,'Golden, Aiko Q.'),
        (1,'Cabrera, Kareem T.'),
        (3,'Holden, Mark J.'),
        (5,'Castaneda, Shellie K.'),
        (8,'Roy, Shaine H.'),
        (1,'Griffith, Orli X.'),
        (2,'Conner, Nash U.'),
        (9,'Dale, Holmes Q.'),
        (8,'Doyle, Tyler O.'),
        (9,'Pennington, Oprah J.'),
        (1,'Tran, Hedley K.'),
        (4,'Landry, Connor Y.'),
        (3,'Cleveland, TaShya I.'),
        (10,'Joyce, Vincent O.'),
        (9,'Mckee, Naomi M.');
        
INSERT INTO `jurassicParkDB`.`employee` (`rfc`,`names`,`father_last_name`,`mother_last_name`,`email`,`telephone`,`day_off`,`address_id`) 
	VALUES
		('FAFE630306MJ3','Dara','Hunt','Conrad','enim.sit@quisdiamPellentesque.net','746-0490','Lunes', 44),
        ('GAMF720810GM2','Omar','Tate','Chapman','ut.quam@Aliquamfringilla.ca','1-908-412-1701','Martes',43),
        ('KAGE8510097X6','Kareem','Becker','Medina','mauris@porttitorvulputateposuere.org','1-849-447-3575','Miercoles',41),
        ('RDA1210113Q2','Ann','Peterson','Chan','nisi@Duisrisusodio.co.uk','394-8415','Jueves',40),
        ('CSQ780524D56','Judah','Christian','Neal','Curabitur@malesuadaInteger.co.uk','1-911-936-2526','Viernes',39),
        ('VAMM700702DD1','Martena','Cole','Frazier','in.consequat.enim@ut.co.uk','1-611-252-1831','Sabado',38),
        ('NIRC590925R20','Lenore','Lucas','Wooten','pede.Cum.sociis@Nunc.net','856-4242','Domingo',37),
        ('MOCE881119LV2','Kirestin','Randolph','Watts','ridiculus.mus@miloremvehicula.org','1-330-160-2859','Lunes',36),
        ('RCO060224JI8','Kasper','Higgins','Woods','quis@nullaDonecnon.edu','1-890-834-2208','Martes',35),
        ('MAPJ620315NDA','Cullen','Irwin','Thompson','sit@odiosagittissemper.net','918-6598','Miercoles',34),
        ('FTM981104540','Hayfa','Odonnell','Greene','eleifend.non@orcilacusvestibulum.org','926-6330','Jueves',33),
        ('ROSA661021P62','Lamar','Mendoza','Hendrix','luctus@sagittisplaceratCras.org','747-7511','Viernes',32),
        ('APS110125924','Jasper','Cobb','Gay','tempor.augue.ac@molestiepharetra.ca','143-1429','Sabado',31),
        ('AUAC8407293U6','Victoria','Phelps','Waters','non.vestibulum.nec@Aliquamornarelibero.ca','1-254-249-9971','Domingo',30),
        ('RORV791020JC4','Inga','Gallegos','Strickland','Mauris@massaVestibulumaccumsan.co.uk','1-426-595-9570','Lunes',29),
        ('AEC810901298','Kylee','Wiley','Huber','sem.ut.cursus@auctornonfeugiat.org','1-783-311-9523','Martes',28),
        ('OABJ721225821','Ryder','Mejia','Cabrera','non.lobortis@justonec.ca','1-410-570-0091','Miercoles',27),
        ('AAD1012087SA','Whitney','Finch','Bradshaw','enim.Sed@nullavulputatedui.edu','1-938-212-0658','Jueves',26),
        ('ERM140613MR4','Beatrice','Moreno','Sharp','tempus.non@senectus.org','1-865-770-8023','Viernes',25),
        ('CASC730317U43','Upton','Gonzalez','Acevedo','velit@Praesentluctus.co.uk','1-243-167-6824','Sabado',24),
        ('OFC1207307K1','Branden','Mclean','Montgomery','dolor.Quisque@eget.com','1-309-708-8616','Domingo',23),
        ('GCO130715PWA','Deacon','Andrews','Tyler','Sed.nec@tinciduntaliquamarcu.ca','1-236-902-5402','Lunes',22),
        ('FIMA681230JN4','Kyra','Hanson','Puckett','Sed.auctor@dapibusidblandit.ca','365-9371','Martes',21),
        ('PESA750228IN6','Kermit','Bauer','Charles','cubilia@tincidunt.edu','1-762-117-4957','Miercoles',20),
        ('CUPX821127BG6','Iris','Thompson','Branch','massa.rutrum@quis.com','1-942-616-8986','Jueves',19),
        ('IAC091127D43','Jillian','Rosario','Mueller','ligula@velmaurisInteger.org','850-5718','Viernes',18),
        ('GGA750224K13','Nissim','Puckett','Finley','sit@duiFuscealiquam.org','554-1204','Sabado',17),
        ('GATL740803MQ1','Brian','Kim','Moody','felis@malesuadamalesuadaInteger.ca','1-219-111-8201','Domingo',16),
        ('EVI060613AE2','Riley','Bird','Chandler','Vivamus.nisi.Mauris@Quisque.org','1-180-571-2190','Lunes',15),
        ('ECA930216597','Noelani','Sosa','Ramirez','sit@Aliquamfringillacursus.edu','1-998-712-5473','Martes',14),
		('RSI051223EIA','Meghan','Santiago','Cardenas','in@necanteblandit.edu','1-375-835-2932','Lunes',13),
        ('ASE1101319U8','Alvin','Parker','Mack','quam.a@sedconsequatauctor.com','1-223-728-5625','Martes',12),
        ('FIMA810616UJ6','Haley','Harrington','Robbins','dui.augue.eu@NullafacilisisSuspendisse.edu','1-442-447-3638','Miercoles',11),
        ('XES091026UH0','Jordan','Duran','Cross','nulla.Cras.eu@eu.org','865-2121','Jueves',10),
        ('DME0205279YA','Illiana','Sloan','Terry','interdum.Nunc@Cum.co.uk','1-508-435-2387','Viernes',9),
        ('FME7609068N7','Ramona','Ochoa','Dudley','Fusce@anuncIn.org','367-0764','Sabado',8),
        ('GCA080118QX5','Veronica','Kidd','Strong','Suspendisse.non.leo@Phasellus.co.uk','1-569-398-4067','Domingo',7),
        ('HEAF640219J10','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Lunes',6),
        ('VIS091119IK0','Miriam','Blevins','Santiago','blandit.enim@hendreritid.com','867-1362','Martes',5),
        ('VWA061012KL9','Seth','Villarreal','Meyers','ac@vulputate.com','1-995-282-1086','Miercoles',40),
        ('CCO140114EB5','Miriam','Trujillo','Hendrix','lectus.quis.massa@egestasblandit.edu','1-701-830-3696','Jueves',4),
        ('HSP0309255Q6','Signe','Burns','Marquez','sit.amet.ornare@arcuvel.org','983-2031','Viernes',3),
        ('EEU930201289','Solomon','Mcfarland','Hampton','sit.amet@venenatis.co.uk','295-7618','Sabado',2),
        ('GCE140116L3A','Boris','Cantrell','Stout','enim.gravida@ornare.co.uk','1-599-520-3682','Domingo',1),
        ('AUPM820917LN6','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Lunes',2),
        ('TEX0507151K4','Ocean','Butler','Hoover','lorem2@dictumcursusNunc.co.uk','1-511-996-3071','Martes',3),
        ('MPG941109JTA','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Miercoles',4),
        ('GME920101B39','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Jueves',5),
        ('VARJ791105KI0','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Viernes',6),
        ('RSB820604JD5','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Sabado',7),
        ('INM0805298K1','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Domingo',8),
        ('MUN141126IF8','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Lunes',9),
        ('GJA900820PC9','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Martes',10),
        ('SME081013379','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Miercoles',11),
        ('VCO080307GZ8','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Jueves',12),
        ('GOPJ7104289U0','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Viernes',13),
        ('ERE120329EG5','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Sabado',14),
        ('MAGL710830T23','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Domingo',15),
        ('GQU821028223','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Lunes',16),
        ('SNC060407LD6','Porter','Donaldson','Duran','tristique@nonmagnaNam.net','998-5185','Martes',17),
        ('MOEJ900409694','Ocean','Butler','Hoover','lorem@dictumcursusNunc.co.uk','1-511-996-3071','Lunes',18);

INSERT INTO `jurassicParkDB`.`scientist` (`rfc`,`license`)
	VALUES
		('RDA1210113Q2','23372978'),
        ('MOCE881119LV2','22476453'),
        ('ROSA661021P62','6328827'),
        ('AEC810901298','37341589'),
        ('CASC730317U43','17936580'),
        ('PESA750228IN6','29117086'),
        ('GATL740803MQ1','23179741'),
        ('ASE1101319U8','9777148'),
        ('FME7609068N7','48635137'),
        ('VWA061012KL9','35971265'),
        ('GCE140116L3A','21186630'),      
        ('GME920101B39','5966668'),
        ('MOEJ900409694','6565316'),
        ('VCO080307GZ8','566649'),
        ('GQU821028223','55989699');

INSERT INTO `jurassicParkDB`.`police` (`rfc`,`radio_code`,`is_armed`) 
	VALUES
		('FAFE630306MJ3',3192,0),
        ('CSQ780524D56',5658,0),
        ('RCO060224JI8',5359,0),
        ('APS110125924',6526,0),
        ('OABJ721225821',7408,1),
        ('OFC1207307K1',4950,0),
        ('CUPX821127BG6',7430,1),
        ('EVI060613AE2',8290,1),
        ('FIMA810616UJ6',9481,1),
        ('GCA080118QX5',9820,0),
        ('CCO140114EB5',5876,0),
        ('AUPM820917LN6',7897,1),
        ('VARJ791105KI0',5860,0),
        ('MUN141126IF8',8374,1),
        ('GOPJ7104289U0',2626,0);
        
INSERT INTO `jurassicParkDB`.`quatermaster` (`rfc`, `speciality`)
	VALUES
		('GAMF720810GM2','jefe de limpieza'),
        ('VAMM700702DD1','jefe de limpieza'),
        ('MAPJ620315NDA','jefe de limpieza'),
        ('AUAC8407293U6','jefe de limpieza'),
        ('AAD1012087SA','jefe de limpieza'),
        ('GCO130715PWA','jefe de limpieza'),
        ('IAC091127D43','jefe de limpieza'),
        ('ECA930216597','jefe de limpieza'),
        ('XES091026UH0','jefe de limpieza'),
        ('HEAF640219J10','jefe de limpieza'),
        ('HSP0309255Q6','jefe de limpieza'),
        ('TEX0507151K4','jefe de limpieza'),
        ('RSB820604JD5','jefe de limpieza'),
        ('GJA900820PC9','jefe de limpieza'),
        ('ERE120329EG5','jefe de limpieza');
        
INSERT INTO `jurassicParkDB`.`veterinary` (`rfc`,`speciality`)
	VALUES
		('KAGE8510097X6','nutrición'),
        ('NIRC590925R20','nutrición'),
        ('FTM981104540','nutrición'),
        ('RORV791020JC4','nutrición'),
        ('ERM140613MR4','nutrición'),
        ('FIMA681230JN4','nutrición'),
        ('GGA750224K13','nutrición'),
        ('RSI051223EIA','nutrición'),
        ('DME0205279YA','nutrición'),
        ('VIS091119IK0','nutrición'),
        ('EEU930201289','nutrición'),
        ('MPG941109JTA','nutrición'),
        ('INM0805298K1','nutrición'),
        ('SME081013379','nutrición'),
        ('MAGL710830T23','nutrición');

INSERT INTO `jurassicParkDB`.`vehicle_model` (`manufacturer`,`model`,`type`,`fuel_type`,`capacity`,`is_autonomus`) 
	VALUES 
		('Aptent Taciti Inc.','Bethany','maritimo','electrico',40,1),
        ('Pede Malesuada PC','Janna','maritimo','electrico',38,0),
        ('Fringilla Ornare Consulting','Raven','maritimo','electrico',11,1),
        ('Ut Tincidunt Company','Hillary','maritimo','electrico',39,0),
        ('Consectetuer LLP','Jasmine','maritimo','electrico',28,0),
        ('Lacinia Mattis LLC','Willa','maritimo','electrico',18,1),
        ('Ipsum Foundation','Willa','maritimo','electrico',14,1),
        ('Dictum Eu Eleifend Limited','Roary','maritimo','electrico',41,0),
        ('Nulla Donec Non Foundation','Joy','maritimo','electrico',8,0),
        ('Donec Company','Brynne','maritimo','electrico',33,0),
        ('Hendrerit Id Ante Industries','Cassady','aereo','gasolina',15,0),
        ('Nunc Sit Company','Abigail','aereo','gasolina',24,1),
        ('In Nec Orci LLC','Tatiana','aereo','gasolina',39,1),
        ('Nisi Dictum Augue Consulting','Charlotte','aereo','gasolina',11,0),
        ('Ut PC','Quinn','aereo','gasolina',27,0);

INSERT INTO `jurassicParkDB`.`vehicle` (`vehicle_model_id`,`details`,`is_pc_interactive`) 
	VALUES 
		(8,'amet massa. Quisque porttitor eros nec tellus. Nunc lectus pede,',1),
        (14,'mi fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet,',1),
        (11,'egestas a, dui. Cras pellentesque. Sed dictum. Proin eget odio.',1),
        (15,'bibendum fermentum metus. Aenean sed pede nec ante blandit viverra.',0),
        (8,'aliquam, enim nec tempus scelerisque, lorem ipsum sodales purus, in',0),
        (10,'augue, eu tempor erat neque non quam. Pellentesque habitant morbi',0),
        (4,'Mauris blandit enim consequat purus. Maecenas libero est, congue a,',0),
        (7,'ornare, elit elit fermentum risus, at fringilla purus mauris a',1),
        (7,'vitae diam. Proin dolor. Nulla semper tellus id nunc interdum',0),
        (7,'amet nulla. Donec non justo. Proin non massa non ante',1),
        (7,'ac mi eleifend egestas. Sed pharetra, felis eget varius ultrices,',1),
        (15,'aliquam adipiscing lacus. Ut nec urna et arcu imperdiet ullamcorper.',0),
        (3,'Etiam gravida molestie arcu. Sed eu nibh vulputate mauris sagittis',0),
        (7,'eget ipsum. Suspendisse sagittis. Nullam vitae diam. Proin dolor. Nulla',0),
        (5,'lectus ante dictum mi, ac mattis velit justo nec ante.',1),
        (1,'hendrerit a, arcu. Sed et libero. Proin mi. Aliquam gravida',0),
        (2,'condimentum. Donec at arcu. Vestibulum ante ipsum primis in faucibus',0),
        (5,'lectus pede et risus. Quisque libero lacus, varius et, euismod',0),
        (7,'interdum ligula eu enim. Etiam imperdiet dictum magna. Ut tincidunt',0),
        (5,'elementum sem, vitae aliquam eros turpis non enim. Mauris quis',0),
        (10,'ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam auctor, velit',1),
        (14,'et ipsum cursus vestibulum. Mauris magna. Duis dignissim tempor arcu.',1),
        (13,'egestas, urna justo faucibus lectus, a sollicitudin orci sem eget',0),
        (7,'Aliquam erat volutpat. Nulla facilisis. Suspendisse commodo tincidunt nibh. Phasellus',0),
        (10,'id, ante. Nunc mauris sapien, cursus in, hendrerit consectetuer, cursus',1),
        (10,'In faucibus. Morbi vehicula. Pellentesque tincidunt tempus risus. Donec egestas.',1),
        (11,'mi lorem, vehicula et, rutrum eu, ultrices sit amet, risus.',0),
        (4,'luctus et ultrices posuere cubilia Curae; Phasellus ornare. Fusce mollis.',0),
        (10,'Aenean sed pede nec ante blandit viverra. Donec tempus, lorem',1),
        (9,'a neque. Nullam ut nisi a odio semper cursus. Integer',0);

INSERT INTO `jurassicParkDB`.`driver` (`rfc`,`license_number`,`license_expires_at`,`vehicle_id`) 
	VALUES 
		('KAGE8510097X6','998478721-00009','2017-02-13 10:17:08',1),
        ('VAMM700702DD1','203312228-00000','2019-04-09 16:22:55',2),
        ('RCO060224JI8','671898286-00008','2022-05-22 06:55:07',3),
        ('ROSA661021P62','581010626-00009','2018-05-25 12:08:09',4),
        ('RORV791020JC4','001887637-00005','2016-07-23 06:01:09',5),
        ('AAD1012087SA','177187747-00007','2018-09-27 03:42:11',6),
        ('OFC1207307K1','849199351-00008','2018-11-26 03:16:12',7),
        ('GCO130715PWA','093534923-00003','2021-08-24 02:11:07',8),
        ('CUPX821127BG6','438027138-00009','2018-04-12 00:50:43',9),
        ('IAC091127D43','182383802-00002','2018-05-10 07:49:28',10),
        ('GGA750224K13','856841663-00003','2017-07-24 08:50:34',11);

INSERT INTO `jurassicParkDB`.`zone`  (`code`,`type`,`police_rfc`,`quatermaster_rfc`,`veterinary_rfc`,`scientist_rfc`)
	VALUES
		('4F55983A-A2D2-954E-1561-E96BBF97FA31','dinosaurio','FAFE630306MJ3','GAMF720810GM2','KAGE8510097X6','RDA1210113Q2'),
        ('B8D51212-67D8-F427-E135-27998E1FAA63','dinosaurio','CSQ780524D56','VAMM700702DD1','NIRC590925R20','MOCE881119LV2'),
        ('896F11CF-49C1-07F9-4105-C0DF60BEC1E1','dinosaurio','RCO060224JI8','MAPJ620315NDA','FTM981104540','ROSA661021P62'),
        ('E3886627-FC23-84DD-4D21-7A2B84FC5D3D','dinosaurio','APS110125924','AUAC8407293U6','RORV791020JC4','AEC810901298'),
        ('74203EDC-586A-ABD5-4043-70F3723372CC','dinosaurio','OABJ721225821','AAD1012087SA','ERM140613MR4','CASC730317U43'),
        ('BA5AEB5F-7A7C-BBA3-04C6-03775C16C58A','dinosaurio','OFC1207307K1','GCO130715PWA','FIMA681230JN4','PESA750228IN6'),
        ('7D53F717-331D-CF86-1272-2644F778A92E','dinosaurio','CUPX821127BG6','IAC091127D43','GGA750224K13','GATL740803MQ1'),
        ('B57363D3-3504-686D-3973-BE9CDCEEE8F4','dinosaurio','EVI060613AE2','ECA930216597','RSI051223EIA','ASE1101319U8'),
        ('647C8EFC-0B82-F9D4-4F1B-D7B8AE80E80F','dinosaurio','FIMA810616UJ6','XES091026UH0','DME0205279YA','FME7609068N7'),
        ('AB1D4658-092E-6A0D-13C8-09692BF00ED0','dinosaurio','GCA080118QX5','HEAF640219J10','VIS091119IK0','VWA061012KL9'),
        ('A5B68985-5108-AEBA-8F45-2EB5B0037B50','dinosaurio','CCO140114EB5','HSP0309255Q6','EEU930201289','GCE140116L3A'),
        ('DC6CB5CD-9C42-9610-06E2-5353514D313D','dinosaurio','AUPM820917LN6','TEX0507151K4','MPG941109JTA','GME920101B39'),
        ('037EC681-B483-E75F-A39E-01990FAF72C0','transporte','VARJ791105KI0','RSB820604JD5','INM0805298K1','MOEJ900409694'),
        ('296A1244-85E9-4CCB-C040-E15031556B7B','transporte','MUN141126IF8','GJA900820PC9','SME081013379','VCO080307GZ8'),
        ('BC822346-5714-0C7A-A290-C8124E1B7383','transporte','GOPJ7104289U0','ERE120329EG5','MAGL710830T23','GQU821028223');

INSERT INTO `jurassicParkDB`.`visit` (`reserve_zone_id`,`zone_code`) 
	VALUES 
		(2,'4F55983A-A2D2-954E-1561-E96BBF97FA31'),
        (7,'4F55983A-A2D2-954E-1561-E96BBF97FA31'),
        (9,'4F55983A-A2D2-954E-1561-E96BBF97FA31'),
        (1,'4F55983A-A2D2-954E-1561-E96BBF97FA31'),
        (1,'B8D51212-67D8-F427-E135-27998E1FAA63'),
        (2,'B8D51212-67D8-F427-E135-27998E1FAA63'),
        (5,'B8D51212-67D8-F427-E135-27998E1FAA63'),
        (4,'B8D51212-67D8-F427-E135-27998E1FAA63'),
        (7,'B8D51212-67D8-F427-E135-27998E1FAA63'),
        (10,'B8D51212-67D8-F427-E135-27998E1FAA63'),
        (5,'896F11CF-49C1-07F9-4105-C0DF60BEC1E1'),
        (3,'896F11CF-49C1-07F9-4105-C0DF60BEC1E1'),
        (10,'896F11CF-49C1-07F9-4105-C0DF60BEC1E1'),
        (3,'E3886627-FC23-84DD-4D21-7A2B84FC5D3D'),
        (1,'E3886627-FC23-84DD-4D21-7A2B84FC5D3D'),
		(8,'74203EDC-586A-ABD5-4043-70F3723372CC'),
        (7,'74203EDC-586A-ABD5-4043-70F3723372CC'),
        (3,'74203EDC-586A-ABD5-4043-70F3723372CC'),
        (1,'BA5AEB5F-7A7C-BBA3-04C6-03775C16C58A'),
        (10,'BA5AEB5F-7A7C-BBA3-04C6-03775C16C58A'),
        (3,'BA5AEB5F-7A7C-BBA3-04C6-03775C16C58A'),
        (2,'7D53F717-331D-CF86-1272-2644F778A92E'),
        (1,'7D53F717-331D-CF86-1272-2644F778A92E'),
        (7,'7D53F717-331D-CF86-1272-2644F778A92E'),
        (10,'7D53F717-331D-CF86-1272-2644F778A92E'),
        (3,'B57363D3-3504-686D-3973-BE9CDCEEE8F4'),
        (4,'B57363D3-3504-686D-3973-BE9CDCEEE8F4'),
        (4,'B57363D3-3504-686D-3973-BE9CDCEEE8F4'),
        (8,'B57363D3-3504-686D-3973-BE9CDCEEE8F4'),
        (4,'647C8EFC-0B82-F9D4-4F1B-D7B8AE80E80F'),
		(9,'647C8EFC-0B82-F9D4-4F1B-D7B8AE80E80F'),
        (3,'647C8EFC-0B82-F9D4-4F1B-D7B8AE80E80F'),
        (5,'647C8EFC-0B82-F9D4-4F1B-D7B8AE80E80F'),
        (2,'AB1D4658-092E-6A0D-13C8-09692BF00ED0'),
        (9,'AB1D4658-092E-6A0D-13C8-09692BF00ED0'),
        (1,'AB1D4658-092E-6A0D-13C8-09692BF00ED0'),
        (1,'A5B68985-5108-AEBA-8F45-2EB5B0037B50'),
        (2,'A5B68985-5108-AEBA-8F45-2EB5B0037B50'),
        (9,'DC6CB5CD-9C42-9610-06E2-5353514D313D'),
        (3,'DC6CB5CD-9C42-9610-06E2-5353514D313D'),
        (6,'DC6CB5CD-9C42-9610-06E2-5353514D313D');
        
INSERT INTO `jurassicParkDB`.`tax_kingdom`
(`name`)
	VALUES
		('Animalia');
        
INSERT INTO `jurassicParkDB`.`tax_phylum`
(`name`,`tax_kingdom_id`)
	VALUES
		('Chordata',1);
        
INSERT INTO `jurassicParkDB`.`tax_class`
(`name`,`tax_phylum_id`)
	VALUES
		('Sauropsida',1),
        ('Archosauria',1);
        
INSERT INTO `jurassicParkDB`.`distribution` (`name`)
	VALUES
		('Jurasico'),
        ('Cretácico'),
        ('Triásico');

INSERT INTO `jurassicParkDB`.`dinosaur` (`zone_code`,`tax_class_id`,`name`,`distribution_id`,`surface`,`feed_type`,`weight`,`height`)
	VALUES
		('DC6CB5CD-9C42-9610-06E2-5353514D313D',2,'Baryonyx',2,158000,'carnivoro','1.7 tons','2.75 m'),
        ('A5B68985-5108-AEBA-8F45-2EB5B0037B50',1,'Herrerasaurus',3,8625800,'carnivoro','210 kg','50 cm'),
        ('AB1D4658-092E-6A0D-13C8-09692BF00ED0',1,'Dilophosaurus',1,186800,'carnivoro','350 kg','160 cm'),
        ('647C8EFC-0B82-F9D4-4F1B-D7B8AE80E80F',1,'Velociraptor',2,183500,'carnivoro','15 kg','50 cm'),
        ('B57363D3-3504-686D-3973-BE9CDCEEE8F4',1,'Tyrannosaurus rex',2,17862000,'carnivoro','5.6 tons','11 m'),
        ('7D53F717-331D-CF86-1272-2644F778A92E',1,'Segisaurus',1,7895800,'carnivoro','5 kg','30 cm'),
        ('BA5AEB5F-7A7C-BBA3-04C6-03775C16C58A',1,'Metriacanthosaurus',1,72600,'carnivoro','1 tons','2.3 m'),
        ('74203EDC-586A-ABD5-4043-70F3723372CC',1,'Proceratosaurus',1,183200,'carnivoro','40 cm','8 ft'),
        ('E3886627-FC23-84DD-4D21-7A2B84FC5D3D',1,'Parasaurolophus',2,1869000,'herbívoro','2.5 tons','8 m'),
        ('896F11CF-49C1-07F9-4105-C0DF60BEC1E1',1,'Triceratops',2,86100,'herbívoro','8 tons','4 m'),
        ('B8D51212-67D8-F427-E135-27998E1FAA63',1,'Gallimimus',2,769000,'herbívoro','440 kg','3 m'),
        ('4F55983A-A2D2-954E-1561-E96BBF97FA31',1,'Brachiosaurus',1,254000,'herbívoro','28.7 metric tons','26 m');

