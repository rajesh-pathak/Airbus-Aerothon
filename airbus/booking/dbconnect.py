import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  database='db1',
  user="root",
  passwd="admin"
)