import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Planet } from 'src/app/models/interfaces/planet.interface';

@Component({
  selector: 'app-planet-item',
  templateUrl: './planet-item.component.html',
  styleUrls: ['./planet-item.component.css']
})
export class PlanetItemComponent implements OnInit {
  @Input() planetInput!: Planet;
  @Output() planetSelectedEvent = new EventEmitter<Planet>();
  @Output() planetDeletedEvent = new EventEmitter<Planet>();

  constructor() { }

  ngOnInit(): void {
  }

  getPlanetId(url: string) {
    let urlParts = url.split('/');
    let id = urlParts[5];
    return id;
  }

  onPlanetClick() {
    this.planetSelectedEvent.emit(this.planetInput);
  }

  onPlanetDeleteClick() {
    this.planetDeletedEvent.emit(this.planetInput);
  }
}
