import java.sql.*;

import Database.DbConnect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DbConnect;

/**
 * Servlet implementation class ClientServ
 */
@WebServlet("/ClientServ")
public class ClientServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String username = request.getParameter("user");
			String password = request.getParameter("pass");
			Connection cn=DbConnect.getDb();
			String sql= "select * from clientdb where accid = ? and pin = ?";
			
			PreparedStatement ps = cn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet s = ps.executeQuery();
			if(s.next()){
				
				String cname=s.getString(2);
				String caddr=s.getString(3);
				String balance=s.getString(10);
				HttpSession session = request.getSession();
				session.setAttribute("cname",cname);
				session.setAttribute("caddr",caddr);
				session.setAttribute("balance", balance);
				session.setAttribute("accid",username);
				if(s.getString(9).equals("CONFIRMED")){
				RequestDispatcher rd = request.getRequestDispatcher("platform.jsp");
				rd.forward(request, response);
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("ClientW.jsp");
					rd.include(request, response);
			}
			}
				else{
				RequestDispatcher rd = request.getRequestDispatcher("ClientW.jsp");
				rd.include(request, response);
			}
		
		}
			catch(Exception e){
				
			}
	}

}
