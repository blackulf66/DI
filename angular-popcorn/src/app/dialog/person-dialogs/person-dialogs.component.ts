import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { PeopleI, PeopleResponse } from 'src/app/models/interfaces/people.interface';
import { PersonService } from 'src/app/services/person.service';
export interface DialogPeopleDetail {
  personId: number;

}
@Component({
  selector: 'app-person-dialogs',
  templateUrl: './person-dialogs.component.html',
  styleUrls: ['./person-dialogs.component.css']
})
export class PersonDialogsComponent implements OnInit {
  people!: PeopleI;
  
  constructor(
    @Inject(MAT_DIALOG_DATA) private data: DialogPeopleDetail,
    private PersonService: PersonService) { }

  ngOnInit(): void {
    this.PersonService.getpersonId(this.data.personId).subscribe(personResult =>{
      this.people = personResult;
    })

  }

}

