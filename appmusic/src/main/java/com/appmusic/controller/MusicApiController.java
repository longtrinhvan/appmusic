package com.appmusic.controller;

import java.util.List;

import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.appmusic.Dao.MusicDao;
import com.appmusic.model.Music;

@RestController
@Configuration
@RefreshScope
@RequestMapping("/apimusic")
public class MusicApiController {

	private MusicDao musicDao;

	public MusicApiController() {
		musicDao = new MusicDao();
	}

	@RequestMapping(value = "/getallmusic", method = RequestMethod.GET)
	public ResponseEntity<List<Music>> getAllMusic() {
		List<Music> music = null;
		var status = HttpStatus.OK;
		try {
			music = musicDao.getAllMusic();
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(music, null, status);
	}

	@RequestMapping(value = "/getmusic", method = RequestMethod.GET)
	public ResponseEntity<Music> getMusic(int id) {
		Music music = null;
		var status = HttpStatus.OK;
		try {
			music = musicDao.getMusic(id);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(music, null, status);
	}

	@RequestMapping(value = "/getmusic-page", method = RequestMethod.GET)
	public ResponseEntity<List<Music>> getMusicpageSize(int id) {
		List<Music> music = null;
		var status = HttpStatus.OK;
		try {
			music = musicDao.getMusicpageSize(id);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(music, null, status);
	}

	@RequestMapping(value = "/deletemusic", method = RequestMethod.POST)
	public ResponseEntity<String> deleteMusic(@RequestBody Music music) {
		var result = "deletesuccess";
		var status = HttpStatus.OK;
		try {
			musicDao.deleteMusic(music.id);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(result, null, status);
	}

	@RequestMapping(value = "/insertmusic", method = RequestMethod.POST)
	public ResponseEntity<Music> insertMusic(@RequestBody Music music) {
		var status = HttpStatus.OK;
		try {
			musicDao.insertMusic(music);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(music, null, status);
	}

	@RequestMapping(value = "/updatemusic", method = RequestMethod.POST)
	public ResponseEntity<Music> updateMusic(@RequestBody Music music) {
		var status = HttpStatus.OK;
		try {
			musicDao.updateMusic(music);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(music, null, status);
	}
}
