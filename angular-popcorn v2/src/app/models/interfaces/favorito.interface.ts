export class FavoriteDto {
    media_type= "movie";
    media_id!:number;
    favorite= true;
}

export interface FavoriteListResponse {
    page:          number;
    results:       Favorite[];
    total_pages:   number;
    total_results: number;
}

export interface Favorite {
    original_language: string;
    original_title:    string;
    poster_path:       string;
    title:             string;
    video:             boolean;
    vote_average:      number;
    id:                number;
    release_date:      string;
    vote_count:        number;
    adult:             boolean;
    backdrop_path:     string;
    overview:          string;
    genre_ids:         number[];
    popularity:        number;
}