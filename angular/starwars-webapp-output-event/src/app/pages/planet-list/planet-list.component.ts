import { Component, OnInit } from '@angular/core';
import { Planet, PlanetResponse } from 'src/app/models/interfaces/planet.interface';
import { PlanetService } from 'src/app/services/planet.service';

@Component({
  selector: 'app-planet-list',
  templateUrl: './planet-list.component.html',
  styleUrls: ['./planet-list.component.css']
})
export class PlanetListComponent implements OnInit {
  planetList: Planet[] = [];
  planetSelected!: Planet;

  constructor(private planetaService: PlanetService) { }

  ngOnInit(): void {
    this.planetaService.getPlanets().subscribe(planets => {
      this.planetList = planets.results;
    });
  }

  onPlanetSelected(newPlanet: Planet) {
    this.planetSelected = newPlanet;
  }

  updateList(planetDeleted: Planet) {
    alert(`${planetDeleted.name} ha sido eliminado`);
  }

}
