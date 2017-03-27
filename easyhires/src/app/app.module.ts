import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { RouterModule} from "@angular/router";

import { AppComponent } from './app.component';
import { AllAdsComponent } from './components/all_ads/all_ads.component';
import { HomeComponent } from './components/home/home.component';
import { loginComponent } from './components/login/login.component';
import { PostAdsComponent } from './components/post_ads/post_ads.component';
import { RegisterComponent } from './components/register/register.component';

import { EasyHires } from './app.routes';


@NgModule({
  declarations: [
    AppComponent,
    AllAdsComponent,
    HomeComponent,
    loginComponent,
    PostAdsComponent,
    RegisterComponent
  ],
  imports: [
    BrowserModule,
    RouterModule.forRoot( EasyHires),
    FormsModule,
    HttpModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
