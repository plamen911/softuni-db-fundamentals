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
	category_id int null,
	constraint products_categories__id_fk
		foreign key (category_id) references categories (id)
)
;

create index products_categories__id_fk
	on products (category_id)
;

INSERT INTO categories (id, name) VALUES
(1, 'category #1'),
(2, 'category #2'),
(3, 'category #3');

INSERT INTO employees (id, first_name, last_name) VALUES
(1, 'fname #1', 'lname #1'),
(2, 'fname #2', 'lname #2'),
(3, 'fname #3', 'lname #3');

INSERT INTO products (id, name, category_id) VALUES
(1, 'product #1', 1),
(2, 'product #2', 2),
(3, 'product #3', 3);