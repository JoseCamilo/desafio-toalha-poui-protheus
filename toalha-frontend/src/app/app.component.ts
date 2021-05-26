import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { environment } from '../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'toalha-frontend';

  constructor(private http: HttpClient) {}

  ngOnInit() {
    this.http.get(`${environment.urlBackEnd}api/diatoalha/v1/info`).subscribe(data => { console.log(data)})
  }
}
