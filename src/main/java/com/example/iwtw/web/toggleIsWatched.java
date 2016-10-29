package com.example.iwtw.web;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.iwtw.domain.Actor;
import com.example.iwtw.domain.Movie;
import com.example.iwtw.service.StorageService;

@WebServlet(name = "toggleIsWatched", urlPatterns = "/toggleIsWatched")
public class toggleIsWatched extends HttpServlet {

    StorageService storage = new StorageService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idMovie = Integer.parseInt(request.getParameter("idMovie"));
        storage.toggleWatched(idMovie);
        request.getRequestDispatcher("movieDetails.jsp?id="+idMovie).forward(request, response);
    }
}