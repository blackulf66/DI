import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { GasolineraDetailDialogComponent } from 'src/app/dialogs/gasolinera-detail-dialog/gasolinera-detail-dialog.component';
import { ListaEESSPrecio } from 'src/app/models/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import { GasolineraListComponent } from 'src/app/components/gasolinera-list/gasolinera-list.component';

const COLLECTION_FAV = 'gasAppFavorite'

@Component({
  selector: 'app-gasolinera-item',
  templateUrl: './gasolinera-item.component.html',
  styleUrls: ['./gasolinera-item.component.css']
})
export class GasolineraItemComponent implements OnInit {

  @Input() gasolineraInput!: ListaEESSPrecio;

  constructor(private matDialog: MatDialog, private gasolineraService: GasolineraService, private firebase: AngularFirestore, private googleauth: GasolineraListComponent) { }

  ngOnInit(): void {
    
  }
  openDialogGasolineraDetail(){
    this.matDialog.open(GasolineraDetailDialogComponent,{
      width: "500px",
      height: "500px",
      data:{
        gasolinera: this.gasolineraInput
      }
    })
  }
  getGoogleMaps(direccion:String){
    this.gasolineraService.getGoogleMaps(direccion.replace(' ', '+'));
  }
  addFavorite(gasolinera: ListaEESSPrecio){

    if(localStorage.getItem('uid') == null){
      this.googleauth.googleAuth();
    }else{
      this.firebase.collection(COLLECTION_FAV).doc(gasolinera.ideess).set(
        {direccion: gasolinera.direccion,
        provincia: gasolinera.provincia,
        idProvincia: gasolinera.idProvincia,
        rotulo: gasolinera.rotulo,
        ideess: gasolinera.ideess}
      )
    }
  }
  deleteFavorite(gasolinera: ListaEESSPrecio){
    this.firebase.collection(COLLECTION_FAV).doc(gasolinera.ideess).delete();
  }
}
