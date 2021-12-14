import { Component, OnInit } from '@angular/core';
import { AngularFireAuth } from '@angular/fire/compat/auth';
import { ListaEESSPrecio, Municipios, ProvinciaListResponse } from 'src/app/models/gasolinera.interface';
import { GasolineraService } from 'src/app/services/gasolinera.service';
import { AngularFirestore } from '@angular/fire/compat/firestore';
import firebase from 'firebase/compat/app';

const COLLECTION_GASO = 'users';

@Component({
  selector: 'app-gasolinera-list',
  templateUrl: './gasolinera-list.component.html',
  styleUrls: ['./gasolinera-list.component.css']
})

export class GasolineraListComponent implements OnInit {

  gasolineraList!: ListaEESSPrecio[];
  allGasolineraList!: ListaEESSPrecio[];
  provinciaList!: ProvinciaListResponse[];
  provinciaName!: string[];
  precioMinimo!: number;
  tipogasofa!: string; 
  municipio!: string;
  localidadesList!: Municipios[];
  mostrar: boolean = false;
  email!: string | null;
 

  constructor(private gasolineraService: GasolineraService, private auth: AngularFireAuth, private firestore: AngularFirestore) { }
  
  ngOnInit(): void {
    this.gasolineraService.getAllGasolineras().subscribe(gasolineras => {
      this.gasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(JSON.stringify(gasolineras));
      this.allGasolineraList = this.gasolineraService.parseAnyToGasolineraListResponse(JSON.stringify(gasolineras));
      console.log(this.gasolineraList)
    })
    this.gasolineraService.getAllProvincias().subscribe(provincias => {
      this.provinciaList = provincias;
      console.log(this.provinciaList)
    })
  }
  filterProvincia(){
    this.gasolineraList = this.allGasolineraList
    if (this.provinciaList.length > 0){
      let provinciasList: ListaEESSPrecio[] = this.gasolineraList.filter(provincia => this.provinciaName.includes(provincia.idProvincia))
      this.gasolineraList = provinciasList;
      this.getMunicipiosById();
    }
  }
  filterDelete(){
    this.gasolineraList = this.allGasolineraList;
    this.mostrar = false;
  }
  filterPrecio(){
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
  getMunicipiosById(){
    this.mostrar = true
    this.gasolineraService.getAllMunicipios(this.provinciaName).subscribe(municipios => {
      this.localidadesList = municipios
      console.log(municipios)
    })
  }
  filterMunicipio(){
    this.gasolineraList = this.allGasolineraList
    this.gasolineraList = this.gasolineraList.filter(gasolinera => this.municipio == gasolinera.municipio)
  }

  googleAuth(){
    this.auth.signInWithPopup(new firebase.auth.GoogleAuthProvider()).then(resp => {
      this.firestore.collection(COLLECTION_GASO).doc(resp?.user?.uid)
      .set({ name: resp.user?.displayName, 
        email: resp.user?.email, 
        photoUrl: resp.user?.photoURL });
      localStorage.setItem('name', resp.user?.displayName? resp.user?.displayName: '');
      localStorage.setItem('photoUrl', resp.user?.photoURL? resp.user?.photoURL: '');
      localStorage.setItem('email', resp.user?.email? resp.user?.email: '');
      localStorage.setItem('uid', resp.user?.uid? resp.user?.uid: '');
    });
  }

  logout() {
    this.auth.signOut();
    localStorage.removeItem('uid')
    localStorage.removeItem('email')
    localStorage.removeItem('name')
    localStorage.removeItem('photoUrl')
  }
  getPhotoUrl(){
    return localStorage.getItem('photoUrl');
  }
  getEmail(){
    return localStorage.getItem('email');
  }
}
