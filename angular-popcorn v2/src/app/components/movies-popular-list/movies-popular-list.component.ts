import { Component, OnInit } from '@angular/core';
import { Genre, GenreList } from 'src/app/models/interfaces/genre.interface';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { AuthService } from 'src/app/services/auth.service';
import { MoviesService } from 'src/app/services/movies.service';

@Component({
  selector: 'app-movies-popular-list',
  templateUrl: './movies-popular-list.component.html',
  styleUrls: ['./movies-popular-list.component.css']
})
export class MoviesPopularListComponent implements OnInit {
  popularMovies: Movie[] = [];
  allPopularMovies: Movie[] = [];
  genreList!: Genre[];
  genreid!: number[];

  constructor(private moviesService: MoviesService,
    private authService: AuthService,
  
    ) { }

  ngOnInit(): void {
    this.moviesService.getPopularMovies().subscribe(popularMoviesResponse => {
      this.popularMovies = popularMoviesResponse.results;
      this.allPopularMovies = popularMoviesResponse.results;
    });
    this.moviesService.getGenreList().subscribe(g => {
      this.genreList = g.genres;
    })
  }
  filterGenre(sGeneroid: number[]){

      this.popularMovies = this.allPopularMovies;
      if(this.genreid.length > 0){
        let r :Movie[] = this.popularMovies.filter(movies => movies.genre_ids.some(filtro => sGeneroid.includes(filtro)));
      this.popularMovies= r;
      }else{
        this.moviesService.getPopularMovies();
        }
      }
 
}
