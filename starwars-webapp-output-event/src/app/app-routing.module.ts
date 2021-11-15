import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PeopleListComponent } from './pages/people-list/people-list.component';
import { PlanetDetailComponent } from './pages/planet-detail/planet-detail.component';
import { PlanetListComponent } from './pages/planet-list/planet-list.component';

const routes: Routes = [
  { path:'people', component: PeopleListComponent },
  { path:'planets', pathMatch: 'full', component: PlanetListComponent },
  { path:'planets/:idPlanet', component: PlanetDetailComponent },
  { path: '', pathMatch: 'full', redirectTo: '/planets' },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
