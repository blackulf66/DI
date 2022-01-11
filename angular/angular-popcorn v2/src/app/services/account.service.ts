import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ListaResponse } from '../models/interfaces/lists.inteface';

@Injectable({
  providedIn: 'root'
})
export class ListaResponseService {

  constructor(private http: HttpClient) { }

  getCreatedList(): Observable<ListaResponse>{
    return this.http.get<ListaResponse>(`${environment.apiBaseUrl}/account/null/lists?api_key=${environment.apiKey}&language=${environment.defaultLang}&page=1&session_id=${localStorage.getItem('session_id')}`)
  }
}
