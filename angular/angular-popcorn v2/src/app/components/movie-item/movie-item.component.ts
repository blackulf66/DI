import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogLoginComponent } from 'src/app/dialogs/dialog-login/dialog-login.component';
import { DialogMovieDetailComponent } from 'src/app/dialogs/dialog-movie-detail/dialog-movie-detail.component';
import { DialogPlaylistComponent } from 'src/app/dialogs/dialog-playlist/dialog-playlist.component';
import { MovieFavoriteDialogComponent } from 'src/app/dialogs/movie-favorite-dialog/movie-favorite-dialog.component';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { AuthService } from 'src/app/services/auth.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent implements OnInit {
  @Input() movieInput!: Movie;

  constructor(private dialog: MatDialog,
     private authService: AuthService,
    
     ) { }

  ngOnInit(): void {
  }

  getMovieImageUrl(movie: Movie) {
    return `${environment.imageBaseUrl}${movie.poster_path}`;
  }
  openDialogMovieDetail() {
    this.dialog.open(DialogMovieDetailComponent, {
      height: '600px',
      width: '600px',
      data: { movieName: this.movieInput?.id }
    });
  }

  openDialogplaylist() {
    this.dialog.open(DialogPlaylistComponent, {
      height: '600px',
      width: '600px',
      data: { movieDetail: this.movieInput }
    });
  }
  openDialogFavorite(){
    this.dialog.open(MovieFavoriteDialogComponent, {
      width: "500px",
      height: "250px",
      data:{
        movieId: this.movieInput.id
      }
    })
  }

  openLoginDialog(){
    this.dialog.open(DialogLoginComponent, {
      width: "300px"
      
    })
  }

  addFavorite(){
    if(this.authService.isLoggedIn()){
      this.openDialogFavorite();
    }else{
      this.openLoginDialog();

    }
  }

  addToPlayList() {
    if(this.authService.isLoggedIn()) {
      this;  
    } else {
    
    }
  }



}
