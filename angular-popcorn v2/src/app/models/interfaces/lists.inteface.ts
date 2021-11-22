export interface ListaResponse {
    page:          number;
    results:       Lista[];
    total_pages:   number;
    total_results: number;
}

export interface Lista {
    description:    string;
    favorite_count: number;
    id:             number;
    item_count:     number;
    iso_639_1:      string;
    list_type:      string;
    name:           string;
    poster_path:    null;
}
