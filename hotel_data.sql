-- Combine all the tables in a single table: 
-- (select hotel,is_canceled,arrival_date_year from 2018_csv)   
-- UNION ALL
-- (select hotel,is_canceled,arrival_date_year from 2019_csv)
-- UNION ALL
-- (select hotel,is_canceled,arrival_date_year from 2020_csv);

----------------------------------------------------------------------
-- Create a single table for all the tables using the below function :
''' SELECT *
FROM (
(select hotel,is_canceled,arrival_date_year from 2018_csv)   
UNION ALL
(select hotel,is_canceled,arrival_date_year from 2019_csv)
UNION ALL
(select hotel,is_canceled,arrival_date_year from 2020_csv)
) AS hotels ;'''



select * from hotels_csv;

select arrival_date_year, hotel, round (sum((stays_in_week_nights+stays_in_weekend_nights)* adr), 2) as revenue from hotels_csv
group by arrival_date_year, hotel;

select * from marketsegment_csv;

select * from hotels_csv
left join marketsegment_csv on hotels_csv.market_segment = marketsegment_csv.market_segment
left join meals_csv on meals_csv.meal= hotels_csv.meal;

select * from meals_csv;





