import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Genre, GenreList } from '../models/interfaces/genre.interface';
import { Movie, MoviesPopularResponse } from '../models/interfaces/movies-popular.interface';

const movieUrl = `${environment.apiBaseUrl}`;


@Injectable({
  providedIn: 'root'
})
export class MoviesService {

  constructor(private http: HttpClient) { }

  getPopularMovies(): Observable<MoviesPopularResponse> {
    return this.http.get<MoviesPopularResponse>(`${movieUrl}/movie/popular?api_key=${environment.apiKey}`);
  }

  getMovie(id: number): Observable<Movie>{
    return this.http.get<Movie>(`${movieUrl}/movie/${id}?api_key=${environment.apiKey}`);
  }

  getGenreList(): Observable<GenreList>{
    return this.http.get<GenreList>(`${movieUrl}/genre/movie/list?api_key=${environment.apiKey}`);
  }

}
