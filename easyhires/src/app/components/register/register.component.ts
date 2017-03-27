/**
 * Created by clement on 2/16/2017.
 */
import { Component } from '@angular/core';
import 'rxjs/Rx';
import {Http,Response,Headers} from '@angular/http';
import {Validators, FormBuilder, FormControl, FormGroup} from '@angular/forms';
import { CanActivate, Router, RouterStateSnapshot } from '@angular/router';

import {FormsModule,ReactiveFormsModule} from '@angular/forms';
//import {EmailValidators} from 'ng2-validators';

@Component({
  selector: 'my-app',
  templateUrl:'register.component.html'
})
export class RegisterComponent
{

  //posts : Array<any> = [];
  public signUpStatus :any = " ";
  public displaySignUpStatus :any = " ";

  constructor (public http: Http,public builder: FormBuilder,private router:Router) {
    /*  http.get('http://127.0.0.1:5000/allposts')
     .flatMap((data) => data.json())
     .subscribe((data) => {
     this.posts.push(data);
     });
     */
  }

  createAuthorizationHeader(headers:Headers) {
    headers.append('Authorization', 'Basic ' +
      btoa('a20e6aca-ee83-44bc-8033-b41f3078c2b6:c199f9c8-0548-4be79655-7ef7d7bf9d20'));
  }

  username = new FormControl('', [
    Validators.required,
    Validators.minLength(5)
  ]);
  password = new FormControl('', [Validators.required]);
  email = new FormControl('',[Validators.required]);

  signUpForm: FormGroup = this.builder.group({
    username: this.username,
    password: this.password,
    email:this.email
  });


  signUp () {
    var headers = new Headers();
    this.createAuthorizationHeader(headers);
    headers.append('Content-Type', 'application/json');

    let formObj = this.signUpForm.getRawValue(); // {name: '', description: ''}

    let serializedForm = JSON.stringify(formObj);
    //console.log(serializedForm);

    this.http.post("http://127.0.0.1:5000/signup", serializedForm, {
      headers: headers
    }).map(response => response.text())
      .subscribe(response => {
        this.signUpStatus = response;
        console.log(response);
        console.log(this.signUpStatus);
        if(this.signUpStatus == "0")
        {
          this.displaySignUpStatus = "username already exists";

        }
        else if(this.signUpStatus == "1")
        {

          this.displaySignUpStatus = "successfully subscribed";
          setTimeout(()=>{    //<<<---    using ()=> syntax
            this.displaySignUpStatus = "redirecting to login page";
            this.router.navigate([ '/login' ]);
          },3000);

        }
      });
  }


}
