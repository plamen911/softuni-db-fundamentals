create table categories
(
  id int auto_increment
    primary key,
  name varchar(50) not null
)
;

create table employees
(
  id int auto_increment
    primary key,
  first_name varchar(50) null,
  last_name varchar(50) null
)
;

create table products
(
  id int auto_increment
    primary key,
  name varchar(50) not null,
  category_id int null,
  constraint products_categories__id_fk
  foreign key (category_id) references categories (id)
)
;

create index products_categories__id_fk
  on products (category_id)
;

