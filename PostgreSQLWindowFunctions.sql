create table kategori (
	ID serial primary key,
	kat_isim varchar(20)
);

create table urun (
	ID serial primary key,
	isim varchar(20),
	kat_id int,
	fiyat numeric
);

insert into kategori(kat_isim) values ('Kahve'),('Sandvi�'),('Pasta');

insert into urun(isim,kat_id,fiyat) values
('Filtre Kahve',1,10),
('Ekspresso',1,12),
('Orta Kahve',1,8),
('Peynirli Sandvi�',2,10),
('Salaml� Sandvi�',2,12),
('Ka�arl� Sandvi�',2,8),
('�ikolatal� Pasta',3,15),
('Mozaik Pasta',3,12),
('Orman Meyveli',3,18)

select * from urun u left outer join kategori k on u.kat_id = k.id;

select avg(u.fiyat) as ortalama_fiyat,k.kat_isim 
from urun u left outer join kategori k on u.kat_id = k.id group by k.kat_isim;

select u.isim, k.kat_isim, u.fiyat, avg(u.fiyat) over (partition by k.kat_isim)
from urun as u inner join kategori as k on u.kat_id = k.id;
--window functions bakabilirsin pg i�in.
--over yazd�ktan sonra yazd���m�z yere bakarak pencere a��yor selectin i�i etkilemiyor ama sadece result set �zerinden
--yani where i�ine yazd���m�z �eyler �nemli.

select u.isim, k.kat_isim, u.fiyat, avg(u.fiyat) over (partition by k.kat_isim)
from urun as u inner join kategori as k on u.kat_id = k.id where k.id<3;


select u.fiyat, avg(u.fiyat) from urun u; --�al��maz


select u.fiyat, avg(u.fiyat) over() from urun u;


select u.fiyat, sum(u.fiyat) over(order by u.fiyat) from urun u;

select u.fiyat, rank() over(order by u.fiyat), sum(u.fiyat) over(order by u.fiyat) from urun u;

select u.fiyat, rank() over(order by u.fiyat) from urun u;

select u.fiyat, dense_rank() over(order by u.fiyat) from urun u;


select u.isim,k.kat_isim, u.fiyat, avg(u.fiyat) over (partition by k.kat_isim order by fiyat),
dense_rank() over (partition by k.kat_isim order by fiyat)
from urun u inner join kategori k on u.kat_id = k.id;

select * from (
select u.isim, k.kat_isim, u.fiyat,
avg(u.fiyat) over w,
dense_rank() over w as pos
from urun u inner join kategori k on u.kat_id = k.id
window w as ( partition by k.kat_isim order by fiyat)
) as r
where r.pos<3;
)








