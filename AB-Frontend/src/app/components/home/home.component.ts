import { Component, OnInit } from '@angular/core';
import { Flights } from 'src/app/models/flights';
import { Tickets } from 'src/app/models/tickets';
import { HomeService } from 'src/app/services/home.service';
import { RouterLinkWithHref, RouterModule, Router } from '@angular/router';
import { ThrowStmt } from '@angular/compiler';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  roundTrip:boolean;
  tripType:String;
  
  constructor(public homeService: HomeService, public router:Router) { 
    this.bookTicket=new Tickets();
    this.roundTrip=false;
    this.bookTicket.type="oneway"
  }
  flight: Flights;
  bookTicket: Tickets;
  ngOnInit() {  
  }

  bookFlight(){
    console.log(this.bookTicket);
    if(this.bookTicket.bookingDate>this.bookTicket.departureDate){
      console.log("From Date should be before To");
    }
    else{
      this.bookTicket.numSeats
      this.homeService.checkFlight(this.bookTicket);
      this.homeService.checkSeat();
      this.homeService.bookTicket();
      this.router.navigateByUrl("/search");
    }
  }
  tripTypeSelector(type:String){
    if(type=='oneway'){
      this.roundTrip=false;
      
    }
    else if(type=='roundtrip'){
      this.roundTrip=true;
      
    }
    this.bookTicket.type=type;
    console.log(type+" "+this.roundTrip);
  }

}
