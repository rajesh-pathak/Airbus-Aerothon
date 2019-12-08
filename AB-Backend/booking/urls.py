from django.urls import path
from . import views

urlpatterns = [
    path('home/', views.home, name='home'),
    path('checkFlight/',views.search_flights, name = "search_flights"),
]