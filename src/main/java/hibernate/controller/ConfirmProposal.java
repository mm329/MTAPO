package hibernate.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.util.StringUtils;
import hibernate.util.Methods;

/**
 * Servlet implementation class ConfirmProposal
 */
@WebServlet("/ConfirmProposal")
public class ConfirmProposal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmProposal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String propose = request.getParameter("propose");
		String approved = request.getParameter("idProposalApproved");
		System.out.println("APPROVED " + approved);
		String rejected = request.getParameter("idProposalRejected");
		int idProposalApproved = approved != null ? Integer.parseInt(approved) : 0;
		int idProposalRejected = rejected != null ? Integer.parseInt(rejected) : 0;
		Methods methods = new Methods();

		if (idProposalApproved != 0 && !StringUtils.isEmptyOrWhitespaceOnly(approved)) {
			methods.approvedOrRejected(idProposalApproved, Methods.APPROVED_STATUS);
			System.out.println(Methods.APPROVED_STATUS);

			// tema a fost aprobata si se va salva in tabela themes
			methods.addThemes(propose, "");
			request.setAttribute("mesajApproved", "Please add a teacher's name to the approved assignment!");
			request.getRequestDispatcher("/editThemes.jsp").forward(request, response);

		} else if (idProposalRejected != 0 && !StringUtils.isEmptyOrWhitespaceOnly(rejected)){
			methods.approvedOrRejected(idProposalRejected, Methods.REJECTED_STATUS);
			System.out.println(Methods.REJECTED_STATUS);
			RequestDispatcher rs = request.getRequestDispatcher("confirmProposal.jsp");
			rs.include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
