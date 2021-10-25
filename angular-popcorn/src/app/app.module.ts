import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MoviesPopularListComponent } from './movies-popular-list-component/movies-popular-list-component';
import { MoviesItemComponentComponent } from './movies-item-component/movies-item-component.component';

@NgModule({
  declarations: [
    AppComponent,
    MoviesPopularListComponent,
    MoviesItemComponentComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
