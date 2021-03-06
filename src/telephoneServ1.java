import Database.DbConnect;

import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

/**
 * Servlet implementation class telephoneServ1
 */
@WebServlet("/telephoneServ1")
public class telephoneServ1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			HttpSession ses=request.getSession(false);
			String accid=(String)ses.getAttribute("accid");
			Connection cn=DbConnect.getDb();
			
			String deposite="-";
			String date=request.getParameter("date");
			String withdraw=request.getParameter("deposite");
			String trnid="TELEID."+((int)(Math.random()*1000));
			
			String ph=request.getParameter("ph");
			String id=request.getParameter("id1");
			
			String sql1="insert into PASSBOOK values(?,?,?,?,?,?)";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1,accid);
			ps1.setString(2,date);
			ps1.setString(3,deposite);
			ps1.setString(4, withdraw);
			ps1.setString(5, "0");
			ps1.setString(6, trnid);
			
			ses.setAttribute("trnid", trnid);
			ses.setAttribute("accid", accid);
			ses.setAttribute("wd", withdraw);
			ses.setAttribute("ph", ph);
			ses.setAttribute("id1", id);
			ps1.execute();
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("telephoneW.jsp");
			rd.include(request, response);
		}
		catch(Exception e){}
	}

}
