package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Album;

public class AlbumDao extends ConnectMysql{
	
	public Album searchAlbum(String namealbum) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM album WHERE namealbum LIKE '"+ namealbum +"%' limit 1;";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Album album = new Album();
				album.idalbum = rs.getInt("idalbum");
				album.namealbum = rs.getString("namealbum");
				return album;
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

}
