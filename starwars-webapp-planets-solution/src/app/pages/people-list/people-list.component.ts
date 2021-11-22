import { Component, OnInit } from '@angular/core';
import { People } from 'src/app/models/interfaces/people.interface';
import { PeopleService } from 'src/app/services/people.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrls: ['./people-list.component.css']
})
export class PeopleListComponent implements OnInit {
  peopleList: People[] = [];

  constructor(private peopleService: PeopleService) { }

  ngOnInit(): void {
    this.peopleService.getPeople().subscribe(people => {
      this.peopleList = people.results;
    });
  }
}