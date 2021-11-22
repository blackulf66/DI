import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { People, PeopleResponse } from '../models/interfaces/people.interface';

@Injectable({
  providedIn: 'root'
})
export class PeopleService {

  constructor(private http: HttpClient) { }

  getPeople(): Observable<PeopleResponse> {
    return this.http.get<PeopleResponse>('https://swapi.dev/api/people/');
  }

  getPersonById(id: string): Observable<People> {
    return this.http.get<People>(`https://swapi.dev/api/people/${id}`);
  }
}
