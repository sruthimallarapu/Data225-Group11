Use project;
Select statename, SUM(UI.initclaims_count_combined + UI.contclaims_count_combined) TotalClaims
from GeoIDs_state Geo, UI_Claims_State_Weekly UI
Where Geo.statefips=UI.statefips and
      UI.year = '2020' and
      UI.month = '12' and
      UI.day_endofweek = '26'  
Group by statename order by TotalClaims DESC LIMIT 10;

