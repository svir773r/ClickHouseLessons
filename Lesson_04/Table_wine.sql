
use svirin;
create table wine(
nn UInt32, 
country String,
description String, 
designation String,
points UInt8,
price Decimal32(2),
province String,
region_1 String,
region_2 String,
taster_name String,
taster_twitter_handle String,
title String,
variety String,
winery String,
) Engine = MergeTree()
order by nn;

--clickhouse-client -h 127.0.0.1 -u default --format_csv_delimiter="," --input_format_csv_skip_first_lines=1 --query "insert into svirin.wine FORMAT CSV" < winemag-data-130k-v2.csv

use svirin;

select country 
,max(price) max_price
from wine
where country  is not null
and price  is not NULL 
group by country 
order by max(price) desc 
limit 10;

