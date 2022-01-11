import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Lista } from 'src/app/models/interfaces/lists.inteface';
import { Movie } from 'src/app/models/interfaces/movies-popular.interface';
import { ListaResponseService } from 'src/app/services/account.service';
import { ListService } from 'src/app/services/list.service';
import { MoviesService } from 'src/app/services/movies.service';



export interface movieDetailDialogData{
  movieDetail: Movie;
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
  descripcion!: string;
  idioma!: "es";
  nombrelista!:string;

  constructor(
    @Inject(MAT_DIALOG_DATA) private data: movieDetailDialogData, 
                             private listaService: ListService , 
                             private movieService: MoviesService,
                             private listaResponseService: ListaResponseService,) { }


  

  ngOnInit(): void {
    this.movie = this.data.movieDetail;
    this.listaResponseService.getCreatedList().subscribe(l => {
      this.bigLista = l.results;
    })
  }

 
  createPlaylist(){
   return this.listaService.createPlaylist(this.nombrelista,this.descripcion,this.idioma).subscribe(lista => {
      this.listaResponseService.getCreatedList().subscribe(l => {
        this.bigLista = l.results;
        this.listaId = lista.list_id
      })
    }
      
    )
  }
  addPlaylist(){
    return this.listaService.addToPlaylist(this.listaId, this.movie.id).subscribe();
  }
  

}

