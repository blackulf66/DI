import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { GasolinerasListResponse, ListaEESSPrecio, ProvinciaListResponse } from '../models/interfaces/gasolineras.interface';

@Injectable({
  providedIn: 'root'
})
export class GasolineraService {

  constructor(private http: HttpClient) { }

  getGasolineras(): Observable<any> {
    return this.http.get<any>('../assets/response.json');
  }

  getgasolinera(id: number): Observable<ListaEESSPrecio>{
    return this.http.get<ListaEESSPrecio>(`../assets/response.json`);
  }

  parseAnyToGasolineraListResponse(jsonString: string){
    let jsonStringReplaced = jsonString.replace(/Precio Gasoleo A/gi,'precioGasoleoA')
    jsonStringReplaced = jsonStringReplaced.replace(/Precio Gasolina 95 E5/gi,'precioGasolina95E5')
    jsonStringReplaced = jsonStringReplaced.replace(/Precio Gasolina 98 E5/gi,'precioGasolina98E5')
    jsonStringReplaced = jsonStringReplaced.replace(/Provincia/gi,'provincia')
    jsonStringReplaced = jsonStringReplaced.replace(/IDProvincia/gi,'idProvincia')
    jsonStringReplaced = jsonStringReplaced.replace(/Dirección/gi,'direccion')
    jsonStringReplaced = jsonStringReplaced.replace(/Municipio/gi,'municipio')
    jsonStringReplaced = jsonStringReplaced.replace(/IDEESS/gi,'ideess')
    jsonStringReplaced = jsonStringReplaced.replace(/IDmunucipio/gi,'idMunicipio')
    jsonStringReplaced = jsonStringReplaced.replace(/IDCCAA/gi,'idccaa')
    jsonStringReplaced = jsonStringReplaced.replace(/Rótulo/gi,'rotulo')
    jsonStringReplaced = jsonStringReplaced.replace(/Horario/gi,'horario')
    jsonStringReplaced = jsonStringReplaced.replace(/ListaEESSPrecio/gi,'listaEESSPrecio')
    let jsonFinal: GasolinerasListResponse = JSON.parse(jsonStringReplaced)
    return jsonFinal.listaEESSPrecio;
  }

  getTodasProvincias():Observable<ProvinciaListResponse[]>{
    return this.http.get<ProvinciaListResponse[]>(`https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/Listados/Provincias/`)
  }
}
