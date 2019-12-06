create table archive (
 ID SERIAL PRIMARY key,
 isim char(20)
);


create or replace FUNCTION my_trigger() RETURNS trigger 
AS $emp_stamp$
        
	BEGIN
            INSERT INTO archive(isim) SELECT old.isim;
            RETURN old;
    end;
$emp_stamp$ 
LANGUAGE plpgsql;

drop trigger emp_stamp;

truncate archive;

create TRIGGER my BEFORE DELETE ON ogrenci
    FOR EACH ROW EXECUTE PROCEDURE my_trigger();

   
   select * from ogrenci o;
  
  delete from ogrenci_egitim oe where oe.ogrenci_id = 1;
  delete from ogrenci o where o.isim='burak';
  
   
