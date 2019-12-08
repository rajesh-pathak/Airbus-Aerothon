from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.decorators import api_view
import mysql.connector


mydb = mysql.connector.connect(
  host="localhost",
  database='db1',
  user="root",
  passwd="admin"
)

mycursor = mydb.cursor()

def home(request):
    print('Hello world')
    return HttpResponse("Hello")


@api_view(['GET','POST'])
def search_flights(request):
    req_data = req_data['data']
    bookingDate = req_data['bookingDate']
    departure = req_data['from']
    arrival = req_data['to']
    seats = req_data['numSeats']
    travelClass = req_data['travelClass']
    print(bookingDate)

    query = "select * from flightschedule where flightdate='%s' and aircraft in (select acID where acNumber in %s ) ",(bookingDate,travelClass)
    response = mycursor.execute().fetchall()
    return HttpResponse(response)


@api_view(['GET','POST'])
def book_ticket(request):
    req_data = req_data['data']
    bookingDate = req_data['bookingDate']
    departure = req_data['from']
    arrival = req_data['to']
    seats = req_data['numSeats']
    travelClass = req_data['travelClass']

    passenger = req_data['passenger']
    flights = req_data['flight']
    ctype = req_data['type']
    seats = req_data['seats']
    employee = req_data['employee']
    charges = req_data['charges']

    query ="insert into transactions (booking_date,departure_date,passenger,flight,type,seats,employee,charges,discount,total) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(bookingDate,passenger,flight,btype,seats,employee,charges,discount,total)

    response = mycursor.execute()
    return HttpResponse(response)

# Create your views here.
