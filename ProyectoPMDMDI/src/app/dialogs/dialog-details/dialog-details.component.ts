import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

export interface DialogGasolineraDetailData{
  gasolineraName: number;
}
@Component({
  selector: 'app-dialog-details',
  templateUrl: './dialog-details.component.html',
  styleUrls: ['./dialog-details.component.css']
})

export class DialogDetailsComponent implements OnInit {

  listaEESSPrecio !: ListaEESSPrecio;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: DialogGasolineraDetailData,
    private gasolineraService: GasolineraService) { }

  ngOnInit(): void {
    this.gasolineraService.getgasolinera(this.data.gasolineraName).subscribe(r => {
      this.listaEESSPrecio = r;
    })
  }

}
