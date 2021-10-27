import { Component, Input, OnInit } from '@angular/core';
import { Person } from 'src/app/models/interfaces/person-pupolar.interface';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-person-item',
  templateUrl: './person-item.component.html',
  styleUrls: ['./person-item.component.css']
})
export class PersonItemComponent implements OnInit {

  @Input() PersonInput!: Person;

  constructor() { }

  ngOnInit(): void {
  }

  getPersonImageUrl(Person: Person) {
    return `${environment.imagePersonUrl}${Person.profile_path}`;
  }

}

