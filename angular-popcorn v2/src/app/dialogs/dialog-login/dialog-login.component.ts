import { Component, OnInit } from '@angular/core';
import { NavigationExtras, Router } from '@angular/router';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { AuthService } from 'src/app/services/auth.service';
import { environment } from 'src/environments/environment';


@Component({
  selector: 'app-dialog-login',
  templateUrl: './dialog-login.component.html',
  styleUrls: ['./dialog-login.component.css']
})
export class DialogLoginComponent implements OnInit {

  movie!: Movie;

  constructor(
    private authService: AuthService,
    private router: Router
    ) { }

  ngOnInit(): void {
  }

  doLogin() {
    this.authService.getRequestToken().subscribe(resp => {
      this.authService.setLocalRequestToken(resp.request_token);
      window.open(`https://www.themoviedb.org/authenticate/${resp.request_token}?redirect_to=http://localhost:4200/loginsuccess`,"_self");
      
    });

  }
  getMovieImage(movie: Movie){
    return `${environment.imageBaseUrl}${movie.poster_path}`
  }

}
