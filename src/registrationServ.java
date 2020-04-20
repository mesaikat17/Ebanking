import Database.DbConnect;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Database.DbConnect;

/**
 * Servlet implementation class registrationServ
 */
@WebServlet("/registrationServ")
public class registrationServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		String cname=request.getParameter("cname");
		String caddr=request.getParameter("caddr");
		String cph=request.getParameter("cph");
		String email=request.getParameter("email");
		String cdob=request.getParameter("cdob");
		String banktype=request.getParameter("banktype");
		
		String accid="ACC."+((int)(Math.random()*10000));
		String pin=Integer.toString(((int)(Math.random()*10000)));
		String status="PENDING";
		String balance="0";
		
		HttpSession ses=request.getSession();
		ses.setAttribute("accid", accid);
		
		Connection cn=DbConnect.getDb();
		String sql="insert into clientdb values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1,accid);
		ps.setString(2,cname);
		ps.setString(3,caddr);
		ps.setString(4,cph);
		ps.setString(5,email);
		ps.setString(6,banktype);
		ps.setString(7,cdob);
		ps.setString(8,pin);
		ps.setString(9,status);
		ps.setString(10,balance);
		ps.execute();
		
		
		
	
		
		RequestDispatcher rd=request.getRequestDispatcher("RegisterDisplay.jsp");
		rd.include(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
