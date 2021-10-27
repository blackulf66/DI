import { Component, OnInit } from '@angular/core';
import { Person } from 'src/app/models/interfaces/person-pupolar.interface';
import { PersonService } from 'src/app/services/person.service';

@Component({
  selector: 'app-person-popular-list',
  templateUrl: './person-popular-list.component.html',
  styleUrls: ['./person-popular-list.component.css']
})
export class PersonPopularListComponent implements OnInit {

  popularPerson: Person[] = [];

  constructor(private personService: PersonService) { }

  ngOnInit(): void {
    this.personService.getPopularPerson().subscribe(popularPersonResponse => {
      this.popularPerson = popularPersonResponse.results;
    });
  }

}
