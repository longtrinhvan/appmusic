package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Music;

public class MusicDao extends ConnectMysql {

	public Music getMusic(int id) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from music where id =" + id);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt(1);
				music.name = rs.getString(2);
				music.category = rs.getString(3);
				music.url = rs.getString(4);
				music.image = rs.getString(5);
				return music;
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public List<Music> getMusicpageSize(int indexPage) {

		var result = new ArrayList<Music>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM appmusic.music \r\n" + "ORDER BY id ASC\r\n" + "LIMIT " + indexPage * 4 + ","
					+ (indexPage + 1 * 4);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt(1);
				music.name = rs.getString(2);
				music.category = rs.getString(3);
				music.url = rs.getString(4);
				music.image = rs.getString(5);
				result.add(music);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
}
