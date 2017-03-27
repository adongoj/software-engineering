import { Component, OnInit} from '@angular/core';
import 'rxjs/Rx';
import { Http } from '@angular/http';
// import {}

@Component({
  selector: 'app-home',
  templateUrl: 'home.component.html'
})
export class HomeComponent implements OnInit{

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

