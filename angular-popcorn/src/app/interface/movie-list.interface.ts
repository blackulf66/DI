export interface Movie {
    name: string;
    url: string;
}

export interface MovieListResponse {
    count: number;
    next: string;
    previous?: any;
    results: Movie[];
}