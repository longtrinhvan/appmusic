package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Role;

public class RoleDao extends ConnectMysql {

	public List<Role> getAllRole() {

		var result = new ArrayList<Role>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM role ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {

				Role role = new Role();
				role.idrole = rs.getInt("idrole");
				role.namerole = rs.getString("namerole");
				result.add(role);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
