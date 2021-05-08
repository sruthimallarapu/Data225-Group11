DROP TABLE IF EXISTS GeoID_State;
DROP TABLE IF EXISTS Employment_State_Daily;
DROP TABLE IF EXISTS UI_Claims_State_Weekly;
DROP TABLE IF EXISTS Affinity_State_Daily;
DROP TABLE IF EXISTS COVID_State_Daily;
DROP TABLE IF EXISTS Womply_State_Daily;
		
CREATE TABLE GeoID_State(
    statefips INT,
    statename VARCHAR(100),
    stateabbrev CHAR(2),
    state_pop2019 INT
);

CREATE TABLE Employment_State_Daily(
    year int DEFAULT NULL,
    month int DEFAULT NULL,
    day int DEFAULT NULL,
    statefips int DEFAULT NULL,
    emp_combined int DEFAULT NULL,
    emp_combined_inclow int DEFAULT NULL,
    emp_combined_incmiddle int DEFAULT NULL,
    emp_combined_inchigh int DEFAULT NULL,
    emp_combined_ss40 int DEFAULT NULL,
    emp_combined_ss60 int DEFAULT NULL,
    emp_combined_ss65 int DEFAULT NULL,
    emp_combined_ss70 int DEFAULT NULL
);

CREATE TABLE UI_Claims_State_Weekly(
    year int DEFAULT NULL,
    month int DEFAULT NULL,
    day_endofweek int DEFAULT NULL,
    statefips int DEFAULT NULL,
    initclaims_count_regular int DEFAULT NULL,
    contclaims_count_regular int DEFAULT NULL,
    initclaims_count_pua int DEFAULT NULL,
    contclaims_count_pua int DEFAULT NULL,
    contclaims_count_peuc int DEFAULT NULL,
    initclaims_count_combined int DEFAULT NULL,
    contclaims_count_combined int DEFAULT NULL,
    initclaims_rate_regular float DEFAULT NULL,
    contclaims_rate_regular float DEFAULT NULL,
    initclaims_rate_pua int DEFAULT NULL,
    contclaims_rate_pua int DEFAULT NULL,
    contclaims_rate_peuc int DEFAULT NULL,
    initclaims_rate_combined float DEFAULT NULL,
    contclaims_rate_combined float DEFAULT NULL
);

CREATE TABLE Affinity_State_Daily (
    year int DEFAULT NULL,
    month int DEFAULT NULL,
    day int DEFAULT NULL,
    statefips int DEFAULT NULL,
    freq text,
    spend_acf int DEFAULT NULL,
    spend_aer int DEFAULT NULL,
    spend_all int DEFAULT NULL,
    spend_apg int DEFAULT NULL,
    spend_grf int DEFAULT NULL,
    spend_hcs int DEFAULT NULL,
    spend_tws int DEFAULT NULL,
    spend_all_inchigh int DEFAULT NULL,
    spend_all_inclow int DEFAULT NULL,
    spend_all_incmiddle int DEFAULT NULL,
    spend_retail_w_grocery int DEFAULT NULL,
    spend_retail_no_grocery int DEFAULT NULL,
    provisional int DEFAULT NULL
);

CREATE TABLE Covid_State_Daily (
    year int DEFAULT NULL,
    month int DEFAULT NULL,
    day int DEFAULT NULL,
    statefips int DEFAULT NULL,
    new_case_count int DEFAULT NULL,
    new_death_count int DEFAULT NULL,
    new_test_count int DEFAULT NULL,
    vaccine_count int DEFAULT NULL,
    new_vaccine_count int DEFAULT NULL,
    new_case_rate int DEFAULT NULL,
    new_death_rate int DEFAULT NULL,
    new_test_rate int DEFAULT NULL,
    vaccine_rate int DEFAULT NULL,
    new_vaccine_rate int DEFAULT NULL,
    case_count int DEFAULT NULL,
    case_rate int DEFAULT NULL,
    death_count int DEFAULT NULL,
    death_rate int DEFAULT NULL,
    test_count int DEFAULT NULL,
    test_rate int DEFAULT NULL
);

CREATE TABLE Womply_State_Daily(
    year int DEFAULT NULL,
    month int DEFAULT NULL,
    day int DEFAULT NULL,
    statefips int DEFAULT NULL,
    revenue_all int DEFAULT NULL,
    revenue_inchigh int DEFAULT NULL,
    revenue_inclow int DEFAULT NULL,
    revenue_incmiddle int DEFAULT NULL,
    revenue_ss40 int DEFAULT NULL,
    revenue_ss60 int DEFAULT NULL,
    revenue_ss65 int DEFAULT NULL,
    revenue_ss70 int DEFAULT NULL,
    revenue_food_accommodation int DEFAULT NULL,
    revenue_retail int DEFAULT NULL,
    merchants_all int DEFAULT NULL,
    merchants_inchigh int DEFAULT NULL,
    merchants_inclow int DEFAULT NULL,
    merchants_incmiddle int DEFAULT NULL,
    merchants_ss40 int DEFAULT NULL,
    merchants_ss60 int DEFAULT NULL,
    merchants_ss65 int DEFAULT NULL,
    merchants_ss70 int DEFAULT NULL,
    merchants_food_accommodation int DEFAULT NULL,
    merchants_retail int DEFAULT NULL
);
