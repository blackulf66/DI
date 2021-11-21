import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Movie} from 'src/app/models/interfaces/movies-popular.interface';
import { MoviesService } from 'src/app/services/movies.service';
import { environment } from 'src/environments/environment';

export interface DialogMovieDetailData{
  movieName: number;
}

@Component({
  selector: 'app-dialog-movie-detail',
  templateUrl: './dialog-movie-detail.component.html',
  styleUrls: ['./dialog-movie-detail.component.css']
})
export class DialogMovieDetailComponent implements OnInit {

  movie!: Movie;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: DialogMovieDetailData,
    private movieService: MoviesService) { }

  ngOnInit(): void {
    console.log(this.data.movieName);
    this.movieService.getMovie(this.data.movieName).subscribe(movieResult =>{
      this.movie = movieResult;

    })
  }
  getMovieImage(movie: Movie){
    return `${environment.imageBaseUrl}${movie.poster_path}`
  }

}
