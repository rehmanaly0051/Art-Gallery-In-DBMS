use artgallery;

-- DDL
-- alter
alter table artist modify column Birthdate year;
alter table artwork change column title art_name varchar(255);
alter table customer add column dateOFbith date;
alter table customer drop column dateOFbith;

-- rename
rename table ordertable to order_;

-- drop

-- drop database
drop database artgallery;

-- drop table
drop table Ordertable;

-- truncate

truncate login;

/*multi line
	comment
*/

desc customer;