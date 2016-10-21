package com.example.iwtw.service;
import com.example.iwtw.domain.Movie;
import com.sun.xml.internal.ws.util.StringUtils;


import java.util.ArrayList;
import java.util.List;

public class StorageService {

    static private List<Movie> db = new ArrayList<Movie>();

    private Movie fixedMovie(Movie movie) {
        String title = movie.getTitle().substring(0, 1).toUpperCase() + movie.getTitle().substring(1);
        String genre = movie.getGenre().substring(0, 1).toUpperCase() + movie.getGenre().substring(1);
        return new Movie(title, movie.getReleaseYear(), genre, movie.getCoverUrl(), movie.getIsFavorite());
    }

    public void add(Movie movie) {
        Movie newMovie = fixedMovie(movie);
        db.add(newMovie);
    }


    public void update(int id, Movie movie) {

        Movie updatedMovie = fixedMovie(movie);
        db.set(id, updatedMovie);
    }

    public void delete(int id) {
        db.remove(id);
    }

    public void toggleFavorite(int id) {
        Movie movie = db.get(id);
        if (!movie.getIsFavorite()) {
            movie.setIsFavorite(true);
        } else {
            movie.setIsFavorite(false);
        }
    }

    public List<Movie> getAllMovies() {
        return db;
    }

    public void populateList() {
        Movie newMovie1 = new Movie("Inception", 2010, "Science Fiction", "https://s-media-cache-ak0.pinimg.com/originals/be/81/b0/be81b09191f45334003ee7ae39936ce8.jpg");
        db.add(newMovie1);
        Movie newMovie2 = new Movie("Deadpool", 2016, "Science Fiction", "http://orig03.deviantart.net/6276/f/2016/018/5/7/deadpool_movie_poster__2_by_tldesignn-d9ofdhf.png");
        db.add(newMovie2);
        Movie newMovie3 = new Movie("Interstellar", 2014, "Adventure", "https://d3ui957tjb5bqd.cloudfront.net/uploads/2014/11/interstellar-poster-21.jpg");
        db.add(newMovie3);
        Movie newMovie4 = new Movie("Whiplash", 2014, "Drama", "https://mattmulcahey.files.wordpress.com/2015/01/whiplash-poster-cold-open-is-firm-dont-know-artist1.jpg");
        db.add(newMovie4);
        Movie newMovie6 = new Movie("The Notebook", 2004, "Drama", "https://images-na.ssl-images-amazon.com/images/M/MV5BMTk3OTM5Njg5M15BMl5BanBnXkFtZTYwMzA0ODI3._V1_SX640_SY720_.jpg");
        db.add(newMovie6);
        Movie newMovie7 = new Movie("The Lord of the Rings", 2003, "Drama", "http://www.impawards.com/2003/posters/lord_of_the_rings_the_return_of_the_king.jpg");
        db.add(newMovie7);
        Movie newMovie5 = new Movie("The Wolf of Wall Street", 2013, "Comedy", "https://s-media-cache-ak0.pinimg.com/originals/7a/51/99/7a5199a401451215ca0411117e771044.jpg");
        db.add(newMovie5);
    }
}
