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

	public List<Account> getAllAccount() {

		var result = new ArrayList<Account>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM account , role where account.idrole= role.idrole and isdelete = 0 ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Account account = new Account();
				account.id = rs.getInt("id");
				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				account.idrole = rs.getInt("idrole");
				account.name = rs.getString("name");
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

	public Account getAccount(String name) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from account, role where account.idrole= role.idrole and  name = '" + name + "'");
			while (rs.next()) {
				Account account = new Account();
				account.id = rs.getInt("id");
				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				account.idrole = rs.getInt("idrole");
				account.name = rs.getString("name");
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
					+ indexPage * 4 + "," + (indexPage + 1 * 4);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Account account = new Account();
				account.id = rs.getInt("id");
				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				account.idrole = rs.getInt("idrole");
				account.name = rs.getString("name");
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

	public String updateAccount(Account Account) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " update Account set name = ?, idalbum =?, idcategory = ?, url= ?, image = ? where id = ?";
			PreparedStatement preparedStmt = conn.prepareStatement(query);

			preparedStmt.setInt(6, Account.id);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}

	public String insertAccount(Account account) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " INSERT INTO account(name,idalbum,idcategory,url,image,isdelete) VALUES(?,?,?,?,?,?)";
			PreparedStatement preparedStmt = conn.prepareStatement(query);

			preparedStmt.setInt(6, 0);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}
}
