import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { ListaResponse, Lista } from '../models/interfaces/lists.inteface';

const movieUrl = `${environment.apiBaseUrl}/`;

@Injectable({
  providedIn: 'root'
})
export class PlaylistService {

  constructor(private http: HttpClient) { }

  addLista(id_movie:number): Observable<ListaResponse> {
    return this.http.post<ListaResponse>(`${movieUrl}/list${id_movie}?api_key=${environment.apiKey}`,
    {media_id:id_movie}

    );
  }
  getLista(): Observable<ListaResponse>{
    return this.http.get<ListaResponse>(`${movieUrl}/list/?api_key=${environment.apiKey}&session_id=6b6340c632f6f89d0f87a632d2390b9cf3775789`);
  }
}