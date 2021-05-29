package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Account;
import com.appmusic.model.Role;

public class AccountDao extends ConnectMysql {

	public Account getAccount(String name) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from account, role where account.idrole= role.idrole and  account.name = '" + name + "'");
			while (rs.next()) {
				Account account = new Account();
				account.id = rs.getInt("id");
				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				account.name = rs.getString("name");
				account.fullname = rs.getString("fullname");
				account.password = rs.getString("password");
				account.image = rs.getString("image");
				account.isdelete = rs.getInt("isdelete");
				return account;
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public List<Account> getAccountpageSize(int indexPage) {

		var result = new ArrayList<Account>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM account , role where account.idrole= role.idrole and isdelete = 0 ORDER BY id DESC LIMIT "
					+ indexPage * 15 + "," + (indexPage + 1 * 15);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Account account = new Account();
				account.id = rs.getInt("id");
				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				account.role = role;
				account.name = rs.getString("name");
				account.fullname = rs.getString("fullname");
				account.password = rs.getString("password");
				account.image = rs.getString("image");
				account.isdelete = rs.getInt("isdelete");
				result.add(account);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

	public String deleteAccount(int id) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " update account set isdelete = ?  where id = ?";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setInt(1, 1);
			preparedStmt.setInt(2, id);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}

	public String updateAccount(Account account) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " update account set name = ?, idrole =?, fullname = ?, password = ?, image = ? where id = ?";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString(1, account.name);
			preparedStmt.setInt(2, account.role.idrole);
			preparedStmt.setString(3, account.fullname);
			preparedStmt.setString(4, account.password);
			preparedStmt.setString(5, account.image);
			preparedStmt.setInt(6, account.id);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}

	public String register(Account account) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " INSERT INTO account(idrole,name,fullname,password,image,isdelete) VALUES(?,?,?,?,?,?);";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setInt(1, 2);
			preparedStmt.setString(2, account.name);
			preparedStmt.setString(3, account.fullname);
			preparedStmt.setString(4, account.password);
			preparedStmt.setString(5, account.image);
			preparedStmt.setInt(6, 0);
			preparedStmt.execute();
			conn.close();
			return "insert";
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}

	public List<Account> searchAccountpageSize(String name) {

		int pageSize = 15;
		var result = new ArrayList<Account>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM account , role where account.idrole= role.idrole and account.isdelete = 0 and account.name LIKE '%"
					+ name + "%' ORDER BY id DESC LIMIT " + 0 * pageSize + "," + (0 + 1 * pageSize);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Account account = new Account();
				account.id = rs.getInt("id");
				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				account.role = role;
				account.name = rs.getString("name");
				account.fullname = rs.getString("fullname");
				account.password = rs.getString("password");
				account.image = rs.getString("image");
				account.isdelete = rs.getInt("isdelete");
				result.add(account);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
