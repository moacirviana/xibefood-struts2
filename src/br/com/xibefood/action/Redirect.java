package br.com.xibefood.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/Simple", initParams = { 
		   @WebInitParam(name = "foo", value = "Hello "), 
		   @WebInitParam(name = "bar", value = " World!") 
		})
public class Redirect extends HttpServlet {

	   private static final long serialVersionUID = 1L; 

	   @SuppressWarnings("static-access")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	      throws ServletException, IOException {   
		      response.setContentType("text/html");
		      String site = new String("login/frmSetup");
		      response.setStatus(response.SC_MOVED_TEMPORARILY);
		   response.setHeader("Location", site); 
	   }   
	}