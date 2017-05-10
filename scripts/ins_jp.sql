#
# Creación
#

INSERT INTO `jurassicParkDB`.`country` (`name`)
	VALUES ('México')
	on duplicate key update updated_at=now();


INSERT INTO `jurassicParkDB`.`state` (`name`,`country_id`)
	VALUES ('California',(select id from `jurassicParkDB`.`country` where name='México'))
	on duplicate key update updated_at=now();


INSERT INTO `jurassicParkDB`.`city` (`name`,`state_id`)
	VALUES ('Los Angeles',(select St.id from `jurassicParkDB`.`state` as St inner join `jurassicParkDB`.`country` as Ct on Ct.id=St.country_id where St.name='California' and Ct.name='México'))
	on duplicate key update updated_at=now();


INSERT INTO `jurassicParkDB`.`address` (`pc`,`street`,`district`,`city_id`)
	VALUES (0,'','',(select St.id from `jurassicParkDB`.`state` as St inner join `jurassicParkDB`.`country` as Ct on Ct.id=St.country_id inner join `jurassicParkDB`.`city` as Cy on Cy.state_id=St.id where St.name='California' and Ct.name='México' and Cy.name='Los Angeles'))
	on duplicate key update updated_at=now();


INSERT INTO `jurassicParkDB`.`school` (`code`,`name`,`address_id`)
	VALUES (upper(uuid()),'Ernesto Garcia Cabral')
    on duplicate key update updated_at=now();

	