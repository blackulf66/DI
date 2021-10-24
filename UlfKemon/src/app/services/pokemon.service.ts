import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Pokemon, PokemonListResponse } from '../interfaces/pokemon-list.interface';

const API_URL = "https://pokeapi.co/api/v2"

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  constructor(private http: HttpClient) { }

  
  getPokemonList(limit: number):Observable<PokemonListResponse>{
    return this.http.get<PokemonListResponse>(`${API_URL}/pokemon?limit=${limit}`);
  }
  getPokemon(name: string):Observable<Pokemon>{
    return this.http.get<Pokemon>(`${API_URL}/pokemon/${name}`);
  }
}
