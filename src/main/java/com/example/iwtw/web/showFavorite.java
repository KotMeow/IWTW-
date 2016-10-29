package com.example.iwtw.web;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.example.iwtw.domain.Movie;
import com.example.iwtw.service.StorageService;

@WebServlet(name = "showDetails", urlPatterns = "/showDetails")
public class showFavorite extends HttpServlet {

    StorageService storage = new StorageService();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TreeMap<String, Integer> genre = new TreeMap<String, Integer>();
        int favorite = 0;
        int watched = 0;
        int others;
        float favoritePercent = 0;
        String favoriteRate = "";
        Map.Entry<String, Integer> maxEntry = null;


        if (storage.getAllMovies().size() > 0) {
            //Counting number of movies of each genre
            for (Movie movie : storage.getAllMovies()) {
                int count = 1;
                if (movie.getIsFavorite()) favorite++;
                if (movie.getIsWatched()) watched++;
                if (genre.containsKey(movie.getGenre())) count = genre.get(movie.getGenre()) + 1;
                genre.put(movie.getGenre(), count);
            }
            //getting most common genre **could be done better**
            for (Map.Entry<String, Integer> entry : genre.entrySet()) {
                if (maxEntry == null || entry.getValue() > maxEntry.getValue()) {
                    maxEntry = entry;
                }
            }
            request.setAttribute("favoriteGenre", maxEntry);
            favoritePercent = ((float) favorite / (float) storage.getAllMovies().size()) * 100.0f;
        }

        others = storage.getAllMovies().size() - favorite;

        if (favoritePercent < 20 ) favoriteRate = "You don't like your movies :(";
        else if (favoritePercent < 50) favoriteRate = "You like your movies! ;)";
        else if (favoritePercent <= 100) favoriteRate = "You love your movies! <3";


        response.setContentType("text/html");
        request.setAttribute("genre", genre);
        request.setAttribute("watched", watched);
        request.setAttribute("favoritePercent", Math.ceil(favoritePercent));
        request.setAttribute("all", storage.getAllMovies().size());
        request.setAttribute("favorite", favorite);
        request.setAttribute("others", others);
        request.setAttribute("favoriteRate", favoriteRate);

        request.getRequestDispatcher("/favorite.jsp").forward(request, response);

    }
}
