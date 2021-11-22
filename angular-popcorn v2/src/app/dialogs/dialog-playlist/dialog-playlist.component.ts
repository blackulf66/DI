import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Lista } from 'src/app/models/interfaces/lists.inteface';
import { PlaylistService } from 'src/app/services/playlist.service';

@Component({
  selector: 'app-dialog-playlist',
  templateUrl: './dialog-playlist.component.html',
  styleUrls: ['./dialog-playlist.component.css']
})
export class DialogPlaylistComponent implements OnInit {
  
  list: Lista[]=[];
  list_id!: String;

  constructor(
    @Inject(MAT_DIALOG_DATA) private playlistService: PlaylistService) { }


  ngOnInit(): void {
    this.playlistService.getLista().subscribe(l =>{
      this.list = l.results;

    })
  }


}
