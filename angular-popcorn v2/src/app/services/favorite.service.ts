import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { FavoriteDto, FavoriteListResponse} from '../models/interfaces/favorito.interface';
import { ListaResponse } from '../models/interfaces/lists.inteface';

const DEFAULT_HEADERS = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json;charset=utf-8'

  })
};

@Injectable({
  providedIn: 'root'
})
export class FavoriteService {

  constructor(private http: HttpClient) { }

  addToFavorite(favoriteDto: FavoriteDto): Observable<ListaResponse>{
    return this.http.post<ListaResponse>(`${environment.apiBaseUrl}/account/null/favorite?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`,
    favoriteDto)
  }

  getFavoriteList(): Observable <FavoriteListResponse>{
    return this.http.get<FavoriteListResponse>(`${environment.apiBaseUrl}/account/null/favorite/movies?api_key=${environment.apiKey}&language=${environment.defaultLang}&sort_by=created_at.asc&page=1&session_id=${localStorage.getItem('session_id')}`)
  }
}