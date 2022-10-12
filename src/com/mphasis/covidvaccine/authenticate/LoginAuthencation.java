package com.mphasis.covidvaccine.authenticate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginAuthencation {
public  boolean authenticate(int username,String passwd)

{
	
	 try
     {
	
	   Class.forName("com.mysql.cj.jdbc.Driver");	
	   Connection con=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/myDB?useSSL=false","scott","tiger");
	   PreparedStatement pstmt=con.prepareStatement("SELECT password FROM Authenticate  WHERE mobileNo= ?");
		  pstmt.setInt(1,username);
		  ResultSet rs=pstmt.executeQuery();
		  while(rs.next())
			{
			
			  if(passwd.equals(rs.getString(1)))
				{
					
					return true;
				}
			}
			
		}
				
		  catch(Exception E)
			 {
				 E.printStackTrace();
			 }
	
		return false;
	
}

public void addcred(int username,String passwd)

{
	int i=4;
	i++;
	 try
     {
	
	   Class.forName("com.mysql.cj.jdbc.Driver");	
	   Connection con=DriverManager.getConnection
			("jdbc:mysql://localhost:3306/myDB?useSSL=false","scott","tiger");
	   PreparedStatement pstmt=con.prepareStatement("INSERT INTO Authenticate VALUES(?,?,?)");
		  pstmt.setInt(1,i);
		  pstmt.setInt(2,username);
		  pstmt.setString(3,passwd);
		 pstmt.executeUpdate();
		  
     }
	 catch(Exception E)
	 {
		 E.printStackTrace();
	 }

}
}