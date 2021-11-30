import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';

export interface DialogDetailData{
  gasolinera: ListaEESSPrecio;
}
@Component({
  selector: 'app-dialog-details',
  templateUrl: './dialog-details.component.html',
  styleUrls: ['./dialog-details.component.css']
})
export class DialogDetailsComponent implements OnInit {
  gasolinera !: ListaEESSPrecio;

  constructor(
    @Inject(MAT_DIALOG_DATA)
    private data: DialogDetailData) { }

  ngOnInit(): void {
    this.gasolinera = this.data.gasolinera;

  }

}
