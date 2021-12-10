import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { GasolineraFavComponent } from './components/gasolinera-fav/gasolinera-fav.component';
import { GasolineraListComponent } from './components/gasolinera-list/gasolinera-list.component';

const routes: Routes = [
  {path:'', pathMatch:"full", component:GasolineraListComponent},
  {path:'favorite',component:GasolineraFavComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
