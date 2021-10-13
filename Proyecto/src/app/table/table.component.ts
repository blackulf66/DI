import { Component, OnInit } from '@angular/core';

export interface elemento {
  position: number;
  nombre: string;
  apellidos: String;  
  edad: number;
  curso: number;
  notamedia: number;
  boton1:String;
  boton2:String;

}
const ELEMENT_DATA: elemento[] = [
  {position: 1, nombre: 'sven', apellidos:'svensson', edad: 2, curso:1, notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 2, nombre: 'sven', apellidos:'svensson', edad: 2, curso:1, notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 3, nombre: 'sven', apellidos:'svensson' ,edad: 2, curso:1 ,notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 4, nombre: 'sven', apellidos:'svensson' ,edad: 2, curso:1 ,notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 5, nombre: 'sven', apellidos:'svensson' ,edad: 2, curso:1 ,notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 6, nombre: 'sven', apellidos:'svensson' ,edad: 2, curso:1, notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 7, nombre: 'sven', apellidos:'svensson', edad: 2, curso:1 ,notamedia: 2, boton1:'editar',boton2:'eliminar'},
  {position: 8, nombre: 'sven', apellidos:'svensson' ,edad: 2, curso:1 ,notamedia: 2, boton1:'editar',boton2:'eliminar'},
];
@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.css']
})

export class TableComponent implements OnInit {
  displayedColumns: string[] = ['position','nombre','apellidos','edad','curso','nota','boton1','boton2'];
  dataSource = ELEMENT_DATA;

  constructor() { }

  ngOnInit(): void {
  }

}
