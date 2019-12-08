import { NumberSymbol } from "@angular/common";

export class Flights {
    public acId: number;
    public acNumber: number;
    public acName: String;
    public acType: String;
    public acMfgOn: Date;
    public acCapacity: number;
    public acFrom: String;
    public acTo: String;
    public acFromDateTime: String;
    public acToDateTime: String;
    

    constructor(acNumber:number,acFromDateTime:String,acToDateTime:String,acCapicity:number){
        this.acCapacity=acCapicity;
        this.acFromDateTime=acFromDateTime;
        this.acToDateTime=acToDateTime;
        this.acNumber=acNumber;

    }

}
