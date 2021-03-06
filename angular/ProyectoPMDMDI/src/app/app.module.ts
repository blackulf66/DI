import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GasolineraListComponent } from './components/gasolinera-list/gasolinera-list.component';
import { GasolineraItemComponent } from './components/gasolinera-item/gasolinera-item.component';
import { HttpClientModule } from '@angular/common/http';
import { MaterialImportsModule } from './modules/material-imports.module';
import { DialogDetailsComponent } from './dialogs/dialog-details/dialog-details.component';
import { BrowserAnimationsModule} from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatSliderModule} from '@angular/material/slider';
import { FlexLayoutModule } from '@angular/flex-layout';


@NgModule({
  declarations: [
    AppComponent,
    GasolineraListComponent,
    GasolineraItemComponent,
    DialogDetailsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    MaterialImportsModule,
    BrowserAnimationsModule,
    FormsModule,
    MatSliderModule,
    FlexLayoutModule
 
  ],
  providers: [],
  entryComponents: [DialogDetailsComponent],
  bootstrap: [AppComponent]
})
export class AppModule { }
