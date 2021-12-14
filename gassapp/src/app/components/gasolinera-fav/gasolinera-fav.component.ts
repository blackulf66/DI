import { Component, OnInit } from '@angular/core';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import { Observable } from 'rxjs';
import { GasolineraFav } from 'src/app/models/gasolineraFav.interface';

const COLLECTION_FAV = 'gasAppFavorite'



@Component({
  selector: 'app-gasolinera-fav',
  templateUrl: './gasolinera-fav.component.html',
  styleUrls: ['./gasolinera-fav.component.css']
})
export class GasolineraFavComponent implements OnInit {

  constructor(private firebase: AngularFirestore) { }

  gasolineraFavList!: Observable<GasolineraFav[]>;

  ngOnInit(): void {
    this.getGasolineraFav();
  }
  getGasolineraFav(){
    this.gasolineraFavList = this.firebase.collection<GasolineraFav>(COLLECTION_FAV).valueChanges();
  }
  deleteFavorite(gasolinera: GasolineraFav){
    this.firebase.collection(COLLECTION_FAV).doc(gasolinera.ideess).delete();
  }

}
