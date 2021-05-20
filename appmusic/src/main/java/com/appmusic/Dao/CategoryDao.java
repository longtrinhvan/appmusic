
package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Category;

public class CategoryDao extends ConnectMysql {

	public List<Category> getAllCategory() {

		var result = new ArrayList<Category>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM category ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {

				Category category = new Category();
				category.idcategory = rs.getInt("idcategory");
				category.namecategory = rs.getString("namecategory");
				result.add(category);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
