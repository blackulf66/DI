import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { Persona } from './Persona';

@Component({
  selector: 'app-formulario',
  templateUrl: './formulario.component.html',
  styleUrls: ['./formulario.component.css']
  
})

export class FormularioComponent implements OnInit {

  Persona=new Persona("","");
  submitted= false;
  hide = true;

  constructor() {}

  ngOnInit(): void {
  }
  
  onlogin(){
    this.submitted= true;
    console.log(this.Persona);
  }
  email = new FormControl('', [Validators.required, Validators.email]);

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'You must enter a value';
    }

    return this.email.hasError('email') ? 'Not a valid email' : '';
  }


}
