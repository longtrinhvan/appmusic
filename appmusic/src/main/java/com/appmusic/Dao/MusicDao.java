package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Music;

public class MusicDao extends ConnectMysql {

	public List<Music> getAllMusic() {

		var result = new ArrayList<Music>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM music WHERE isdelete = 4 ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt(1);
				music.name = rs.getString(2);
				music.category = rs.getString(3);
				music.url = rs.getString(4);
				music.image = rs.getString(5);
				music.isdelete = rs.getInt(6);
				result.add(music);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

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
				music.isdelete = rs.getInt(6);
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
			var query = "SELECT * FROM appmusic.music WHERE isdelete = 0 ORDER BY id DESC LIMIT " + indexPage * 4 + ","
					+ (indexPage + 1 * 4);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt(1);
				music.name = rs.getString(2);
				music.category = rs.getString(3);
				music.url = rs.getString(4);
				music.image = rs.getString(5);
				music.isdelete = rs.getInt(6);
				result.add(music);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}

	public String deleteMusic(int id) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " update music set isdelete = ?  where id = ?";
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

	public String updateMusic(Music music) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " update music set name = ?, category = ?, url= ?, image = ? where id = ?";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString(1, music.name);
			preparedStmt.setString(2, music.category);
			preparedStmt.setString(3, music.url);
			preparedStmt.setString(4, music.image);
			preparedStmt.setInt(5, music.id);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}

	public String insertMusic(Music music) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " INSERT INTO music(name,category,url,image,isdelete) VALUES(?,?,?,?,?)";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString(1, music.name);
			preparedStmt.setString(2, music.category);
			preparedStmt.setString(3, music.url);
			preparedStmt.setString(4, music.image);
			preparedStmt.setInt(5, 0);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "deletesuccess ";
	}
}
