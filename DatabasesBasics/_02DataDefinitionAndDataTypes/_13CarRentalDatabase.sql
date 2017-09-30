create table categories
(
  id INT(11) AUTO_INCREMENT primary key,
  category varchar(50) not null,
  daily_rate int(3),
  weekly_rate int(3),
  monthly_rate int(3),
  weekend_rate int(3)
);
create table cars
(
  id INT AUTO_INCREMENT primary key,
  plate_number varchar(50) not null,
  make varchar(50),
  model varchar(50),
  car_year int(4),
  category_id INT(11),
  doors INT(2),
  picture blob,
  car_condition varchar(50),
  available bool
);
create table employees
(
  id INT AUTO_INCREMENT primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  title varchar(50),
  notes text
);
create table customers
(
  id INT AUTO_INCREMENT primary key,
  driver_licence_number int(11) not null,
  full_name varchar(50),
  address varchar(50),
  city varchar(50),
  zip_code int(5),
  notes text
);

create table rental_orders
(
  id INT AUTO_INCREMENT primary key,
  employee_id int(11) not null,
  customer_id int(11),
  car_id int(11) not null,
  car_condition varchar(50),
  tank_level INT(11),
  kilometrage_start int(11),
  kilometrage_end int(11),
  total_kilometrage int(11),
  start_date date,
  end_date date,
  total_days INT(11),
  rate_applied INT(3),
  tax_rate INT(11),
  order_status varchar(50),
  notes text
);

INSERT INTO `categories` (`id`, `category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES
  (1, 'category 1', 100.00, 700.00, 2100.00, 50.00),
  (2, 'category 2', 100.00, 700.00, 2100.00, 50.00),
  (3, 'category 3', 100.00, 700.00, 2100.00, 50.00);

INSERT INTO `cars` (`id`, `plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `picture`, `car_condition`, `available`) VALUES
  (1, 123, 'Audi', 'A8', 2010, 1, 4, NULL, NULL, '1'),
  (2, 456, 'BMW', 'X5', 2010, 1, 4, NULL, NULL, '1'),
  (3, 789, 'Peugeot', '307SW', 2004, 1, 4, NULL, NULL, '1');

INSERT INTO `employees` (`id`, `first_name`, `last_name`, `title`, `notes`) VALUES
  (1, 'first name 1', 'last name 1', 'Mr.', NULL),
  (2, 'first name 2', 'last name 2', 'Mr.', NULL),
  (3, 'first name 3', 'last name 3', 'Mrs.', NULL);

INSERT INTO `customers` (`id`, `driver_licence_number`, `full_name`, `address`, `city`, `zip_code`, `notes`) VALUES
  (1, 123, 'John Doe', 'some street', 'Nantucket', '02554', NULL),
  (2, 456, 'George Lukas', '', 'Nantucket', '02554', NULL),
  (3, 654, 'Nakov', '', 'Nantucket', '02554', NULL);

INSERT INTO `rental_orders` (`id`, `employee_id`, `customer_id`, `car_id`, `car_condition`, `tank_level`, `kilometrage_start`, `kilometrage_end`, `total_kilometrage`, `start_date`, `end_date`, `total_days`, `rate_applied`, `tax_rate`, `order_status`, `notes`) VALUES
  (1, 1, 1, 1, 'some text', 100, 100000, 200000, 300000, '2017-09-30', '2017-09-30', 300, 100, 12, 'processed', 'some notes'),
  (2, 1, 1, 1, 'some text', 300, 100000, 200000, 300000, '2017-09-30', '2017-09-30', 300, 100, 12, 'processed', 'some notes'),
  (3, 1, 1, 1, 'some text', 400, 100000, 200000, 300000, '2017-09-30', '2017-09-30', 300, 100, 12, 'processed', 'some notes');
