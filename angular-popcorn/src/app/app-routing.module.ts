import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';
import { PersonPopularListComponent } from './components/person-popular-list/person-popular-list.component';
import { SideMenuComponent } from './shared/side-menu/side-menu.component';

const routes: Routes = [
  {path: 'movie', component: MoviesPopularListComponent},
  {path: 'person', component: PersonPopularListComponent},
  { path: 'profile', component: SideMenuComponent }

];
@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
