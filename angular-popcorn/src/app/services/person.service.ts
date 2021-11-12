import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { PeopleI, PeopleResponse } from '../models/interfaces/people.interface';
import { PersonPopularResponse } from '../models/interfaces/person-popular.interface';


const PersonUrl = `${environment.apiBaseUrl}/person`;

@Injectable({
  providedIn: 'root'
})
export class PersonService {

  constructor(private http: HttpClient) { }

  getPopularPerson(): Observable<PersonPopularResponse> {
    return this.http.get<PersonPopularResponse>(`${PersonUrl}/popular?api_key=${environment.apiKey}&language=${environment}`);
  }
  getPerson(id: string): Observable<PeopleResponse> {
    return this.http.get<PeopleResponse>(`${PersonUrl}/${id}?api_key=${environment.apiKey}&language=${environment.defaultLang}`)

  }
  getpersonId(id: number): Observable<PeopleI>{
    return this.http.get<PeopleI>(`${environment.apiBaseUrl}/person/${id}?api_key=${environment.apiKey}`)
  }
}
