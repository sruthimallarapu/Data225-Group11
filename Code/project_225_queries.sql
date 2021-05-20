Use project;

Select statename, SUM(UI.initclaims_count_combined + UI.contclaims_count_combined) TotalClaims
from GeoIDs_state Geo, UI_Claims_State_Weekly UI
Where Geo.statefips=UI.statefips and
      UI.year = '2020' and
      UI.month = '12' and
      UI.day_endofweek = '26'  
Group by statename order by TotalClaims DESC LIMIT 10;

####Most affected Industry
select Industry,percentage_change,dense_rank() over(order by percentage_change) as affect_rank from (
select round(avg(spend_acf)*100,2)as percentage_change,'accomodation and food service' Industry from AFFINITY_STATES
union
select round(avg(spend_aer)*100,2) percentage_change,'arts, entertainment, and recreation' Industry from AFFINITY_STATES
union
select round(avg(spend_apg)*100,2) percentage_change,'generalstores and apparel and accessories' Industry from AFFINITY_STATES
union
select round(avg(spend_grf)*100,2) percentage_change,'grocery and food store' Industry from AFFINITY_STATES
union
select round(avg(spend_hcs)*100,2) percentage_change,'health care and social assistance' Industry from AFFINITY_STATES
union
select round(avg(spend_tws)*100,2) percentage_change,'transportation and warehousing' Industry from AFFINITY_STATES) A

####Highly populated comparision
select Y.statefips,inc_low,inc_high,population_density from (select round(avg(emp_combined_inclow)*100,2) inc_low,round(avg(emp_combined_inchigh)*100,2) inc_high,statefips from employment_state_daily group by statefips) X join 
(select A.* from (
(select statename,statefips,state_pop2019,'Highly Populated' population_density from geoids_state  order by state_pop2019 desc limit 10)
union
(select statename,statefips,state_pop2019,'Less Populated'  population_density   from geoids_state  order by state_pop2019 limit 10)) A) Y on X.statefips= Y.statefips where x.inc_low!=0 and x.inc_high!=0 ;

###Unemployment rate
Select statename, SUM(UI.initclaims_count_combined + UI.contclaims_count_combined) TotalClaims
from GeoIDs_state Geo, UI_Claims_State_Weekly UI
Where Geo.statefips=UI.statefips and
      UI.year = '2020' and
      UI.month = '12' and
      UI.day_endofweek = '26'  
Group by statename order by TotalClaims DESC LIMIT 10;
