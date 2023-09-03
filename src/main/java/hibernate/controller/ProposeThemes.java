package hibernate.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hibernate.util.Methods;

/**
 * Servlet implementation class ProposeThemes
 */
@WebServlet("/ProposeThemes")
public class ProposeThemes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProposeThemes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String themeName = request.getParameter("themeName");
		int userId =  Integer.parseInt(request.getParameter("userId"));
		System.out.println("The name of the theme: " + themeName);
		
		Methods methods = new Methods();
		methods.proposeThemes(themeName, userId);
		request.setAttribute("Message", "You have proposed: "+themeName);
		RequestDispatcher rs = request.getRequestDispatcher("proposeThemes.jsp");
		rs.include(request, response);
	}
}
