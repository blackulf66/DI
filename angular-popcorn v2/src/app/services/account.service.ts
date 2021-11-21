import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Account } from '../models/interfaces/lists.inteface';

@Injectable({
  providedIn: 'root'
})
export class AccountService {

  constructor(private http: HttpClient) { }

  getLists(): Observable<Account>{
    return this.http.get<Account>(`https://api.themoviedb.org/3/account/{account_id}/lists?${environment.apiKey}&language=${environment.defaultLang}&page=1&session_id=e2270217b9e91ae6a23a8be9171617abc5770798`)
  }
}
