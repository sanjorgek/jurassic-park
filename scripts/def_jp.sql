#
# Definicion de las tablas
#

CREATE DATABASE IF NOT EXISTS jurassicParkDB;

CREATE USER 'jpAdmin'@'localhost' IDENTIFIED BY 'apophis89hep';

GRANT ALL ON jurassicParkDB.* TO 'jpAdmin'@'localhost';

create table `jurassicParkDB`.`country` (
  id                        bigint auto_increment not null,
  name                      varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_country primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`state` (
  id                        bigint auto_increment not null,
  name                      varchar(255) not null,
  country_id                bigint,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_state primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`city` (
  id                        bigint auto_increment not null,
  name                      varchar(255) not null,
  state_id                	bigint,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_city primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`address` (
  id                        bigint auto_increment not null,
  pc                        mediumint UNSIGNED,
  street                    varchar(255),
  district                  varchar(255),
  city_id                	bigint,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_address primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`school` (
  id						bigint auto_increment not null,
  code						varchar(255) not null,
  name                      varchar(255) not null,
  address_id               	bigint not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_school_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`school_email` (
  school_id					bigint not null,
  school_code				varchar(255) not null,
  email                     varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime
) ENGINE=INNODB;

create table `jurassicParkDB`.`school_telephone` (
  school_id					bigint not null,
  school_code				varchar(255) not null,
  telephone                 varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime
) ENGINE=INNODB;

create table `jurassicParkDB`.`address_school` (
  address_id				bigint not null,
  school_id					bigint not null,
  school_code				varchar(255) not null,
  constraint pk_address_school primary key (address_id, school_id, school_code)
) ENGINE=INNODB;

create table `jurassicParkDB`.`reservation` (
  id						bigint auto_increment not null,
  school_id					bigint not null,
  school_code				varchar(255) not null,
  visit_date                date not null,
  visit_hour                time not null,
  method					enum('telephone', 'email'),
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_reservation_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`visit_type` (
  id						bigint auto_increment not null,
  code						varchar(255) not null,
  name                      varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_visit_type_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`product_visit` (
  id						bigint auto_increment not null,
  visit_type_id				bigint not null,
  visit_type_code			varchar(255) not null,
  cost						double,
  is_active					boolean DEFAULT true,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_product_visit_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`reserve_zone` (
  id						bigint auto_increment not null,
  reservation_id			bigint not null,
  visit_type_id				bigint not null,
  visit_type_code			varchar(255) not null,
  principal_teacher			varchar(255) not null,
  grade						varchar(255),
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_reserve_zone_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`reserve_zone_teacher` (
  reserve_zone_id			bigint not null,
  name                      varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_reserve_zone_teacher_1 primary key (reserve_zone_id, name)
) ENGINE=INNODB;

create table `jurassicParkDB`.`student` (
  id						bigint auto_increment not null,
  reserve_zone_id			bigint not null,
  name                      varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_student_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`ticket`(
  id						bigint auto_increment not null,
  code						varchar(255) not null,
  product_visit_id			bigint not null,
  student_id				bigint not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_ticket_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`employee`(
  rfc						varchar(255) not null,
  names						varchar(255) not null,
  father_last_name			varchar(255) not null,
  mother_last_name			varchar(255),
  email						varchar(255) not null,
  telephone					varchar(255) not null,
  day_off					enum('lunes','martes','miercoles','jueves','viernes','sabado','domingo'),
  address_id			bigint not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_employee_1 primary key (rfc),
  constraint ck_employee_1 check(rfc regexp '^[A-Z&]{3,4}[0-9]{6}([A-Z&]{2}|[0-9]{2}|[A-Z&][0-9]|[0-9][A-Z&])([A]|[0-9])'),
  constraint ck_employee_2 check(email regexp '^[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9._-]@[a-zA-Z0-9][a-zA-Z0-9._-]*[a-zA-Z0-9]\\.[a-zA-Z]{2,4}$')
) ENGINE=INNODB;

create table `jurassicParkDB`.`police`(
  rfc						varchar(255) not null,
  radio_code				mediumint,
  is_armed					boolean
) ENGINE=INNODB;

create table `jurassicParkDB`.`scientist`(
  rfc						varchar(255) not null,
  license					varchar(255) not null
) ENGINE=INNODB;

create table `jurassicParkDB`.`veterinary`(
  rfc						varchar(255) not null,
  speciality				varchar(255) not null
) ENGINE=INNODB;

create table `jurassicParkDB`.`quatermaster`(
  rfc						varchar(255) not null,
  speciality				varchar(255) not null
) ENGINE=INNODB;

create table `jurassicParkDB`.`vehicle_model`(
  id						bigint auto_increment not null,	
  manufacturer				varchar(255) not null,
  model						varchar(255) not null,
  capacity					tinyint,
  type						enum('maritimo', 'aereo', 'terrestre'),
  fuel_type					enum('electrico', 'gasolina', 'solar'),
  is_autonomus				boolean,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_zone_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`vehicle`(
  id						bigint auto_increment not null,	
  vehicle_model_id			bigint not null,
  is_pc_interactive			boolean,
  details					varchar(255),
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_zone_1 primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`driver`(
  rfc						varchar(255) not null,
  license_number			varchar(255) not null,
  license_expires_at		datetime,
  vehicle_id				bigint not null
) ENGINE=INNODB;

create table `jurassicParkDB`.`zone`(
  code						varchar(255) not null,
  type						enum('dinosaurio','transporte'),
  police_rfc				varchar(255),
  scientist_rfc				varchar(255),
  veterinary_rfc			varchar(255),
  quatermaster_rfc			varchar(255),
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_zone_1 primary key (code)
) ENGINE=INNODB;

create table `jurassicParkDB`.`zone_vehicle`(
  zone_code						varchar(255) not null,
  vehicle_id						bigint not null
) ENGINE=INNODB;

create table `jurassicParkDB`.`visit`(
  reserve_zone_id			bigint not null,
  zone_code					varchar(255) not null
) ENGINE=INNODB;

create table `jurassicParkDB`.`vegetation_type` (
  id                        bigint auto_increment not null,
  detail                    varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_vegetation_type primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`tax_kingdom` (
  id                        bigint auto_increment not null,
  name	                    varchar(255) not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_tax_kingdom primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`tax_phylum` (
  id                        bigint auto_increment not null,
  name	                    varchar(255) not null,
  tax_kingdom_id			bigint not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_tax_phylum primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`tax_class` (
  id                        bigint auto_increment not null,
  name	                    varchar(255) not null,
  tax_phylum_id				bigint not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_tax_class primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`distribution`(
  id                        bigint auto_increment not null,
  name	                    varchar(255) not null,
  constraint pk_distribution primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`dinosaur`(
  id						bigint auto_increment not null,
  zone_code					varchar(255) not null,
  tax_class_id				bigint not null,
  name						varchar(255) not null,
  distribution_id			bigint not null,
  surface					bigint not null,
  feed_type					enum('herbívoro','carnivoro'),
  weight					varchar(255) not null,
  height					varchar(255) not null,
  vegetation_type_id		bigint not null,
  created_at                datetime DEFAULT CURRENT_TIMESTAMP,
  updated_at                datetime ON UPDATE CURRENT_TIMESTAMP,
  deleted_at                datetime,
  constraint pk_tax_phylum primary key (id)
) ENGINE=INNODB;

create table `jurassicParkDB`.`dinosaur_safety_requirement`(
  dinosaur_id				bigint not null,
  safety_requirement		varchar(255) not null
) ENGINE=INNODB;

#
# Unique
#
alter table `jurassicParkDB`.`country` add
  constraint uq_country_1 unique (name);
alter table `jurassicParkDB`.`state` add
  constraint uq_state_1 unique (name, country_id);
alter table `jurassicParkDB`.`city` add
  constraint uq_city_1 unique (name, state_id);
alter table `jurassicParkDB`.`address` add
  constraint uq_address_1 unique (pc, street, district, city_id);
alter table `jurassicParkDB`.`school` add
  constraint uq_school_1 unique (code);
alter table `jurassicParkDB`.`school` add
  constraint uq_school_2 unique (name, address_id);
alter table `jurassicParkDB`.`school_email` add
  constraint uq_school_email_1 unique (school_id,school_code,email);
alter table `jurassicParkDB`.`school_telephone` add
  constraint uq_school_telephone_2 unique (school_id,school_code,telephone);
alter table `jurassicParkDB`.`visit_type` add
  constraint uq_visit_type unique (code);
alter table `jurassicParkDB`.`student` add
  constraint uq_student unique (reserve_zone_id, name);
alter table `jurassicParkDB`.`ticket` add
  constraint uq_ticket unique (code);
alter table `jurassicParkDB`.`reservation` add
  constraint uq_reservation_1 unique (school_id,school_code,visit_date);

#
# Foreign
#
alter table `jurassicParkDB`.`state` add
  constraint fk_state_country foreign key (country_id) references `jurassicParkDB`.`country` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`city` add
  constraint fk_city_state foreign key (state_id) references `jurassicParkDB`.`state` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`address` add
  constraint fk_address_city foreign key (city_id) references `jurassicParkDB`.`city` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`school` add
  constraint fk_school_address foreign key (address_id) references `jurassicParkDB`.`address` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`school_email` add
  constraint fk_school_email_school_1 foreign key (school_id) references `jurassicParkDB`.`school` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`school_email` add
  constraint fk_school_email_school_2 foreign key (school_code) references `jurassicParkDB`.`school` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`school_telephone` add
  constraint fk_school_telephone_school_1 foreign key (school_id) references `jurassicParkDB`.`school` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`school_telephone` add
  constraint fk_school_telephone_school_2 foreign key (school_code) references `jurassicParkDB`.`school` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`reservation` add
  constraint fk_reservation_school_1 foreign key (school_id) references `jurassicParkDB`.`school` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`reservation` add
  constraint fk_reservation_school_2 foreign key (school_code) references `jurassicParkDB`.`school` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`product_visit` add
  constraint fk_product_visit_visit_type_1 foreign key (visit_type_id) references `jurassicParkDB`.`visit_type` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`product_visit` add
  constraint fk_product_visit_visit_type_2 foreign key (visit_type_code) references `jurassicParkDB`.`visit_type` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`reserve_zone` add
  constraint fk_reserve_zone_visit_type_1 foreign key (visit_type_id) references `jurassicParkDB`.`visit_type` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`reserve_zone` add
  constraint fk_reserve_zone_visit_type_2 foreign key (visit_type_code) references `jurassicParkDB`.`visit_type` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`reserve_zone` add
  constraint fk_reserve_zone_reservation_1 foreign key (reservation_id) references `jurassicParkDB`.`reservation` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`reserve_zone_teacher` add
  constraint fk_reserve_zone_teacher_1 foreign key (reserve_zone_id) references `jurassicParkDB`.`reserve_zone` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`student` add
  constraint fk_student_1 foreign key (reserve_zone_id) references `jurassicParkDB`.`reserve_zone` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`ticket` add
  constraint fk_ticket_1 foreign key (product_visit_id) references `jurassicParkDB`.`product_visit` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`ticket` add
  constraint fk_ticket_2 foreign key (student_id) references `jurassicParkDB`.`student` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`employee` add
  constraint fk_employee_1 foreign key (address_id) references `jurassicParkDB`.`address` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`police` add
  constraint fk_police_1 foreign key (rfc) references `jurassicParkDB`.`employee` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`scientist` add
  constraint fk_scientist_1 foreign key (rfc) references `jurassicParkDB`.`employee` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`veterinary` add
  constraint fk_veterinary_1 foreign key (rfc) references `jurassicParkDB`.`employee` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`quatermaster` add
  constraint fk_quatermaster_1 foreign key (rfc) references `jurassicParkDB`.`employee` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`driver` add
  constraint fk_driver_1 foreign key (rfc) references `jurassicParkDB`.`employee` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`zone` add
  constraint fk_zone_1 foreign key (scientist_rfc) references `jurassicParkDB`.`scientist` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`zone` add
  constraint fk_zone_2 foreign key (police_rfc) references `jurassicParkDB`.`police` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`zone` add
  constraint fk_zone_3 foreign key (veterinary_rfc) references `jurassicParkDB`.`veterinary` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`zone` add
  constraint fk_zone_4 foreign key (quatermaster_rfc) references `jurassicParkDB`.`quatermaster` (rfc)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`visit` add
  constraint fk_visit_1 foreign key (reserve_zone_id) references `jurassicParkDB`.`reserve_zone` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`visit` add
  constraint fk_visit_2 foreign key (zone_code) references `jurassicParkDB`.`zone` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`vehicle_model` add
  constraint uq_vehicle_model unique (manufacturer, model);
alter table `jurassicParkDB`.`vehicle` add
  constraint fk_vehicle_1 foreign key (vehicle_model_id) references `jurassicParkDB`.`vehicle_model` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`driver` add
  constraint fk_driver_2 foreign key (vehicle_id) references `jurassicParkDB`.`vehicle` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`zone_vehicle` add
  constraint fk_zone_vehicle_1 foreign key (vehicle_id) references `jurassicParkDB`.`vehicle` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`zone_vehicle` add
  constraint fk_zone_vehicle_2 foreign key (zone_code) references `jurassicParkDB`.`zone` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`tax_phylum` add
  constraint fk_tax_phylum_1 foreign key (tax_kingdom_id) references `jurassicParkDB`.`tax_kingdom` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`tax_class` add
  constraint fk_tax_class_1 foreign key (tax_phylum_id) references `jurassicParkDB`.`tax_phylum` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`dinosaur` add
  constraint fk_dinosaur_1 foreign key (tax_class_id) references `jurassicParkDB`.`tax_class` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`dinosaur` add
  constraint fk_dinosaur_2 foreign key (zone_code) references `jurassicParkDB`.`zone` (code)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`dinosaur` add
  constraint fk_dinosaur_3 foreign key (distribution_id) references `jurassicParkDB`.`distribution` (id)
  on delete restrict on update restrict;
alter table `jurassicParkDB`.`dinosaur` add 
  constraint fk_dinosaur_4 foreign key (vegetation_type_id) references `jurassicParkDB`.`vegetation_type` (id)
  on delete restrict on update restrict;  
alter table `jurassicParkDB`.`dinosaur_safety_requirement` add
  constraint fk_dinosaur_safety_requirement_1 foreign key (dinosaur_id) references `jurassicParkDB`.`dinosaur` (id)
  on delete restrict on update restrict;

#
# Index
#
create index ix_state_country on `jurassicParkDB`.`state` (country_id);
create index ix_city_state on `jurassicParkDB`.`city` (state_id);
create index ix_address_city on `jurassicParkDB`.`address` (city_id);
create index ix_school_address on `jurassicParkDB`.`school` (address_id);
create index ix_school_code on `jurassicParkDB`.`school` (code);
create index ix_visit_type on `jurassicParkDB`.`visit_type` (code);
create index ix_ticket on `jurassicParkDB`.`ticket` (code);
