import { Component, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { AuthregisterDto } from '../models/dto/auth.dto';
import { AuthService } from '../services/auth.service';
import { PersonaR } from './PersonaR';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {
  PersonaR=new PersonaR("","","","");
  submitted= false;
  hide = true;
  registerDto = new AuthregisterDto();
  constructor(private authService : AuthService) {

   }

  ngOnInit(): void {
  }
  onlogin(){
    this.submitted= true;
    console.log(this.PersonaR);
  }
  email = new FormControl('', [Validators.required, Validators.email]);

  getErrorMessage() {
    if (this.email.hasError('required')) {
      return 'You must enter a value';
    }

    return this.email.hasError('email') ? 'Not a valid email' : '';
  }
  doRegister(){
    this.authService.register(this.registerDto).subscribe(registerResult =>
      alert(`te registraste ${registerResult.token}`)
      )
    
  }


}
