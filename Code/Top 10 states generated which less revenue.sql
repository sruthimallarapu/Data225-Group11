USE project;
SELECT year, statename, round(AVG(revenue_all),3)*100 AS avg_revenue
FROM 
womply_state_daily , geoid_state
WHERE
womply_state_daily.statefips = geoid_state.statefips AND
year = 2020 
GROUP BY year, statename ORDER BY avg_revenue LIMIT 10

SELECT year, statename, round(AVG(revenue_all),3)*100 AS avg_revenue
FROM 
womply_state_daily , geoid_state
WHERE
womply_state_daily.statefips = geoid_state.statefips AND
year = 2021 
GROUP BY year, statename ORDER BY avg_revenue LIMIT 10
