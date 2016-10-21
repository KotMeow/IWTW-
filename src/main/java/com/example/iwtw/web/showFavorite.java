package com.example.iwtw.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;


import com.example.iwtw.domain.Movie;
import com.example.iwtw.service.StorageService;

@WebServlet(name = "showFavorite", urlPatterns = "/showFavorite")
public class showFavorite extends HttpServlet {
	
	Movie movie = new Movie();
	StorageService storage = new StorageService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	int watched = 0;
	int unwatched;
	
	if (storage.getAllMovies().size() > 0) { 
			for (Movie movie : storage.getAllMovies()) {
				if (movie.getIsFavorite()) {
					watched++;
				}
			}
		}
		
	unwatched = storage.getAllMovies().size() - watched;	
/*
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String message = "Kotek";
		
		else {
			out.println("<h1>There are no favorite movies. </h1>");
		 
		}*/

	response.setContentType("text/html");
    request.setAttribute("watched", watched);
    request.setAttribute("unwatched", unwatched);
    request.getRequestDispatcher("/favorite.jsp").forward(request, response);

}
}
