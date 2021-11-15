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
import { PlanetSelectedComponent } from './components/planet-selected/planet-selected.component';
import { FlexLayoutModule } from '@angular/flex-layout';
@NgModule({
  declarations: [
    AppComponent,
    PeopleListComponent,
    PersonItemComponent,
    PlanetListComponent,
    PlanetItemComponent,
    PlanetDetailComponent,
    PlanetSelectedComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FlexLayoutModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
