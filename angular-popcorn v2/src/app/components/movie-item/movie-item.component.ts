import { Component, Input, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { DialogLoginComponent } from 'src/app/dialogs/dialog-login/dialog-login.component';
import { DialogMovieDetailComponent } from 'src/app/dialogs/dialog-movie-detail/dialog-movie-detail.component';
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

  constructor(private dialog: MatDialog, private authService: AuthService) { }

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

  addFavorite() {
    if(this.authService.isLoggedIn()) {
      //TODO añadir el movieInput a favoritos
    } else {
      this.openDialogMovieDetail();
    }
  }

}
