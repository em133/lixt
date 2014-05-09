create or replace function create_user(varchar, varchar) returns setof void as $$
begin
	insert into users values(default, lower($1), crypt($2, gen_salt('bf')));
return; end; $$ language plpgsql;

create or replace function drop_user(varchar) returns setof void as $$
begin
	delete from users where "user" = $1;
return; end; $$ language plpgsql;

create or replace function login(varchar, varchar) returns boolean as $$
begin
	if exists (select 1 from users where lower("user")=$1 and pass=crypt($2, pass))
		then return true;
		else return false;
	end if;
end; $$ language plpgsql;

