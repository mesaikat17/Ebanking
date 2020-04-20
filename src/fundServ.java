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

import Database.*;
/**
 * Servlet implementation class fundServ
 */
@WebServlet("/fundServ")
public class fundServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=DbConnect.getDb();
			HttpSession session=request.getSession(false);
			String deposite=(String)session.getAttribute("deposite");
			String accid=(String)session.getAttribute("accid");
			String acctr=(String)session.getAttribute("acctr");
			String trnid=(String)session.getAttribute("trnid");
			
			System.out.println(deposite+" "+accid+" "+acctr+" "+trnid);
			/*PrintWriter ot=response.getWriter();
			ot.println("A="+accid);
			
			ot.println("B= "+acctr);*/
			
			
			//WITHDRAW PART
			int balnn=0;
			String balancew="";
			
			String sql3="select balance from clientdb where accid =?";
			PreparedStatement ps3=cn.prepareStatement(sql3);
			ps3.setString(1, accid);
			ResultSet rs3=ps3.executeQuery();
			while(rs3.next()){
				balancew=rs3.getString(1);
				//ot.println(balance);
				balnn=Integer.parseInt(balancew);
				balnn=balnn-(Integer.parseInt(deposite));
				if(balnn>0){
				balancew=Integer.toString(balnn);
								
				String sql4="update clientdb set balance=? where accid =?";
				PreparedStatement ps4=cn.prepareStatement(sql4);
				ps4.setString(1,balancew);
				ps4.setString(2,accid);
				ps4.execute();
				
				String sql5="update passbook set balance=? where trnid =? and accid=?";
				PreparedStatement ps5=cn.prepareStatement(sql5);
				ps5.setString(1,balancew);
				ps5.setString(2,trnid);
				ps5.setString(3,accid);
				ps5.execute();
			
			}
				else{
					System.out.println("Insufficient Balance");
				}
		
			}
		
			
			//DEPOSITE PART
			int baln=0;
			String balance="";
			System.out.println("Balance out = "+balnn);
			if(balnn>0){
				System.out.println("Balance in = "+balnn);
			
			String sql="select balance from clientdb where accid =?";
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setString(1, acctr);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				balance=rs.getString(1);
				//ot.println(balance);
				baln=Integer.parseInt(balance);
				
				baln=baln+(Integer.parseInt(deposite));
				balance=Integer.toString(baln);
				System.out.println(balance);
				
				
				
				String sql1="update clientdb set balance=? where accid =?";
				PreparedStatement ps1=cn.prepareStatement(sql1);
				ps1.setString(1,balance);
				ps1.setString(2,acctr);
				ps1.execute();
				
				String sql2="update passbook set balance=? where trnid =? and accid=?";
				PreparedStatement ps2=cn.prepareStatement(sql2);
				ps2.setString(1,balance);
				ps2.setString(2,trnid);
				ps2.setString(3,acctr);
				ps2.execute();
				}
				
			String operation="Fund Transfer of Rs "+deposite+" to "+acctr+" is Successfully ";
			session.setAttribute("operation", operation);
			
			RequestDispatcher rd=request.getRequestDispatcher("FundSuccess.jsp");
			rd.include(request, response);	
					
					
				}
			else{
				String sql4="delete from passbook where trnid=?";
				PreparedStatement ps4=cn.prepareStatement(sql4);
				ps4.setString(1,trnid);
				
				ps4.execute();
				
				String operation="DUE TO INSUFFICIENT FUND \n BALANCE WITHDRAWN NOT ";
				session.setAttribute("operation", operation);
				RequestDispatcher rd=request.getRequestDispatcher("operation.jsp");
				rd.include(request, response);
				
			}
				
			}

				
			catch(Exception e){}
				
	}

}
	
