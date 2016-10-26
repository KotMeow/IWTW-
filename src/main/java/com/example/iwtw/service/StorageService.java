package com.example.iwtw.service;

import com.example.iwtw.domain.Movie;
import com.example.iwtw.domain.Actor;
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

//    public void addActor(Movie movie, String name, String role){
//        int i = db.indexOf(movie);
//        Movie addtoMovie = db.get(i);
//        addtoMovie.addActor(name, role);
//    }

    public void update(int id, Movie movie) {
        Movie updatedMovie = fixedMovie(movie);
        updatedMovie.setActors(db.get(id).getActors());
        db.set(id, updatedMovie);
    }

    public void updateActor(int idMovie, int idActor, Actor actor){
        Actor updatedActor = new Actor(actor.getName(),actor.getRole());
        db.get(idMovie).getActors().set(idActor,updatedActor);
    }
    public void addActor(int id, Actor actor) {
        db.get(id).getActors().add(actor);
    }
    public void delete(int id) {
        db.remove(id);
    }
    public void deleteActor(int idMovie, int idActor) {
        db.get(idMovie).getActors().remove(idActor);
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
        Movie newMovie1 = new Movie("Inception", 2010, "Science Fiction", "http://payload174.cargocollective.com/1/0/1674/5786135/inception01_regular.jpg");
        newMovie1.addActor("Kamil Kot", "Meow Meow");
        newMovie1.addActor("Kamil Kamil", "Meow Meow");
        newMovie1.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie1);
        Movie newMovie2 = new Movie("Deadpool", 2016, "Science Fiction", "http://www.ew.com/sites/default/files/i/2015/12/13/ew-deadpool-poster.jpg");
        newMovie2.addActor("Kamil Kot1", "Meow Meow");
        newMovie2.addActor("Kamil Kamil", "Meow Meow");
        newMovie2.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie2);
        Movie newMovie3 = new Movie("Interstellar", 2014, "Adventure", "https://d3ui957tjb5bqd.cloudfront.net/uploads/2014/11/interstellar-poster-21.jpg");
        newMovie3.addActor("Kamil Kot2", "Meow Meow");
        newMovie3.addActor("Kamil Kamil", "Meow Meow");
        newMovie3.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie3);
        Movie newMovie4 = new Movie("Whiplash", 2014, "Drama", "https://mattmulcahey.files.wordpress.com/2015/01/whiplash-poster-cold-open-is-firm-dont-know-artist1.jpg");
        newMovie4.addActor("Kamil Kot3", "Meow Meow");
        newMovie4.addActor("Kamil Kamil", "Meow Meow");
        newMovie4.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie4);
        Movie newMovie6 = new Movie("The Notebook", 2004, "Drama", "https://images-na.ssl-images-amazon.com/images/M/MV5BMTk3OTM5Njg5M15BMl5BanBnXkFtZTYwMzA0ODI3._V1_SX640_SY720_.jpg");
        newMovie6.addActor("Kamil Kot4", "Meow Meow");
        newMovie6.addActor("Kamil Kamil", "Meow Meow");
        newMovie6.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie6);
        Movie newMovie7 = new Movie("The Lord of the Rings", 2003, "Drama", "http://www.impawards.com/2003/posters/lord_of_the_rings_the_return_of_the_king.jpg");
        newMovie7.addActor("Kamil Kot5", "Meow Meow");
        newMovie7.addActor("Kamil Kamil", "Meow Meow");
        newMovie7.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie7);
        Movie newMovie5 = new Movie("The Wolf of Wall Street", 2013, "Comedy", "https://alternativemovieposters.com/wp-content/uploads/2014/02/wolfbg.jpg");
        newMovie5.addActor("Kamil Kot6", "Meow Meow");
        newMovie5.addActor("Kamil Kamil", "Meow Meow");
        newMovie5.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie5);
        Movie newMovie8 = new Movie("Hunt for the Wilderpeople", 2016, "Comedy", "http://cdn.traileraddict.com/content/the-orchard/hunt-for-the-wilderpeople-poster-2.jpg");
        newMovie8.addActor("Kamil Kot7", "Meow Meow");
        newMovie8.addActor("Kamil Kamil", "Meow Meow");
        newMovie8.addActor("Kamil Kaaaamil", "Meow Meow");
        db.add(newMovie8);
    }
}
