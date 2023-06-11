package bankManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bankManagement.dao.BankMethod;
import bankMangement.bean.Account;

@WebServlet("/")
public class bankServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public void init() throws ServletException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertUser(request, response);
				break;
			case "/deposit":
				depositeAmount(request,response);
				break;
			case "/withdraw":
					withdrawAmount(request,response);
				break;
			case "/details":
				showUserDetails(request,response);
				break;
			default:
				listUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Account> listUser = BankMethod.selectAllUsers();
		request.setAttribute("listUser", listUser);
		request.getRequestDispatcher("/userList.jsp").forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/userForm.jsp").forward(request, response);
	}
	
	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		BankMethod bankMethod=new BankMethod();
		int id=0;
		String name = request.getParameter("name");
		String accountId = request.getParameter("accountId");
		String bankType = request.getParameter("bankType");
		String amount = request.getParameter("amount");
		
		Account newUser = new Account(id,name, bankType,Integer.valueOf(accountId),Double.valueOf(amount));
		bankMethod.createAccount(newUser);
		response.sendRedirect("list");
	}
	private void showUserDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account users = BankMethod.userDetails(Integer.valueOf(request.getParameter("id")));
		request.setAttribute("User", users);
		request.getRequestDispatcher("/userDetails.jsp").forward(request, response);
	}
	private void depositeAmount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BankMethod bankMethod=new BankMethod();
		bankMethod.depositMoney(Integer.valueOf(request.getParameter("id")),Double.valueOf(request.getParameter("newAmount")),Double.valueOf(request.getParameter("amount")));
		response.sendRedirect("details?id="+Integer.valueOf(request.getParameter("id")));
	}
	private void withdrawAmount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		BankMethod bankMethod=new BankMethod();
		double amount=Double.valueOf(request.getParameter("amount"))-Double.valueOf(request.getParameter("newAmount"));
		if(amount < 0) {
			request.setAttribute("errorMessage", "Withdraw Amount is Exceeding Account Balance.");
			showUserDetails(request, response);
		}else {
			bankMethod.withdrawMoney(Integer.valueOf(request.getParameter("id")),Double.valueOf(request.getParameter("newAmount")),Double.valueOf(request.getParameter("amount")));
			response.sendRedirect("details?id="+Integer.valueOf(request.getParameter("id")));
		}
	}
}
