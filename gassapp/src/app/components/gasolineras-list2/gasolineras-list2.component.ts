import { Component, OnInit } from '@angular/core';
import ListaFirebaseDto from 'src/app/models/listas-firebase.dto';
import { ListasFirebaseService } from 'src/app/services/listas-firebase.service';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-gasolineras-list2',
  templateUrl: './gasolineras-list2.component.html',
  styleUrls: ['./gasolineras-list2.component.css']
})
export class GasolinerasList2Component implements OnInit {
  listasList!: ListaFirebaseDto[];

  constructor(private listasFirebaseService: ListasFirebaseService) { }

  ngOnInit(): void {
    this.getAllLists();
  }

  getAllLists(): void {
    this.listasFirebaseService.getAll().snapshotChanges().pipe(
      map(changes =>
        changes.map(c =>
          ({ id: c.payload.doc.id, ...c.payload.doc.data() })
        )
      )
    ).subscribe(data => {
      this.listasList = data;
    });
  }

}

