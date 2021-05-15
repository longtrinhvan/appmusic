package com.appmusic.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectMysql {
	  public final static String DB_URL = "jdbc:mysql://localhost:3306/appmusic";
	  public final static String USER_NAME = "root";
	  public final static String PASSWORD = "123456"; 
	  
	  public static Connection getConnection(String dbURL, String userName, 
	            String password) {
	        Connection conn = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            conn = DriverManager.getConnection(dbURL, userName, password);
	            System.out.println("connect successfully!");
	        } catch (Exception ex) {
	            System.out.println("connect failure!");
	            ex.printStackTrace();
	        }
	        return conn;
	    }
}
