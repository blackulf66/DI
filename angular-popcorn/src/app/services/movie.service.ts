import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

const movieBaseUrl = `${environment.apiBaseUrl}/movie`;

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  constructor(private http: HttpClient) { }

  getMovieList() {
    let url = `${movieBaseUrl}/popular?api_key=${environment.apiKey}`;
  }
 
}


