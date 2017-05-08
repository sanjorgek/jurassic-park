#
# Definicion de las tablas
#

select R.id as 'reservation_id', R.visit_date, Sc.code as 'school_code', Sc.name as 'school_name', R.created_at from `jurassicParkDB`.`reservation` as R
	join `jurassicParkDB`.`school` as Sc
    on Sc.id=R.school_id and Sc.code=R.school_code;

