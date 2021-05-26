import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { ReactiveFormsModule } from '@angular/forms';
import { PoButtonModule, PoFieldModule, PoLoadingModule, PoModule, PoNotificationModule, PoPageModule } from '@po-ui/ng-components';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    PoModule,
    PoPageModule,
    PoFieldModule,
    PoButtonModule,
    PoNotificationModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
