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
 * Servlet implementation class EditThemes
 */
@WebServlet("/EditThemes")
public class EditThemes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditThemes() {
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
		String name = request.getParameter("themeName");
		String profName = request.getParameter("teacherName");
		int idTheme = Integer.parseInt(request.getParameter("idTheme"));
		Methods methods = new Methods();
		methods.editThemes(idTheme, name, profName);
		
		RequestDispatcher rs = request.getRequestDispatcher("editThemes.jsp");
		rs.include(request, response);
	}
}
