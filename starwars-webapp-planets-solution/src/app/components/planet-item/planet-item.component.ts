import { Component, Input, OnInit } from '@angular/core';
import { Planet } from 'src/app/models/interfaces/planet.interface';

@Component({
  selector: 'app-planet-item',
  templateUrl: './planet-item.component.html',
  styleUrls: ['./planet-item.component.css']
})
export class PlanetItemComponent implements OnInit {
  @Input() planetInput!: Planet;

  constructor() { }

  ngOnInit(): void {
  }

  getPlanetId(url: string) {
    let urlParts = url.split('/');
    let id = urlParts[5];
    return id;
  }
}
