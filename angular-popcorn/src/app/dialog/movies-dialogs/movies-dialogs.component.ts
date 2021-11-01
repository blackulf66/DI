import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MovieResponse } from 'src/app/models/interfaces/movie.interface';
import { MoviesService } from 'src/app/services/movies.service';

export interface DialogMovieDetail {
  movieId: number;

}
@Component({
  selector: 'app-movies-dialogs',
  templateUrl: './movies-dialogs.component.html',
  styleUrls: ['./movies-dialogs.component.css']
})
export class DialogMovieDetailComponent implements OnInit {

  movie!: MovieResponse;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: DialogMovieDetail,
    private moviesService: MoviesService) { }

  ngOnInit(): void {
    this.moviesService.getMovieId(this.data.movieId).subscribe(movieResult =>{
      this.movie = movieResult;
    })

  }

}


