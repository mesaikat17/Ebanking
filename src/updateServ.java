import Database.DbConnect;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class updateServ
 */
@WebServlet("/updateServ")
public class updateServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			
			Connection cn=DbConnect.getDb();
			
			String caddr=request.getParameter("caddr");
			String cph=request.getParameter("cph");
			String email=request.getParameter("email");
			String pin=request.getParameter("pin");
			String oldpin=request.getParameter("oldpin");
			HttpSession session= request.getSession(false);
			
			String accid=(String)session.getAttribute("accid");
			
					
			String sql1="update clientdb set caddr=?,cph=?,email=?,pin=? where accid =?";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1,caddr);
			ps1.setString(2,cph);
			ps1.setString(3,email);
			ps1.setString(4, pin);
			ps1.setString(5, accid);
			
			ps1.execute();
			
			
			String operation="UPDATE OPERATION ";
			session.setAttribute("operation", operation);
			RequestDispatcher rd=request.getRequestDispatcher("operation.jsp");
			rd.include(request, response);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
