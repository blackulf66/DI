import { Component, OnInit } from '@angular/core';
import { Favorite } from 'src/app/models/interfaces/favorito.interface';
import { FavoriteService } from 'src/app/services/favorite.service';
import { environment } from 'src/environments/environment';

@Component({
  selector: 'app-favorites-movies',
  templateUrl: './favorites-movies.component.html',
  styleUrls: ['./favorites-movies.component.css']
})
export class FavoritesMoviesComponent implements OnInit {
  favoriteList!: Favorite[];
  constructor(private favoriteService: FavoriteService) { }

  ngOnInit(): void {
    this.favoriteService.getFavoriteList().subscribe(favorite => {
      this.favoriteList = favorite.results;
    })
  }
  getMovieImageUrl(favorite: Favorite) {
    return `${environment.imageBaseUrl}${favorite.poster_path}`;
  }

}