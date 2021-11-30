import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
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
  provinciaName!: String[];
  precioMinimo!: number;
  tipocarburante!: ListaEESSPrecio;
  tipogasofa!: String;

  

  constructor(private gasolineraService: GasolineraService) { }

  ngOnInit(): void {
    this.gasolineraService.getGasolineras().subscribe(g => {
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(JSON.stringify(g));
      this.allGasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(JSON.stringify(g));
  
    })
    this.gasolineraService.getTodasProvincias().subscribe(p => {
      this.provinciaList = p;
     
    })
  }
  filterprovincia(){
    this.gasolineraList = this.allGasolineraList
    if (this.provinciaList.length > 0){
      let provinciasList: ListaEESSPrecio[] = this.gasolineraList.filter(p => this.provinciaName.includes(p.idProvincia))
      this.gasolineraList = provinciasList;
      console.log(this.gasolineraList)
    }
  }
  
    filtrarPrecio(){
      this.gasolineraList = this.allGasolineraList
      if(this.tipogasofa.includes('precioGasoleoA')){
      let gasolineraPrecios: ListaEESSPrecio[] = this.gasolineraList.filter(p => this.precioMinimo < Number.parseFloat(p.precioGasoleoA.replace(',','.')))
      this.gasolineraList = gasolineraPrecios;
      }else if(this.tipogasofa.includes('precioGasolina95E9')){
      let gasolineraPrecios: ListaEESSPrecio[] = this.gasolineraList.filter(p => this.precioMinimo < Number.parseFloat(p.precioGasolina95E5.replace(',','.')))
      this.gasolineraList = gasolineraPrecios;
      }else{
      let gasolineraPrecios: ListaEESSPrecio[] = this.gasolineraList.filter(p => this.precioMinimo < Number.parseFloat(p.precioGasolina98E5.replace(',','.')))
      this.gasolineraList = gasolineraPrecios;
    }
  }
  removeAllFilter(){
    this.gasolineraList = this.allGasolineraList
    }
}
