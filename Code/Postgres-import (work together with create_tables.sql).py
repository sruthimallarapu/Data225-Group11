import sqlalchemy
import psycopg2
from config import DATABASE_URI
from sqlalchemy import create_engine
import os
import pandas as pd
from pandas.io import sql

engine = create_engine(DATABASE_URI)

def read(script_name):
    #script_name = 'create_tables.sql'
    dirname = os.path.dirname(__file__)
    sql_file = os.path.join(dirname, script_name)
    sql = open(sql_file, 'r')
    return sql

geoid_state_data = pd.read_csv('GeoIDs_State.csv')
employment_state_data = pd.read_csv('Employment_State_Daily.csv')
UIClaim_state_data = pd.read_csv('UI_Claims_State_Weekly.csv')
affinity_state_data = pd.read_csv('Affinity_State_Daily.csv')
COIVD_state_data = pd.read_csv('COVID_State_Daily.csv')
Womply_state_data = pd.read_csv('Womply_State_Daily.csv')

try:
    with engine.connect() as con:
        create_table = read("create_tables.sql")
        con.execute(create_table.read())
        print("Table created successfully.")
        geoid_state_data.to_sql(name="GeoID_State", con=con, if_exists='replace')
        employment_state_data.to_sql(name="Employment_State_Daily", con=con, if_exists='replace')
        UIClaim_state_data.to_sql(name="UI_Claims_State_Weekly", con=con, if_exists='replace')
        affinity_state_data.to_sql(name="Affinity_State_Daily", con=con, if_exists='replace')
        COIVD_state_data.to_sql(name="COVID_State_Daily", con=con, if_exists='replace')
        Womply_state_data.to_sql(name="Womply_State_Daily", con=con, if_exists='replace')
        print("Table imported successfully.")

except Exception as e:
    print(e)
