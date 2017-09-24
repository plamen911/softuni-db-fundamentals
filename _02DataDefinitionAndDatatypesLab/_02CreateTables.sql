create table if not exists categories
(
  id int auto_increment
    primary key,
  name varchar(50) not null
)
;

create table if not exists employees
(
  id int auto_increment
    primary key,
  first_name varchar(50) null,
  last_name varchar(50) null
)
;

create table if not exists products
(
  id int auto_increment
    primary key,
  name varchar(50) not null,
  category_id int null
)
;