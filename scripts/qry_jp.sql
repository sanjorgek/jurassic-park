#
# Busquedas
#

# todas las escuelas con su información
select Sc.id as 'school_id', Sc.code as 'school_code', Sc.name as 'school_name', Ad.pc, Ad.street, Ad.district, Ct.name as 'city_name', St.name as 'state_name', Co.name as 'country_name', group_concat(ScT.telephone) as 'telephones', group_concat(ScE.email) as 'emails', Sc.created_at, Sc.updated_at
from school as Sc
left join school_telephone as ScT on Sc.id=ScT.school_id and Sc.code=ScT.school_code
left join school_email as ScE on Sc.id=ScE.school_id and Sc.code=ScE.school_code
inner join address as Ad on Sc.address_id=Ad.id
inner join city as Ct on Ad.city_id=Ct.id
inner join state as St on Ct.state_id=St.id
inner join country as Co on Co.id=St.country_id
group by Sc.id, Sc.code
order by Sc.id;

# reservaciones activas por escuela ordenas por fecha de visita
select Rs.id as 'reservation_id', Rs.visit_date, Rs.visit_hour, Sc.code as 'school_code', Sc.name as 'school_name'
from `jurassicParkDB`.`school` as Sc
inner join `jurassicParkDB`.`reservation` Rs on Sc.code=Rs.school_code and Sc.id=Rs.school_id
where Rs.visit_date>='2017-05-11'
order by Rs.visit_date, Rs.visit_hour;

# informacion de una reservacion: sus zonas reservadas, sus grados, alumnos y precios de boleto
select St.id as 'student_id', PV.visit_type_code, RZ.principal_teacher, group_concat(PV.cost) as 'costs', St.name, DZ.dino_names
from visit_type as VT
inner join product_visit as PV on VT.code=PV.visit_type_code and VT.id=PV.visit_type_id and PV.is_active
inner join reserve_zone as RZ on RZ.visit_type_code=VT.code and RZ.visit_type_id=VT.id
left join student as St on St.reserve_zone_id=RZ.id
left join (select Vs.reserve_zone_id, group_concat(Dn.name) as 'dino_names'
  from visit as Vs
  inner join zone as Zn on Zn.code=Vs.zone_code
  inner join dinosaur as Dn on Dn.zone_code=Zn.code
  group by Vs.reserve_zone_id) as DZ on DZ.reserve_zone_id=RZ.id
left join ticket as Tk on Tk.student_id=St.id
where RZ.reservation_id=6
group by St.name
order by VT.id;

# Grados de los alumnos
select RZ.id, RZ.grade
from `jurassicParkDB`.`reservation` as R
inner join `jurassicParkDB`.`reserve_zone` as RZ on RZ.reservation_id=R.id
where RZ.reservation_id=6
group by RZ.grade;

# zonas
select Zn.code, Zn.type, Dn.name, Dn.id
 from zone as Zn
 left join dinosaur as Dn on Zn.code=Dn.zone_code
 order by Zn.type;

# una zona en especifico
select Zn.code, Zn.type, Zn.police_rfc as 'security', Zn.scientist_rfc as 'antropologist', Zn.veterinary_rfc as 'veterinary', Zn.quatermaster_rfc as 'quatermaster', Dn.name as 'dinosaur_name', Dn.surface, Dn.feed_type, Dn.weight, Dn.height, Dst.name as 'time_distribution', VgT.detail, TC.name as 'tax_class', TP.name as 'tax_phylum', TK.name as 'tax_kingdom'
	from zone as Zn
 inner join dinosaur as Dn on Zn.code=Dn.zone_code
 inner join distribution as Dst on Dn.distribution_id=Dst.id
 inner join tax_class as TC on TC.id=Dn.tax_class_id
 inner join tax_phylum as TP on TP.id=TC.tax_phylum_id
 inner join tax_kingdom as TK on TK.id=TP.tax_kingdom_id
 inner join vegetation_type as VgT on VgT.id=Dn.vegetation_type_id
 where Zn.code='E3886627-FC23-84DD-4D21-7A2B84FC5D3D';

# empleados
select Em.rfc, Em.names, Em.father_last_name, Em.mother_last_name, Em.email, Em.telephone, Em.day_off, Ad.pc, Ad.street, Ad.district, Ct.name as 'city', St.name as 'state', Co.name as 'country', IF(Qt.rfc is null, 0, 1) AS isQuatermaster, IF(Dv.rfc is null, 0, 1) AS isDriver, IF(Pl.rfc is null, 0, 1) AS isSecurity, IF(Sc.rfc is null, 0, 1) AS isScientist, IF(Vt.rfc is null, 0, 1) AS isVeterinary
 from employee as Em
 inner join address as Ad on Em.address_id=Ad.id
 inner join city as Ct on Ad.city_id=Ct.id
 inner join state as St on Ct.state_id=St.id
 inner join country as Co on Co.id=St.country_id
 left join driver as Dv on Dv.rfc=Em.rfc
 left join police as Pl on Pl.rfc=Em.rfc
 left join quatermaster as Qt on Qt.rfc=Em.rfc
 left join scientist as Sc on Sc.rfc=Em.rfc
 left join veterinary as Vt on Vt.rfc=Em.rfc
 group by Em.rfc
 order by Em.rfc;