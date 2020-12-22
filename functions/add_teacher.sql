create or replace function 
	add_teacher ( fname text, lname text, emails text )
	returns boolean as
$$
declare
-- declare a variable to be used in the function
total int;

begin

	-- run a query to check if the subject name exists
	select into total count(*) from teacher 
		where LOWER(email) = LOWER(emails);

	-- if total is 0 the subject doesn't exist
	if (total = 0) then
		-- then create the subject
insert into teacher (first_name, last_name, email) values (fname, lname, emails);
		-- and returns true if the subject was created already
		return true;
	else
		-- returns false if the subject already exists
		return false;
	end if;

end;
$$
Language plpgsql;