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

import com.example.iwtw.domain.Movie;
import com.example.iwtw.service.StorageService;

@WebServlet(urlPatterns = "/showFavorite")
public class showFavorite extends HttpServlet {
	
	Movie movie = new Movie();
	StorageService storage = new StorageService();
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		if (storage.getAllMovies().size() > 0) { 
			for (Movie movie : storage.getAllMovies()) {
				if (movie.getIsFavorite() == true) {
					out.println(movie.getTitle());
					out.println("<br>");
				}
			}
		}
		else {
			out.println("<h1>There are no favorite movies. </h1>");
		 
		}
	}

}