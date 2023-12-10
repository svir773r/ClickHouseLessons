--Lesson 01

use svirin;

create table test(a Int32, b String, c Enum('one','two') Engine = Log();

insert into test
select * from
generateRandom('a Int16, b String, c Enum(\'one\'=1,\'two\'=2)') limit 10000;

SELECT *
FROM test
WHERE (b LIKE '%abc%') AND (a > 10)


