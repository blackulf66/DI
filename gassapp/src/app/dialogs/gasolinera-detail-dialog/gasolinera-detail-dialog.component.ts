import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ListaEESSPrecio } from 'src/app/models/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

export interface gasolineraDetail{
  gasolinera: ListaEESSPrecio;
}

@Component({
  selector: 'app-gasolinera-detail-dialog',
  templateUrl: './gasolinera-detail-dialog.component.html',
  styleUrls: ['./gasolinera-detail-dialog.component.css']
})
export class GasolineraDetailDialogComponent implements OnInit {

  constructor(@Inject(MAT_DIALOG_DATA) private data: gasolineraDetail, private gasolineraService: GasolineraService) { }

  gasolinera!: ListaEESSPrecio;
  
  ngOnInit(): void {
    this.gasolinera = this.data.gasolinera
  }

}
