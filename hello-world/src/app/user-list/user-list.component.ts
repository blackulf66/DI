import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css']
})
export class UserListComponent implements OnInit {
  title = '';
  subtitle = 'byebye';
  counter = 0;

  constructor() { }

  ngOnInit(): void {
    this.title = 'valor de contador';
  }

  onCounterAddClick(){
    console.log('El boton add ha sido usado')
    if (this.counter <= 19) {
      this.counter++
    } else {
      this.counter
    }
    
  }
  onCounterRemoveClick(){
    console.log('El boton remove ha sido usado')
    if (this.counter >= 1) {
      this.counter--
    } else {
      this.counter
    }
    
    
  }

}
