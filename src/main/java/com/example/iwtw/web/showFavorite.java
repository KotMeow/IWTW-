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

@WebServlet(name = "showFavorite", urlPatterns = "/showFavorite")
public class showFavorite extends HttpServlet {

	StorageService storage = new StorageService();


	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	Map<String, Integer> genre = new HashMap<String, Integer>();

	int favorite = 0;
	int others;

	if (storage.getAllMovies().size() > 0) { 
			for (Movie movie : storage.getAllMovies()) {
				int count = 1;
				if (movie.getIsFavorite()) favorite++;
				if (genre.containsKey(movie.getGenre())) count = genre.get(movie.getGenre()) + 1;
				genre.put(movie.getGenre(), count);
			}
		}
		
	others = storage.getAllMovies().size() - favorite;
	response.setContentType("text/html");
	request.setAttribute("genre", genre);
    request.setAttribute("favorite", favorite);
    request.setAttribute("others", others);

    request.getRequestDispatcher("/favorite.jsp").forward(request, response);

}
}
