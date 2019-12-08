import { Component, OnInit } from '@angular/core';
import { HomeService } from 'src/app/services/home.service';
import { Tickets } from 'src/app/models/tickets';
import { Flights } from 'src/app/models/flights';


@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  bookTicket: Tickets;
  flightList: Flights[];
  constructor(homeService: HomeService) {
    this.bookTicket = homeService.getTicket();
    this.flightList = homeService.getFlightList();
    console.log(this.flightList)
   }
   
   bookFlight(flight:any){
     console.log(flight)
     
   }
  ngOnInit() {
  }

}
