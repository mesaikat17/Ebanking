

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
 * Servlet implementation class WithdrawServ
 */
@WebServlet("/WithdrawServ")
public class WithdrawServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			
			Connection cn=DbConnect.getDb();
			
			String withdraw=request.getParameter("withdraw");
			String date=request.getParameter("date");
			String deposite="-";
			String trnid="TRANID."+((int)(Math.random()*1000));
			
			HttpSession session= request.getSession(false);
			
			String accntid=(String)session.getAttribute("accid");
			
			HttpSession ses=request.getSession();
			ses.setAttribute("accid",accntid);
			ses.setAttribute("wd",withdraw);
			
			//PrintWriter ot=response.getWriter();
			//ot.println(accntid);
			//ot.println(withdraw);
			
			String sql1="insert into PASSBOOK values(?,?,?,?,?,?)";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setString(1,accntid);
			ps1.setString(2,date);
			ps1.setString(3,deposite);
			ps1.setString(4, withdraw);
			ps1.setString(5, "0");
			ps1.setString(6, trnid);
			
			ses.setAttribute("trnid", trnid);
			
			
			
			ps1.execute();
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("balanceW.jsp");
			rd.include(request, response);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
