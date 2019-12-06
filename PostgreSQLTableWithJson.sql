create table dersler (
	ID serial primary key,
	isim varchar(20),
	bilgi jsonb
);

insert into dersler (isim, bilgi) values (
	'PG-101',
	'{"egitmen":"Hakan Uygun","gunler": ["05.12.2019","06.12.2019","07.12.2019"]}'
);

insert into dersler (isim, bilgi) values (
	'PG-102',
	'{"egitmen":"Doruk Fiþek","gunler": ["01.02.2019"]}'--yýl,ay,gün þeklinde tutarsak daha iyi olur.
);

select * from dersler;

select isim,bilgi -> 'egitmen' as egitmen from dersler; --element olarak gelir

select isim,bilgi ->> 'egitmen' as egitmen from dersler; --text olarak gelir

select isim,bilgi -> 'egitmen' as egitmen,bilgi -> 'gunler' as gunler from dersler;

select isim,bilgi -> 'egitmen' as egitmen,bilgi ->> 'gunler' as gunler from dersler;

select isim,bilgi #> '{"gunler",1}' as gun from dersler;

select isim,bilgi #>> '{"gunler",1}' as gun from dersler;

select isim,bilgi #>> '{"gunler",1}' as gun from dersler where bilgi @>'{"egitmen":"Hakan Uygun"}';

select isim,jsonb_array_elements(bilgi -> 'gunler') as gun from dersler;

select isim,jsonb_pretty(bilgi) as bilgi from dersler;


create index idx_dersler on dersler using GIN (bilgi);


select isim, bilgi ->> 'egitmen' as egitmen from dersler where bilgi @> '{"gunler":["06.12.2019"]}';

select isim, bilgi ->> 'egitmen' as egitmen from dersler where bilgi->'gunler' @> '["06.12.2019"]';

select isim, bilgi ->> 'egitmen' as egitmen from dersler where bilgi->'gunler' @> '"06.12.2019"';





