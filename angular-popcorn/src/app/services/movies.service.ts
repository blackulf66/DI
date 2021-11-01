import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { MovieResponse } from '../models/interfaces/movie.interface';
import { MoviesPopularResponse } from '../models/interfaces/movies-popular.interface';

const movieUrl = `${environment.apiBaseUrl}/movie`;


@Injectable({
  providedIn: 'root'
})

export class MoviesService {

  constructor(private http: HttpClient) { }

  getMovieId(id: number): Observable<MovieResponse>{
    return this.http.get<MovieResponse>(`${environment.apiBaseUrl}/movie/${id}?api_key=${environment.apiKey}`)
  }
  getPopularMovies(): Observable<MoviesPopularResponse> {
    return this.http.get<MoviesPopularResponse>(`${movieUrl}/popular?api_key=${environment.apiKey}&language=${environment.defaultLang}`);
  }
  getMovie():Observable<MovieResponse>{
    return this.http.get<MovieResponse>(`${environment.apiBaseUrl}/movie/?api_key=${environment.apiKey}`)
  }
}
