import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FavoritesMoviesComponent } from './components/favorites-movies/favorites-movies.component';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';
import { SessionComponent } from './shared/session/session.component';

const routes: Routes = [
  {path: '', component: MoviesPopularListComponent},
  {path: 'loginsuccess',component: SessionComponent},
  {path: 'favorito', component:FavoritesMoviesComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
