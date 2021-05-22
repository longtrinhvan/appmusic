package com.appmusic.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.appmusic.common.ConnectMysql;
import com.appmusic.model.Album;
import com.appmusic.model.Category;
import com.appmusic.model.Music;

public class MusicDao extends ConnectMysql {

	public List<Music> getAllMusic() {

		var result = new ArrayList<Music>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM music as m, category as c,album as a\r\n"
					+ "WHERE c.idcategory = m.idcategory and a.idalbum = m.idalbum and m.isdelete = 4;";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt("id");
				music.name = rs.getString("name");
				music.url = rs.getString("url");
				music.image = rs.getString("image");
				music.isdelete = rs.getInt("isdelete");
				//
				Category category = new Category();
				category.idcategory = rs.getInt("idcategory");
				category.namecategory = rs.getString("namecategory");
				music.category = category;
				//
				Album album = new Album();
				album.idalbum = rs.getInt("idalbum");
				album.namealbum = rs.getString("namealbum");
				music.album = album;
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
			ResultSet rs = stmt.executeQuery("SELECT * FROM music as m, category as c,album as a "
					+ "WHERE c.idcategory = m.idcategory and a.idalbum = m.idalbum and m.id =" + id);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt("id");
				music.name = rs.getString("name");
				music.url = rs.getString("url");
				music.image = rs.getString("image");
				music.isdelete = rs.getInt("isdelete");
				//
				Category category = new Category();
				category.idcategory = rs.getInt("idcategory");
				category.namecategory = rs.getString("namecategory");
				music.category = category;
				//
				Album album = new Album();
				album.idalbum = rs.getInt("idalbum");
				album.namealbum = rs.getString("namealbum");
				music.album = album;
				return music;
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public List<Music> getMusicpageSize(int indexPage) {

		int pageSize = 15;
		var result = new ArrayList<Music>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM music as m, category as c,album as a "
					+ "WHERE c.idcategory = m.idcategory and a.idalbum = m.idalbum and  m.isdelete = 0 ORDER BY m.id DESC LIMIT "
					+ indexPage * pageSize + "," + (indexPage + 1 * pageSize);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt("id");
				music.name = rs.getString("name");
				music.url = rs.getString("url");
				music.image = rs.getString("image");
				music.isdelete = rs.getInt("isdelete");
				//
				Category category = new Category();
				category.idcategory = rs.getInt("idcategory");
				category.namecategory = rs.getString("namecategory");
				music.category = category;
				//
				Album album = new Album();
				album.idalbum = rs.getInt("idalbum");
				album.namealbum = rs.getString("namealbum");
				music.album = album;
				result.add(music);
			}
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return result;
	}
	
	public List<Music> searchMusicpageSize(String name) {

		int pageSize = 15;
		var result = new ArrayList<Music>();
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			Statement stmt = conn.createStatement();
			var query = "SELECT * FROM music as m, category as c,album as a WHERE c.idcategory = m.idcategory and a.idalbum = m.idalbum and  m.isdelete = 0 and m.name LIKE '%"+ name +"%' ORDER BY m.id DESC LIMIT "
					+ 0 * pageSize + "," + (0 + 1 * pageSize);
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Music music = new Music();
				music.id = rs.getInt("id");
				music.name = rs.getString("name");
				music.url = rs.getString("url");
				music.image = rs.getString("image");
				music.isdelete = rs.getInt("isdelete");
				//
				Category category = new Category();
				category.idcategory = rs.getInt("idcategory");
				category.namecategory = rs.getString("namecategory");
				music.category = category;
				//
				Album album = new Album();
				album.idalbum = rs.getInt("idalbum");
				album.namealbum = rs.getString("namealbum");
				music.album = album;
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
			String query = " update music set name = ?, idalbum =?, idcategory = ?, url= ?, image = ? where id = ?";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString(1, music.name);
			preparedStmt.setInt(2, music.album.idalbum);
			preparedStmt.setInt(3, music.category.idcategory);
			preparedStmt.setString(4, music.url);
			preparedStmt.setString(5, music.image);
			preparedStmt.setInt(6, music.id);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "updatesuccess ";
	}

	public String insertMusic(Music music) {
		try {
			Connection conn = getConnection(DB_URL, USER_NAME, PASSWORD);
			String query = " INSERT INTO music(name,idalbum,idcategory,url,image,isdelete) VALUES(?,?,?,?,?,?)";
			PreparedStatement preparedStmt = conn.prepareStatement(query);
			preparedStmt.setString(1, music.name);
			preparedStmt.setInt(2, music.album.idalbum);
			preparedStmt.setInt(3, music.category.idcategory);
			preparedStmt.setString(4, music.url);
			preparedStmt.setString(5, music.image);
			preparedStmt.setInt(6, 0);
			preparedStmt.execute();
			conn.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return "insertsuccess ";
	}
}
