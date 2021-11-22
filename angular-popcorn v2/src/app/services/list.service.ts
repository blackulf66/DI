import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ListResponse } from '../models/interfaces/auth.interface';


@Injectable({
  providedIn: 'root'
})
export class ListService {

  constructor(private http: HttpClient) { }

  addToPlaylist(idList: number, idMovie: number): Observable<ListResponse>{
    return this.http.post<ListResponse>(`${environment.apiBaseUrl}/list/${idList}/add_item?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`,
     { media_id : idMovie})
  }
  createPlaylist(name: string, description: string , language: string): Observable<ListResponse>{
    return this.http.post<ListResponse>(`${environment.apiBaseUrl}/list?api_key=${environment.apiKey}&session_id=${localStorage.getItem('session_id')}`,
     { name: name,
     description: description,
     language: language})

  }
}
