create table users (
  id int auto_increment primary key,
  username varchar(30) not null,
  password varchar(30) not null,
  profile_picture blob null,
  last_login_time timestamp null,
  is_deleted enum('0', '1') null,
  constraint users_username_uindex
  unique (username)
);
INSERT INTO `users` (`id`, `username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
  (NULL, 'user1', '1', NULL, NOW(), '0');
INSERT INTO `users` (`id`, `username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
  (NULL, 'user2', '1', NULL, NOW(), '0');
INSERT INTO `users` (`id`, `username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
  (NULL, 'user3', '1', NULL, NOW(), '0');
INSERT INTO `users` (`id`, `username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
  (NULL, 'user4', '1', NULL, NOW(), '1');
INSERT INTO `users` (`id`, `username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`) VALUES
  (NULL, 'user5', '1', NULL, NOW(), '0');


