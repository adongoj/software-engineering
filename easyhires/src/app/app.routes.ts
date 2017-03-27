// import { AppComponent } from './app.component';
import { AllAdsComponent } from './components/all_ads/all_ads.component';
import { HomeComponent } from './components/home/home.component';
import { loginComponent } from './components/login/login.component';
import { PostAdsComponent } from './components/post_ads/post_ads.component';
import { RegisterComponent } from './components/register/register.component';


export const EasyHires = [
  { path: '', component: HomeComponent },
  { path: 'home', component: HomeComponent},
  { path: 'login', component: loginComponent},
  { path: 'post_ads', component: PostAdsComponent},
  { path: 'register', component: RegisterComponent},
  { path: 'all_ads', component: AllAdsComponent}
];
