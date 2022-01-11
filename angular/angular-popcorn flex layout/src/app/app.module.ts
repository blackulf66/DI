import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule } from '@angular/common/http';
import { MaterialImportsModule } from './modules/material-imports.module';
import { MoviesPopularListComponent } from './components/movies-popular-list/movies-popular-list.component';
import { MovieItemComponent } from './components/movie-item/movie-item.component';
import { NgCircleProgressModule } from 'ng-circle-progress';

@NgModule({
  declarations: [
    AppComponent,
    MoviesPopularListComponent,
    MovieItemComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialImportsModule,
    HttpClientModule,
    FlexLayoutModule,
    NgCircleProgressModule.forRoot({
  
      radius: 100,
      outerStrokeWidth: 5,
      innerStrokeWidth: 2,
      outerStrokeColor: "#8F0091",
      innerStrokeColor: "#CE00D1",
      animationDuration: 300,
      titleColor: "#FFFFFF",
      backgroundColor: "#999999"
    })

  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
