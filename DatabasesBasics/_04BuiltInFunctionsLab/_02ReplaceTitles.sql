select title from books where title like 'The%' order by id;
update books set title = concat('***', substr(title, 3)) WHERE