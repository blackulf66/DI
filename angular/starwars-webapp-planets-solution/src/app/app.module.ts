import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PeopleListComponent } from './pages/people-list/people-list.component';
import { PersonItemComponent } from './components/person-item/person-item.component';
import { PlanetListComponent } from './pages/planet-list/planet-list.component';
import { PlanetItemComponent } from './components/planet-item/planet-item.component';
import { HttpClientModule } from '@angular/common/http';
import { PlanetDetailComponent } from './pages/planet-detail/planet-detail.component';
import { PersonDetailComponent } from './pages/person-detail/person-detail.component';
@NgModule({
  declarations: [
    AppComponent,
    PeopleListComponent,
    PersonItemComponent,
    PlanetListComponent,
    PlanetItemComponent,
    PlanetDetailComponent,
    PersonDetailComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
