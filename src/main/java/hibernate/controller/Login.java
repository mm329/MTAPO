package hibernate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import hibernate.entity.Users;
import hibernate.util.UsersUtils;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String mesaj = "";
		String email = request.getParameter("email");
		String rememberme = request.getParameter("rememberme");
		if (StringUtils.isEmpty(email)) {
			mesaj = "Ai uitat sa introduci username-ul";
		}
		String password = request.getParameter("password");
		if (StringUtils.isEmpty(password)) {
			mesaj = " Ai uitat sa introduci parola";
		}
		password = UsersUtils.stringMd5(password);
		if (!mesaj.equals("")) {
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
		Users user = UsersUtils.retrieveUser(email, password);
		System.out.println("userul este: "+user);
		if (user == null) {
			mesaj = "Datele de conectare sunt incorecte";
			request.setAttribute("mesaj", mesaj);
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		} else {

			if (!user.isVerified()) {
				mesaj = "Contul nu a fost activat";
				request.setAttribute("mesaj", mesaj);
				request.getRequestDispatcher("/Login.jsp").forward(request, response);
			}
			request.getSession().setAttribute("userId", user.getIdUser());
			request.getSession().setAttribute("userEmail", user.getEmail());
			request.getSession().setAttribute("rememberme", "true".equals(rememberme) ? "true" : null);
			System.out.println(email);
			System.out.println(password);
			System.out.println(user);
			if (user.isVerified() && user.getRank() == 0) {
				System.out.println("MA DUCE PE STUDENT");
				request.getRequestDispatcher("/vizualize.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/viewThemes.jsp").forward(request, response);
			}
		}
	}

}
