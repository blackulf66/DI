import { Component, Input, OnInit } from '@angular/core';
import { Planet } from 'src/app/models/interfaces/planet.interface';

@Component({
  selector: 'app-planet-selected',
  templateUrl: './planet-selected.component.html',
  styleUrls: ['./planet-selected.component.css']
})
export class PlanetSelectedComponent implements OnInit {
  @Input() planet!: Planet;

  constructor() { }

  ngOnInit(): void {
  }

}
