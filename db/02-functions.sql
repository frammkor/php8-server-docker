DELIMITER $$
CREATE DEFINER=`dbo428100562`@`localhost` FUNCTION `beginOfDay`(timezoneID_param varchar(50)) RETURNS date
BEGIN  
     DECLARE BofD date;
     IF timezoneID_param = '' 
     	THEN SET BofD = Date('0000-00-00');
     	ELSE SET BofD = date(convert_tz(utc_timestamp(),'UTC',timezoneID_param));
    END IF;
      RETURN BofD;
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`dbo428100562`@`localhost` FUNCTION `nextval`(seq_name_param varchar(50)) RETURNS int(10)
    READS SQL DATA
BEGIN  
     DECLARE workval INT(10);
     DECLARE seq_name varchar(50);
     IF seq_name_param = 'MILONGA_EVENT' THEN SET seq_name = 'EVENT';
         ELSEIF seq_name_param = 'EVENT_THREAD' THEN SET seq_name = 'EVENT';
         ELSEIF seq_name_param = 'EVENT_OCCURRENCE' THEN SET seq_name = 'EVENT';
         ELSE SET seq_name = seq_name_param;
     END IF;
     SELECT count(1) into workval  
        FROM TIP_SEQUENCE  
        WHERE sequencename = seq_name;  
     IF workval <> 1 THEN  
        DELETE  
            FROM TIP_SEQUENCE  
            WHERE sequencename = seq_name;  
        INSERT  
            INTO TIP_SEQUENCE (sequencename, sequenceval, sequencestep)  
            VALUES (seq_name, 1, 1);  
     END IF;

     SELECT sequenceval into workval  
        FROM TIP_SEQUENCE
        WHERE sequencename = seq_name FOR UPDATE;
     UPDATE TIP_SEQUENCE  
        SET sequenceval = sequenceval + sequencestep  
        WHERE sequencename = seq_name;  

     RETURN workval;
    END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`dbo428100562`@`localhost` FUNCTION `strip_tags`($str text) RETURNS text CHARSET utf8
BEGIN
    DECLARE $start, $end INT DEFAULT 1;
LOOP
    SET $start = LOCATE("<", $str, $start);
    IF (!$start) THEN RETURN $str; END IF;
    SET $end = LOCATE(">", $str, $start);
    IF (!$end) THEN SET $end = $start; END IF;
    SET $str = INSERT($str, $start, $end - $start + 1, "");
END LOOP;
END$$
DELIMITER ;