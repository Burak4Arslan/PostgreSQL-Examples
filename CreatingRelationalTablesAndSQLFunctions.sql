create table ogrenci (
 ID SERIAL PRIMARY key,
 isim char(20)
);

create table kurs (
 ID SERIAL PRIMARY KEY,
 isim char(20)
);

create table ogrenci_egitim (
 ID SERIAL PRIMARY KEY,
 ogrenci_id  integer not null,
 kurs_id integer not null,
 foreign key (ogrenci_id) references ogrenci (id),
 foreign key (kurs_id) references kurs (id) 
);


insert into ogrenci(isim) values('burak');
insert into ogrenci(isim) values('bigi');
insert into ogrenci(isim) values('berke');

insert into kurs(isim) values ('PG-201');
insert into kurs(isim) values ('PG-301');

insert into ogrenci_egitim (ogrenci_id,kurs_id) values (4,1);
insert into ogrenci_egitim (ogrenci_id,kurs_id) values (4,2);

select * from kurs k

select o.isim,k.isim from ogrenci as o 
left outer join ogrenci_egitim as oe on o.id = oe.ogrenci_id
left outer join kurs as k on oe.kurs_id = k.id
where o.isim like 'b%';

create or replace function ogrenci_islemleri() returns text
as $$ 
	DECLARE
		isimler text default '';
		rec_ogr record;
		cur_ogr CURSOR FOR SELECT * FROM ogrenci;
	BEGIN
		open cur_ogr;
		loop
			fetch cur_ogr into rec_ogr;
			EXIT when not found;
			if rec_ogr.isim like 'b%' then
				isimler := isimler || ', ' || rec_ogr.isim;
			end if;
		end loop;
	
	close cur_ogr;
	return isimler;
	END;
$$
language plpgsql;

select ogrenci_islemleri()


create or replace function ogrenci_islemleri2(arama varchar) returns text
as $function$ 
	DECLARE
		isimler text default '';
		rec_ogr record;
		cur_ogr CURSOR( pisim varchar )
 		FOR SELECT * FROM ogrenci o where o.isim like pisim;
	BEGIN
		open cur_ogr(pisim := arama);
		loop
			fetch cur_ogr into rec_ogr;
			EXIT when not found;
				isimler := isimler || ', ' || rec_ogr.isim;
		end loop;
	
	close cur_ogr;
	return isimler;
	END;
$function$
language plpgsql;

select ogrenci_islemleri2('bu%')
