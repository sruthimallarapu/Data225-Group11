#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 12 12:10:00 2021

@author: sruthimallarapu
"""
import os
import pandas as pd
import mysql.connector
from getpass import getpass
from mysql.connector import connect, Error
import numpy as np
from sqlalchemy import create_engine, types

####loading the data #######
os.chdir(r"/Users/sruthimallarapu/Documents/Sruthi/Data225-DBsystems/Project/EconomicTracker-main-2/data")

Affinity_states = pd.read_csv("Affinity - State - Daily.csv")
Geo_loc = pd.read_csv("GeoIDs - State.csv")

####Create table
AFFINITY_STATES_TABLE ="""CREATE TABLE affinity_states(
year int DEFAULT NULL,
  month int DEFAULT NULL,
  day int DEFAULT NULL,
  statefips int DEFAULT NULL,
  spend_acf float DEFAULT NULL,
  spend_aer float DEFAULT NULL,
  spend_all float DEFAULT NULL,
  spend_apg float DEFAULT NULL,
  spend_grf float DEFAULT NULL,
  spend_hcs float DEFAULT NULL,
  spend_tws float DEFAULT NULL,
  spend_all_inchigh float DEFAULT NULL,
  spend_all_inclow float DEFAULT NULL,
  spend_all_incmiddle float DEFAULT NULL,
  spend_retail_w_grocery float DEFAULT NULL,
  spend_retail_no_grocery float DEFAULT NULL)"""


####Create table
GEOGRAPHY_TABLE ="""CREATE TABLE geoids_state (
  statefips int DEFAULT NULL,
  statename text,
  stateabbrev text,
  state_pop2019 int DEFAULT NULL)"""


INSERT_COMM="""
INSERT INTO affinity_states VALUES (%s, %s, %s, %s, %s, %s,%s, %s, %s, %s, %s, %s,%s, %s, %s, %s)
""" 

INSERT_COMM_STATE="""
INSERT INTO geoids_state VALUES (%s, %s, %s, %s)
""" 

####replacing nulls
Affinity_states_cleaned= Affinity_states.replace('.',0)


###Changing the datatypes
Affinity_states_cleaned.spend_acf = Affinity_states_cleaned.spend_acf.astype(float)
Affinity_states_cleaned.spend_aer = Affinity_states_cleaned.spend_aer.astype(float)
Affinity_states_cleaned.spend_all = Affinity_states_cleaned.spend_all.astype(float)
Affinity_states_cleaned.spend_apg = Affinity_states_cleaned.spend_apg.astype(float)
Affinity_states_cleaned.spend_grf = Affinity_states_cleaned.spend_grf.astype(float)
Affinity_states_cleaned.spend_hcs = Affinity_states_cleaned.spend_hcs.astype(float)
Affinity_states_cleaned.spend_tws = Affinity_states_cleaned.spend_tws.astype(float)
Affinity_states_cleaned.spend_all_inchigh = Affinity_states_cleaned.spend_all_inchigh.astype(float)
Affinity_states_cleaned.spend_all_incmiddle = Affinity_states_cleaned.spend_all_incmiddle.astype(float)
Affinity_states_cleaned.spend_retail_w_grocery = Affinity_states_cleaned.spend_retail_w_grocery.astype(float)
Affinity_states_cleaned.spend_retail_no_grocery = Affinity_states_cleaned.spend_retail_no_grocery.astype(float)
Affinity_states_cleaned.spend_all_inclow = Affinity_states_cleaned.spend_all_inclow.astype(float)

##subsetting the columns
Affinity_states_cleaned= Affinity_states_cleaned.drop(columns=['provisional','freq'])

####Insert data into Mysql
try:
     with connect(host='localhost',
                  user=input('Enter Username:'),
                  password=getpass("Enter Password:"),
                  ) as connection:
         with connection.cursor() as cursor:
            cursor.execute("DROP schema IF exists Project225")
            cursor.execute("create schema Project225")
            cursor.execute("use Project225")
            cursor.execute("DROP TABLE IF exists affinity_states")
            cursor.execute("DROP TABLE IF exists geoids_state")
            cursor.execute(AFFINITY_STATES_TABLE )
            cursor.execute(GEOGRAPHY_TABLE)
             ###Create table
             
             #INSERT
            print("Insert data..")
            cursor.executemany(INSERT_COMM, Affinity_states_cleaned.values.tolist())
            cursor.executemany(INSERT_COMM_STATE, Geo_loc.values.tolist())
            connection.commit()
except Error as e:
    print(e)

Affinity_states_cleaned.to_csv('Affinity_states_cleaned.csv',index=False  )