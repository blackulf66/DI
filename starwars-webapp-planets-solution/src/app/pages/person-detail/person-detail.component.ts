import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { People } from 'src/app/models/interfaces/people.interface';
import { PeopleService } from 'src/app/services/people.service';

@Component({
  selector: 'app-person-detail',
  templateUrl: './person-detail.component.html',
  styleUrls: ['./person-detail.component.css']
})
export class PersonDetailComponent implements OnInit {
  id!: string;
  people!: People;

  constructor(private activeRoute: ActivatedRoute,
    private peopleService: PeopleService) { }

  ngOnInit(): void {
    this.activeRoute.params.subscribe(parametros => {
      this.id = parametros['idPerson'];
      this.peopleService.getPersonById(this.id).subscribe(persona => {
        this.people = persona;
      });
    });
  }

}