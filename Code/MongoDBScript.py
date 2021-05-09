#import CSV files to MONGO DB using MongoClient
import pandas as pd
import pymongo
import json

#Connect to MongoDB local Client
client = pymongo.MongoClient("mongodb://localhost:27017")

#Read CSV file into dataframe
df1 = pd.read_csv("GeoIDs_State.csv")

#Convert CSV file to Dictionary format to insert into collection 
GeoIDs_State = df1.to_dict(orient = "records")

#Create Database "Data225"
db = client["Data225"]

#Create collection GeoIDs_State and insert dictionary values into collection using insert_many
db.GeoIDs_State.insert_many(GeoIDs_State)

#Create collection GeoIDs_City and insert dictionary values into collection using insert_many
df2 = pd.read_csv("GeoIDs_City.csv")
Covid_State = df2.to_dict(orient = "records")
db.GeoIDs_City.insert_many(Covid_State)

#Create collection Covid_State and insert dictionary values into collection using insert_many
df3 = pd.read_csv("Covid_State.csv")
Covid_State = df3.to_dict(orient = "records")
db.Covid_State.insert_many(Covid_State)

#Create collection Covid_City and insert dictionary values into collection using insert_many
df4 = pd.read_csv("Covid_City.csv")
Covid_City = df4.to_dict(orient = "records")
db.Covid_City.insert_many(Covid_City)

