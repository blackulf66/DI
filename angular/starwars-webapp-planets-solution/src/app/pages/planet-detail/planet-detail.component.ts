import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Planet } from 'src/app/models/interfaces/planet.interface';
import { PlanetService } from 'src/app/services/planet.service';

@Component({
  selector: 'app-planet-detail',
  templateUrl: './planet-detail.component.html',
  styleUrls: ['./planet-detail.component.css']
})
export class PlanetDetailComponent implements OnInit {
  id!: string;
  planet!: Planet;

  constructor(private activeRoute: ActivatedRoute,
    private planetService: PlanetService) { }

  ngOnInit(): void {
    this.activeRoute.params.subscribe(parametros => {
      this.id = parametros['idPlanet'];
      this.planetService.getPlanetById(this.id).subscribe(planetaso => {
        this.planet = planetaso;
      });
    });
  }

}
