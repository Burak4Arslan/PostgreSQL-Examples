create table hesap (
 id serial primary key,
 islem_tutar integer,
 hesap_tutar varchar,
 islem_no integer
);

insert into hesap (islem_tutar,hesap_tutar,islem_no) values (100,'KASA',1);
insert into hesap (islem_tutar,hesap_tutar,islem_no) values (50,'KASA',2);
insert into hesap (islem_tutar,hesap_tutar,islem_no) values (-75,'KASA',3);

select * from hesap h;

truncate hesap;

insert into hesap (islem_tutar,hesap_tutar,islem_no) values (islemtutar,hesaptutar,islemno)

create or replace function ekle() returns table (
r_id integer,
r_islem_tutar integer,
r_hesap_tutar varchar,
r_islem_no integer,
r_bakiye integer
)
as $f$ 
	DECLARE
		hes record;
		para int;
	BEGIN
		FOR hes in (select * from hesap) loop
			para := para + 5;
			r_id := hes.id;
			r_islem_tutar = hes.islem_tutar;
			r_hesap_tutar = hes.hesap_tutar;
			r_islem_no = hes.islem_no;
			r_bakiye = para;
		RETURN NEXT;
	END LOOP;
	END;

$f$
language plpgsql;

select ekle();


------------------------------------------------------------------------------



create or replace function bakiyegetir() returns table (
r_id integer,
r_islem_tutar integer,
r_hesap_tutar varchar,
r_islem_no integer,
r_bakiye integer
)
as $f$ 
DECLARE
	rec_hesap record;
	para int :=0;
	cur_hesap cursor for select * from hesap order by hesap_tutar, islem_no;
	mal int := 0;
	
BEGIN
	open cur_hesap;
	LOOP
		fetch cur_hesap into rec_hesap;
		exit when not found;
			mal = rec_hesap.islem_tutar;
			para := para + mal;

			r_id := rec_hesap.id;
			r_islem_tutar := rec_hesap.islem_tutar;
			r_hesap_tutar := rec_hesap.hesap_tutar;
			r_islem_no := rec_hesap.islem_no;
			r_bakiye := para;
		RETURN NEXT;
	END LOOP;

close cur_hesap;

end;
 $f$
language plpgsql;

select bakiyegetir();



