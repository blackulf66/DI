import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Lista } from 'src/app/models/interfaces/lists.inteface';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { ListaResponseService } from 'src/app/services/account.service';
import { ListService } from 'src/app/services/list.service';
import { MoviesService } from 'src/app/services/movies.service';



export interface movieDetailDialogData{
  movieId: number;
}

@Component({
  selector: 'app-dialog-playlist',
  templateUrl: './dialog-playlist.component.html',
  styleUrls: ['./dialog-playlist.component.css']
})
export class DialogPlaylistComponent implements OnInit {
  
  movie!: Movie;
  bigLista!: Lista[];
  listaId!: number;
  descripcion!: string
  idioma!: string;
  nombrelista!:string

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: movieDetailDialogData, 
                             private listaService: ListService , 
                             private movieService: MoviesService,
                             private listaResponseService: ListaResponseService,) { }


  

  ngOnInit(): void {
      console.log(this.data.movieId)
    this.listaResponseService.getCreatedList().subscribe(l => {
      this.bigLista = l.results
      console.log(this.bigLista)
    })
  }

 
  createPlaylist(){
    this.listaService.createPlaylist(this.descripcion,this.nombrelista,this.idioma).subscribe(lista => {
      this.listaResponseService.getCreatedList().subscribe(l => {
        this.bigLista = l.results;
        this.listaId = lista.list_id
      })
    }
      
    )
  }
  addPlaylist(){
    this.listaService.addToPlaylist(this.listaId, this.data.movieId).subscribe()
  }
  

}

