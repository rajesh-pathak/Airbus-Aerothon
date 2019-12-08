import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Tickets } from '../models/tickets';
import { Flights } from '../models/flights';
import {Observable} from 'rxjs'
import {map} from 'rxjs/operators';


@Injectable({ 
  providedIn: 'root'
})
export class HomeService {
  
  tempFL =[];
  constructor(public http: HttpClient) { }
  public baseURL = "http://100.82.192.8:8000";
  public seats: number;
  public flightList: any;
  public bookTicket1:Tickets;
  checkFlight(tickets: Tickets):any{
    this.bookTicket1=tickets
    this.tempFL.push(new Flights(1234,"Wed: 12:04","Wed:13:10",10));
    
    console.log(this.baseURL+"/checkFlight");
    return this.http.post(this.baseURL+"/checkFlight",tickets).subscribe(
      data=>{
        this.flightList=data;
      }
    );
  }
  checkSeat(){
    
  }

  bookTicket(){
    
  }
  getTicket(){
    if(this.bookTicket1!=null){
      return this.bookTicket1;
    }
  }
  getFlightList(){
     return this.tempFL;
  }
}
