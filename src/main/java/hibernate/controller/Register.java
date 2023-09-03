package hibernate.controller;

import hibernate.entity.Users;
import hibernate.util.UsersUtils;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Pattern;


@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
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

	boolean isValid(String email) {
		String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\." + "[a-zA-Z0-9_+&*-]+)*@" + "(?:[a-zA-Z0-9-]+\\.)+[a-z"
				+ "A-Z]{2,7}$";

		Pattern pat = Pattern.compile(emailRegex);
		if (email == null)
			return false;
		return pat.matcher(email).matches();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mesaj = "";
		String nume = request.getParameter(("nume"));
		if (StringUtils.isNotEmpty(nume)) {
			if (!StringUtils.isAlphaSpace(nume)) {
				mesaj = "Numele nu poate contine caractere speciale";
			}
		} else {
			mesaj = "Trebuie sa introduci numele";
		}
		///
		String prenume = request.getParameter(("prenume"));
		if (StringUtils.isNotEmpty(prenume)) {
			if (!StringUtils.isAlphaSpace(prenume)) {
				mesaj = "Prenumele nu poate contine caractere speciale";
			}
		} else {
			mesaj = "Trebuie sa introduci prenumele";
		}
		///
		String email = request.getParameter(("email"));
		if (StringUtils.isNotEmpty(email)) {
			if (!isValid(email)) {
				mesaj = "Emailul nu este valid";
			}
		} else {
			mesaj = "Trebuie sa introduci emailul";
		}
		///
		String parola = request.getParameter(("parola"));
		if (StringUtils.isNotEmpty(parola)) {
			if (parola.length() < 8) {
				mesaj = "Parola trebuie sa aibe minim 8 caractere";
			}
		} else {
			mesaj = "Trebuie sa introduci parola";
		}
		///
		String parola2 = request.getParameter(("parola2"));
		if (StringUtils.isNotEmpty(parola2)) {
			if (parola2.length() < 8) {
				mesaj = "Parola trebuie sa aibe minim 8 caractere";
			}
		} else {
			mesaj = "Trebuie sa repeti parola";
		}
		///
		if (!parola.equals(parola2)) {
			mesaj = "Parolele nu coincid";
		}
		///
		String telefon = request.getParameter(("telefon"));
		if (StringUtils.isNotEmpty(telefon)) {
			if (!StringUtils.isNumeric(telefon)) {
				mesaj = "Telefonul poate contine doar cifre";
			}
			if (telefon.length() != 10) {
				mesaj = "Un numar de telefon are 10 cifre";
			}
		} else {
			mesaj = "Trebuie sa introduci numarul de telefon";
		}
		///
		String cnp = request.getParameter(("cnp"));
		if (StringUtils.isNotEmpty(cnp)) {
			if (!StringUtils.isNumeric(cnp)) {
				mesaj = "cnp poate contine doar cifre";
			}
			if (cnp.length() != 13) {
				mesaj = "Un cnp are 13 cifre";
			}
		} else {
			mesaj = "Trebuie sa introduci numarul de telefon";
		}
		///
		if (StringUtils.isNotEmpty(mesaj)) {
			request.setAttribute("mesaj", mesaj);
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		} else {
			parola = UsersUtils.stringMd5(parola);
			Users user = new Users();
			user.setFirstName(nume);
			user.setLastName(prenume);
			user.setPassword(parola);
			user.setEmail(email);
			user.setPhone(telefon);
			user.setRank(0);
			user.setVerified(true);
			user.setCnp(cnp);
			mesaj = "Contul a fost creat.Trebuie doar sa iti verifici mailul";
			UsersUtils.createUser(user);
			System.out.println(user);
			//sendMail(user.getEmail(), user.getIdUser() + StringUtils.reverse(parola));
			request.setAttribute("mesaj", mesaj);
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}


}
