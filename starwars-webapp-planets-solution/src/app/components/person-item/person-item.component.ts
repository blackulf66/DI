import { Component, Input, OnInit } from '@angular/core';
import { People } from 'src/app/models/interfaces/people.interface';

@Component({
  selector: 'app-person-item',
  templateUrl: './person-item.component.html',
  styleUrls: ['./person-item.component.css']
})
export class PersonItemComponent implements OnInit {
  @Input() personInput!: People;
  constructor() { }

  ngOnInit(): void {
  }
  getPeopleId(url: string) {
    let urlParts = url.split('/');
    let id = urlParts[5];
    return id;
  }

}
