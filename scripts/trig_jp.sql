  
DELIMITER $$
CREATE TRIGGER trig_rfc_check BEFORE INSERT ON employee
FOR EACH ROW 
BEGIN 
IF (NEW.rfc REGEXP '^[A-Z&]{3,4}[0-9]{6}([A-Z&]{2}|[0-9]{2}|[A-Z&][0-9]|[0-9][A-Z&])([A]|[0-9])' ) = 0 THEN 
  SIGNAL SQLSTATE '12345'
     SET MESSAGE_TEXT = 'Wroooong rfc!!!';
END IF; 
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trig_zone_type_check BEFORE INSERT ON zone
FOR EACH ROW 
BEGIN 
IF NEW.type = 'dinosaur' THEN 
	IF NEW.police_rfc = null OR NEW.quatermaster_rfc = null OR NEW.scientist_rfc = null OR NEW.veterinary_rfc = null THEN
		SIGNAL SQLSTATE '12346'
			SET MESSAGE_TEXT = 'Wroooong zone!!!';
	END IF;
END IF; 
END$$
DELIMITER ;
