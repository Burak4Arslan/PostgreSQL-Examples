select 'PostgreSQL süper bir veri tabanýdýr'::tsvector @@ 'veri & süper'::tsquery as result;

select 'PostgreSQL süper bir veri tabanýdýr'::tsvector @@ 'veri <-> süper'::tsquery as result;

select 'PostgreSQL süper bir veri tabanýdýr'::tsvector @@ 'süper <-> bir'::tsquery as result;

select to_tsvector( 'turkish', 'PostgreSQL süper bir veri tabanýdýr' ) as result;

select alias, description, token from ts_debug('http://example.com/stuff/index.html') as result;

select * from ts_debug('turkish', 'PostgreSQL süper bir veri tabanýdýr') as result;

select * from ts_debug('PostgreSQL süper bir veri tabanýdýr') as result;

select * from ts_debug('english', 'Hello I am a human') as result;

select * from ts_debug('Hello I am a human') as result;

select get_current_ts_config();

select version();









