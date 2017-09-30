create table categories
(
  id int auto_increment primary key,
  category_name varchar(50) not null,
  notes text null
);

create table directors
(
  id int auto_increment primary key,
  director_name varchar(50) not null,
  notes text null
);

CREATE TABLE genres (
  id int auto_increment primary key,
  genre_name varchar(50) not null,
  notes text null
);

create table movies
(
  id int auto_increment primary key,
  title varchar(50) not null,
  director_id int not null,
  copyright_year year null,
  length int null,
  genre_id int not null,
  category_id int not null,
  rating int null,
  notes text null,
  constraint movies_directors_id_fk
  foreign key (director_id) references directors (id),
  constraint movies_genres_id_fk
  foreign key (genre_id) references genres (id),
  constraint movies_categories_id_fk
  foreign key (category_id) references categories (id)
);

INSERT INTO `categories` (`id`, `category_name`, `notes`) VALUES
  (1, 'category 1', NULL),
  (2, 'category 2', NULL),
  (3, 'category 3', NULL),
  (4, 'category 4', NULL),
  (5, 'category 5', NULL);

INSERT INTO `directors` (`id`, `director_name`, `notes`) VALUES
  (1, 'director 1', NULL),
  (2, 'director 2', NULL),
  (3, 'director 3', NULL),
  (4, 'director 4', NULL),
  (5, 'director 5', NULL);

INSERT INTO `genres` (`id`, `genre_name`, `notes`) VALUES
  (1, 'genre 1', NULL),
  (2, 'genre 2', NULL),
  (3, 'genre 3', NULL),
  (4, 'genre 4', NULL),
  (5, 'genre 5', NULL);

INSERT INTO `movies` (`id`, `title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`) VALUES
  (1, 'movie title 1', 1, 2017, 12, 1, 1, 3, NULL),
  (2, 'movie title 2', 1, 2016, 12, 1, 1, 3, NULL),
  (3, 'movie title 3', 1, 2015, 12, 1, 1, 3, NULL),
  (4, 'movie title 4', 1, 2014, 12, 1, 1, 3, NULL),
  (5, 'movie title 5', 1, 2013, 12, 1, 1, 3, NULL);