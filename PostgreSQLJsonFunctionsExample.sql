



select '{"isim":"b","numara": 4.44, "active": true, "tr": "���cs�� ������i�"}'::json;
--direk text olarak saklar

select '{"isim":"b","numara": 4.44, "active": true, "tr": "���cs�� ������i�"}'::jsonb;
--parse edip binary �eklinde saklar

select '"foo"'::jsonb @> '"foo"'::jsonb;--sa�daki json soldakinin i�inde var m�?


select '[1,2,3]'::jsonb @> '[3,1]'::jsonb;

select '{"foo":"bar"}'::jsonb ? 'foo';

select '{"foo":"bar"}'::jsonb ? 'bar';

select '{"foo":"bar"}'::jsonb -> 'foo'; -- "bar"

select '{"foo":"bar"}'::jsonb ->> 'foo'; -- bar

select '{"a": {"b":"c"}}'::jsonb #> '{a,b}';

select '{"a":[1,2,3,4]}'::jsonb #>> '{a,3}';-- a[3]











