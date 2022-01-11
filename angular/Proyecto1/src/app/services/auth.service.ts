import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthregisterDto } from '../models/dto/auth.dto';
import { AuthregisterResponse } from '../models/interface/auth.interface';

const AUTH_BASE_URL = 'auth';
const DEFAULT_HEADER = {
  headers : new HttpHeaders({
    'Content-type':'application/json'
  })

};

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  
  authBaseUrl = `${environment.apiBaseUrl}/${AUTH_BASE_URL}`;

   constructor(private http: HttpClient) { }
  

   register(registerDto:AuthregisterDto): Observable<AuthregisterResponse> {
    let requestUrl = `${this.authBaseUrl}/signup`;
    return this.http.post<AuthregisterResponse>(requestUrl, registerDto, DEFAULT_HEADER)
  }
}


