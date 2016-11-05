package com.example.iwtw.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.iwtw.domain.Actor;
import com.example.iwtw.domain.Movie;
import com.example.iwtw.service.StorageService;

@WebServlet(name = "searchResult", urlPatterns = "/searchResult")
public class search extends HttpServlet {

    StorageService storage = new StorageService();
    static private List<Movie> searchResult = new ArrayList<Movie>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        searchResult.clear();
        PrintWriter out = response.getWriter();
        String search = request.getParameter("search");
       for (Movie movie : storage.getAllMovies()) {
            if (movie.getTitle().contains(search)) searchResult.add(movie);
        }

        request.setAttribute("searchResult", searchResult);
        request.getRequestDispatcher("/searchResult.jsp").forward(request, response);


    }
}
