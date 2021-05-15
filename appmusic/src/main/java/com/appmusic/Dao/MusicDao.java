package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Music;

public class MusicDao extends ConnectMysql {

	public Music getmusic(int id) {
		try {

			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from music where id" + id);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt(1);
				music.name = rs.getString(2);
				music.url = rs.getString(3);
				music.image = rs.getString(4);
				return music;
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
