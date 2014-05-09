drop table if exists users;
create table users (
	id     serial,
	"user" varchar(16)  not null,
	pass   varchar(128) not null,
	primary key (id)
);
create unique index on users((lower("user")));
