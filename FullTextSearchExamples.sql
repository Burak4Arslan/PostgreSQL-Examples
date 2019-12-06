select 'PostgreSQL s�per bir veri taban�d�r'::tsvector @@ 'veri & s�per'::tsquery as result;

select 'PostgreSQL s�per bir veri taban�d�r'::tsvector @@ 'veri <-> s�per'::tsquery as result;

select 'PostgreSQL s�per bir veri taban�d�r'::tsvector @@ 's�per <-> bir'::tsquery as result;

select to_tsvector( 'turkish', 'PostgreSQL s�per bir veri taban�d�r' ) as result;

select alias, description, token from ts_debug('http://example.com/stuff/index.html') as result;

select * from ts_debug('turkish', 'PostgreSQL s�per bir veri taban�d�r') as result;

select * from ts_debug('PostgreSQL s�per bir veri taban�d�r') as result;

select * from ts_debug('english', 'Hello I am a human') as result;

select * from ts_debug('Hello I am a human') as result;

select get_current_ts_config();

select version();









