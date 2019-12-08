from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.decorators import api_view
import mysql.connector


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

    return HttpResponse()


# Create your views here.
