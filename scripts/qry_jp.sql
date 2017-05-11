#
# Busquedas
#

# Reservaciones e info de la escuela
select R.id as 'reservation_id', R.visit_date, R.visit_hour, Sc.code as 'school_code', Sc.name as 'school_name', group_concat(RZ.id), group_concat(RZ.grade), R.created_at, R.updated_at
	from `jurassicParkDB`.`reservation` as R
	inner join `jurassicParkDB`.`school` as Sc on Sc.id=R.school_id and Sc.code=R.school_code
    left join `jurassicParkDB`.`reserve_zone` as RZ on RZ.reservation_id=R.id
    group by R.id
    order by R.visit_date;
    
select R.id as 'reservation_id', R.visit_date, R.visit_hour, Sc.code as 'school_code', Sc.name as 'school_name', group_concat(RZ.id), group_concat(RZ.grade), R.created_at, R.updated_at
  from `jurassicParkDB`.`reservation` as R
  inner join `jurassicParkDB`.`school` as Sc on Sc.id=R.school_id and Sc.code=R.school_code
  left join `jurassicParkDB`.`reserve_zone` as RZ on RZ.reservation_id=R.id
  where R.visit_date>='2017-05-10'
  group by R.id
  order by R.visit_date;

# Lista de alumnos con costo de boleto y las zonas a las que tienen acceso
# ordenas por tipo de visita
select VT.name as 'visit_name', RZ.id as 'reservation_zone_id', group_concat(D.name) as 'dino_zones', RZ.principal_teacher, VT.code as 'visit_code', VT.id as 'visit_id', St.id as 'student_id', St.name as 'student_name', PV.cost as 'ticket_cost'
	from `jurassicParkDB`.`reserve_zone` as RZ 
	inner join `jurassicParkDB`.`visit` as Vi on RZ.id=Vi.reserve_zone_id
	inner join `jurassicParkDB`.`zone` as Z on Vi.zone_code=Z.code
	inner join `jurassicParkDB`.`dinosaur` as D on D.zone_code=Z.code
	inner join `jurassicParkDB`.`visit_type` as VT on VT.code=RZ.visit_type_code and VT.id=RZ.visit_type_id
    inner join `jurassicParkDB`.`student` as St on St.reserve_zone_id=RZ.id
	inner join `jurassicParkDB`.`product_visit` as PV on PV.visit_type_code=VT.code and PV.visit_type_id=VT.id
	group by St.id, PV.cost
	order by VT.id;
  
# Informacion de la escuela
select Sc.id as 'school_id', Sc.code as 'school_code', Sc.name as 'school_name', Ad.pc, Ad.street, Ct.name as 'city_name', St.name as 'state_name', Co.name as 'country_name', group_concat(ScT.telephone) as 'telephones', group_concat(ScE.email) as 'emails', Sc.created_at, Sc.updated_at
	from `jurassicParkDB`.`school` as Sc
    inner join `jurassicParkDB`.`school_telephone` as ScT on Sc.id=ScT.school_id and Sc.code=ScT.school_code
    inner join `jurassicParkDB`.`school_email` as ScE on Sc.id=ScE.school_id and Sc.code=ScE.school_code
    inner join `jurassicParkDB`.`address` as Ad on Sc.address_id=Ad.id
    inner join `jurassicParkDB`.`city` as Ct on Ad.city_id=Ct.id
    inner join `jurassicParkDB`.`state` as St on Ct.state_id=St.id
    inner join `jurassicParkDB`.`country` as Co on Co.id=St.country_id
    where Sc.code='A37E9258-37E3-AAF2-7D65-FB60E1C8F80C'
    group by Sc.id, Sc.code
    order by Sc.id;
    
# direcciones
select Ad.id, Ad.pc, Ad.street, Ad.district, Ct.name as 'city_name', St.name as 'state_name', Co.name as 'country_name', Ad.created_at, Ad.updated_at
	from `jurassicParkDB`.`address` as Ad
    inner join `jurassicParkDB`.`city` as Ct on Ad.city_id=Ct.id
    inner join `jurassicParkDB`.`state` as St on Ct.state_id=St.id
    inner join `jurassicParkDB`.`country` as Co on Co.id=St.country_id;
    
# tipos de reservacion y costos activos
select VT.id, VT.code, VT.name, PV.cost 
	from `jurassicParkDB`.`visit_type` as VT
    inner join `jurassicParkDB`.`product_visit` as PV on VT.id=PV.visit_type_id and VT.code=PV.visit_type_code
    where PV.is_active;

