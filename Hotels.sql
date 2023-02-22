with hotels as(
select * from hotel2018
union all 
select * from hotel2019
union all 
select * from hotel2020)

select hotel,ARRIVAL_DATE_YEAR,ARRIVAL_DATE_MONTH,adr,REQUIRED_CAR_PARKING_SPACES, round(sum((STAYS_IN_WEEKEND_NIGHTS+STAYS_IN_WEEK_NIGHTS)*adr)) as Income, sum(adults+ children + babies) as Visitors
from hotels
where RESERVATION_STATUS != 'Canceled'
group by ARRIVAL_DATE_YEAR,ARRIVAL_DATE_MONTH,hotel,adr,REQUIRED_CAR_PARKING_SPACES
order by arrival_date_year; 



with hotels as(
select * from hotel2018
union all 
select * from hotel2019
union all 
select * from hotel2020)

select * from hotels
left join market m
on hotels.market_segment = m.market_segment
left join meal_cost mc
on hotels.meal = mc.meal;
