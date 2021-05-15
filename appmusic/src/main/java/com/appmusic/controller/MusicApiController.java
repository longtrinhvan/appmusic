package com.appmusic.controller;

import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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


	@RequestMapping(value = "/getmusic", method = RequestMethod.GET)
	public ResponseEntity<Music> getmusic(int id) {
		Music music = null;
		var status = HttpStatus.OK;
		try {
			music = musicDao.getmusic(1);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(music, null, status);
	}
}
