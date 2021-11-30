import { Component, OnInit } from '@angular/core';
import { ListaEESSPrecio, ProvinciaListResponse } from 'src/app/models/interfaces/gasolineras.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

@Component({
  selector: 'app-gasolinera-list',
  templateUrl: './gasolinera-list.component.html',
  styleUrls: ['./gasolinera-list.component.css']
})
export class GasolineraListComponent implements OnInit {
  gasolineraList: ListaEESSPrecio[] = [];
  allGasolineraList : ListaEESSPrecio[] =[];
  provinciaList!: ProvinciaListResponse[];
  provinciaName!: string[];

  constructor(private gasolineraService: GasolineraService) { }

  ngOnInit(): void {
    this.gasolineraService.getGasolineras().subscribe(resp => {
      console.log(resp);
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(JSON.stringify(resp));
      this.allGasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(JSON.stringify(resp));
    });
    this.gasolineraService.getTodasProvincias().subscribe(p =>{
      this.provinciaList = p;
    })
  }
  filterprovincia(){
   this.gasolineraList = this.allGasolineraList
   if(this.provinciaList.length > 0){
   
     let provinciasList: ListaEESSPrecio[] = this.gasolineraList.filter(p => this.provinciaName.includes(p.idProvincia))
     this.gasolineraList = provinciasList;
  
   }
    }

}
