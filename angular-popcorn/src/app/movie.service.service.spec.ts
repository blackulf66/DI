import { TestBed } from '@angular/core/testing';

import { Movie.ServiceService } from './movie.service.service';

describe('Movie.ServiceService', () => {
  let service: Movie.ServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(Movie.ServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
