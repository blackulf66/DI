import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-movies-popular-list-component.component.',
  templateUrl: './movies-popular-list-component.component.html',
  styleUrls: ['./movies-popular-list-component.component.css']
})
export class MoviesPopularListComponent implements OnInit {
  MovieList: movie[] | undefined;
  movieService: any;
  MovieName: string= "";
 

  constructor() { }

  ngOnInit(): void {
  }

  getMovieList() {
    this.movieService.getMovieList(parseInt(this.movieNumberSelected)).subscribe( r => {
      this.MovieList = r.results;
      console.log(r);
    });
  }
  getMovieName(){
    this.movieService.getPokemon(this.MovieName).subscribe(result => {
      this.MovieName = result.name;
    })
    }

}
