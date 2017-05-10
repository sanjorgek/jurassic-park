#
#
#
select RZ.id as 'reservation_zone_id', RZ.visit_type_id, RZ.principal_teacher, group_concat(D.name) as 'zones', VT.code as 'visit_code', VT.id as 'visit_id', VT.name as 'visit_name', St.id as 'student_id', St.name as 'student_name', PV.cost as 'ticket_cost'
  from ((((((`jurassicParkDB`.`reserve_zone` as RZ
		          inner join `jurassicParkDB`.`visit` as Vi on RZ.id=Vi.reserve_zone_id)
			      inner join `jurassicParkDB`.`zone` as Z on Vi.zone_code=Z.code)
				  inner join `jurassicParkDB`.`dinosaur` as D on D.zone_code=Z.code)
		    inner join `jurassicParkDB`.`visit_type` as VT on VT.code=RZ.visit_type_code and VT.id=RZ.visit_type_id)
      inner join `jurassicParkDB`.`student` as St on St.reserve_zone_id=RZ.id)
    inner join `jurassicParkDB`.`product_visit` as PV on PV.visit_type_code=VT.code and PV.visit_type_id=VT.id)
  group by St.id, PV.cost
  order by VT.id;

