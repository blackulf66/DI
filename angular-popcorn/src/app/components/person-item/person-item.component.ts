import { Component, Input, OnInit } from '@angular/core';
import { Person } from 'src/app/models/interfaces/person-popular.interface';
import { environment } from 'src/environments/environment';
import { MatDialog } from '@angular/material/dialog';
import { PersonDialogsComponent } from 'src/app/dialog/person-dialogs/person-dialogs.component';


@Component({
  selector: 'app-person-item',
  templateUrl: './person-item.component.html',
  styleUrls: ['./person-item.component.css']
})
export class PersonItemComponent implements OnInit {

  @Input() PersonInput!: Person;
  

  constructor(private dialog: MatDialog) { }

  ngOnInit(): void {
  }

  getPersonImageUrl(Person: Person) {
    return `${environment.imagePersonUrl}${Person.profile_path}`;
  }

  openPersonDetailDialog(){
    this.dialog.open(PersonDialogsComponent, {
        height:'400px',
        width:'300px',
        data: {personId: this.PersonInput?.id}
      })
  }

  

}

