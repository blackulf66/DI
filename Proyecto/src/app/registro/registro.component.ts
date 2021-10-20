import { Component, OnInit } from '@angular/core';
import { AuthregisterDto } from '../models/dto/auth.dto';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {
  hide = true;
  registerDto = new AuthregisterDto();
  constructor(private authService : AuthService) {}

  ngOnInit(): void {
  }

  doRegister(){
    console.log(this.registerDto);
    this.authService.register(this.registerDto).subscribe(registerResult => {
      alert(`te registraste ${registerResult.token}`);
    });
  }


}
