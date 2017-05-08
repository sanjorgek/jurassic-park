select SD.id as 'school_id', SD.code as 'school_code', SD.name as 'school_name', SD.telephones, SD.emails,  ACSC.number, ACSC.street, ACSC.district, ACSC.city, ACSC.state, ACSC.country, SD.created_at, SD.updated_at from (select A.id, number, pc, street, district, city, state, country from `jurassicParkDB`.`address` as A
		join (select Ct.id, Ct.name as 'city', state, country  from `jurassicParkDB`.`city` as Ct
			join (select St.id, St.name as 'state', Cr.name as 'country' from `jurassicParkDB`.`state` as St
				join `jurassicParkDB`.`country` as Cr
				on Cr.id=St.country_id) as SC
			on SC.id=Ct.state_id) as CSC
		on CSC.id=A.city_id) as ACSC
	join (select * from `jurassicParkDB`.`school` as S
		join (select ST.school_id, SE.school_code, telephones, emails from (select school_id, school_code, group_concat(telephone) as 'telephones' 
				from `jurassicParkDB`.`school_telephone` 
				group by school_id, school_code) as ST
			join (select school_id, school_code, group_concat(email) as 'emails' 
				from `jurassicParkDB`.`school_email`
				group by school_id, school_code) as SE
			on SE.school_id=ST.school_id and SE.school_code=ST.school_code) as STE
		on S.code=STE.school_code and S.id=STE.school_id) SD
    on SD.address_id = ACSC.id;
