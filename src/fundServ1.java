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
 * Servlet implementation class fundServ1
 */
@WebServlet("/fundServ1")
public class fundServ1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			HttpSession session=request.getSession();
			String accid=(String)session.getAttribute("accid");
			
			String acctr=request.getParameter("acctr");
			String deposite=request.getParameter("deposite");
			String date=request.getParameter("date");
			String trnid="FUNDID."+((int)(Math.random()*1000));
			
			
			/*PrintWriter ot=response.getWriter();
			ot.println("A="+accid);
			
			ot.println("B= "+acctr);
			ot.println("C= "+deposite);
			*/
			
			
			session.setAttribute("accid", accid);
			session.setAttribute("acctr", acctr);
			session.setAttribute("deposite", deposite);
			session.setAttribute("trnid", trnid);
			
			Connection cn=DbConnect.getDb();
			//deposite
			String sql="insert into PASSBOOK values(?,?,?,?,?,?)";
			PreparedStatement ps1=cn.prepareStatement(sql);
			ps1.setString(1,acctr);
			ps1.setString(2,date);
			ps1.setString(3,deposite);
			ps1.setString(4,"-");
			ps1.setString(5, "0");
			ps1.setString(6, trnid);
			
			ps1.execute();
			
			//withdraw
			String sql2="insert into PASSBOOK values(?,?,?,?,?,?)";
			PreparedStatement ps2=cn.prepareStatement(sql2);
			ps2.setString(1,accid);
			ps2.setString(2,date);
			ps2.setString(3,"-");
			ps2.setString(4,deposite);
			ps2.setString(5, "0");
			ps2.setString(6, trnid);
			
			ps2.execute();
			System.out.println("Transaction Completed");
			RequestDispatcher rd=request.getRequestDispatcher("fundServ");
			rd.include(request, response);
		}
		catch(Exception e){}
	}

}
