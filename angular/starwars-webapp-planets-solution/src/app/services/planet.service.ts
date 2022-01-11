import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Planet, PlanetResponse } from '../models/interfaces/planet.interface';

@Injectable({
  providedIn: 'root'
})
export class PlanetService {

  constructor(private http: HttpClient) { }

  getPlanets(): Observable<PlanetResponse> {
    return this.http.get<PlanetResponse>('https://swapi.dev/api/planets/');
  }

  getPlanetById(id: string): Observable<Planet> {
    return this.http.get<Planet>(`https://swapi.dev/api/planets/${id}`);
  }
}
