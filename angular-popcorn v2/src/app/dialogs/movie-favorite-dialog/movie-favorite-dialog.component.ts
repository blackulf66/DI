import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FavoriteDto } from 'src/app/models/interfaces/favorito.interface';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { FavoriteService } from 'src/app/services/favorite.service';
import { MoviesService } from 'src/app/services/movies.service';

export interface favoriteMovieData{
  movieId: number;
}
@Component({
  selector: 'app-movie-favorite-dialog',
  templateUrl: './movie-favorite-dialog.component.html',
  styleUrls: ['./movie-favorite-dialog.component.css']
})
export class MovieFavoriteDialogComponent implements OnInit {

  favoriteDto = new FavoriteDto
  movie!: Movie;
  constructor(@Inject(MAT_DIALOG_DATA) private data: favoriteMovieData, private moviesServices: MoviesService,
  private favoriteService: FavoriteService) { }

  ngOnInit(): void {
    this.moviesServices.getMovie(this.data.movieId).subscribe(m => {
      this.movie = m;
      this.favoriteDto.media_id=this.movie.id
    })
  }
  addToFavorite(){
    this.favoriteService.addToFavorite(this.favoriteDto).subscribe();
  }

}