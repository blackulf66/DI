import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogDetailsComponent } from 'src/app/dialogs/dialog-details/dialog-details.component';
import { ListaEESSPrecio } from 'src/app/models/interfaces/gasolineras.interface';

@Component({
  selector: 'app-gasolinera-item',
  templateUrl: './gasolinera-item.component.html',
  styleUrls: ['./gasolinera-item.component.css']
})
export class GasolineraItemComponent implements OnInit {

  @Input() gasolineraInput!: ListaEESSPrecio;
  
  constructor(private dialog: MatDialog) { }

  ngOnInit(): void {
  }
  
  openDialogGasolineraDetail() {
    this.dialog.open(DialogDetailsComponent,{
      height: 'auto',
      width: 'auto',
      data:{gasolinera:this.gasolineraInput}
    });
  }


}
