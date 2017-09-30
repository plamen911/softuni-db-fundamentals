create table people (
  id int auto_increment
    primary key,
  name varchar(200) not null,
  picture blob null,
  height float(10,2) null,
  weight float(10,2) null,
  gender enum('m', 'f') not null,
  birthdate date not null,
  biography text null
);
INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
  (NULL, 'John', NULL, 10.00, 20.00, 'm', '2000-04-22', NULL);
INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
  (NULL, 'Bill', NULL, 10.00, 20.00, 'm', '2001-04-22', NULL);
INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
  (NULL, 'Jerry', NULL, 10.00, 20.00, 'm', '2002-04-22', NULL);
INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
  (NULL, 'Maria', NULL, 10.00, 20.00, 'm', '2003-04-22', NULL);
INSERT INTO `people` (`id`, `name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`) VALUES
  (NULL, 'Edward', NULL, 10.00, 20.00, 'm', '2004-04-22', NULL);
