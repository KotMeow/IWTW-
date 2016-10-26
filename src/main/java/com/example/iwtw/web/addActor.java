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

@WebServlet(name = "addActor", urlPatterns = "/addActor")
public class addActor extends HttpServlet {

    StorageService storage = new StorageService();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        Actor actor = new Actor(name, role);
        storage.addActor(id, actor);

        request.getRequestDispatcher("movieDetails.jsp?id="+id).forward(request, response);


    }
}
