import { Component, OnInit } from '@angular/core';
import 'rxjs/Rx';
import {Http} from '@angular/http';


@Component({
  selector: 'app-allAds',
  templateUrl: 'all_ads.component.html',
})
export class AllAdsComponent implements OnInit{
  posts : Array<any> = [];

  constructor(private http: Http) { }

  //ngOnInit has to take the heavy load not the constructor
  ngOnInit(){
    this.http.get('http://127.0.0.1:5000/allposts')
      .flatMap((data) => data.json())
      .subscribe((data) => {
        this.posts.push(data);
      });

  }
}
