import { Component, OnInit } from '@angular/core';

export interface elemento {
  position: number;
  nombre: string;
  apellidos: String;
  edad: number;
  curso: number;
  notamedia: number;


}
const ELEMENTOS: elemento[] = [
  { position: 1, nombre: 'sven', apellidos: 'svensson', edad: 2, curso: 1, notamedia: 2 },
  { position: 2, nombre: 'sven', apellidos: 'svensson', edad: 2, curso: 1, notamedia: 2 },
  { position: 3, nombre: 'sven', apellidos: 'svensson', edad: 2, curso: 1, notamedia: 2 },
  { position: 4, nombre: 'sven', apellidos: 'svensson', edad: 2, curso: 1, notamedia: 2 },
  { position: 5, nombre: 'sven', apellidos: 'svensson', edad: 2, curso: 1, notamedia: 2 },
  { position: 6, nombre: 'sven', apellidos: 'svensson', edad: 2, curso: 1, notamedia: 2 },


];
@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})

export class TableComponent implements OnInit {
  displayedColumns: string[] = ['position', 'nombre', 'apellidos', 'edad', 'curso', 'nota', 'acciones'];
  dataSource = ELEMENTOS;
  acol: string[] = ['position' ,'nombre', 'apellidos', 'edad', 'curso', 'nota', 'acciones'];

  constructor() { }

  ngOnInit(): void {
  }

  columnavisible(event:any , columnavisible:string){
    if (event.checked == false){
      let index = this.displayedColumns.indexOf(columnavisible);
    if(-1 !== index){
      this.displayedColumns.splice(index, 1)
    }
    }else{
      let indexII =this.acol.indexOf(columnavisible);
      this.displayedColumns = [...this.displayedColumns.slice(0,indexII),this.acol[indexII],...this.displayedColumns.slice(indexII)]
    }

  }
}
