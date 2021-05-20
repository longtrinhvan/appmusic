package com.appmusic.controller;

import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.appmusic.Dao.AlbumDao;
import com.appmusic.model.Album;


@RestController
@Configuration
@RefreshScope
@RequestMapping("/apialbum")
public class AlbumController {

	private AlbumDao albumDao;

	public AlbumController() {
		albumDao = new AlbumDao();
	}

	@RequestMapping(value = "/searchnamealbum", method = RequestMethod.GET)
	public ResponseEntity<Album> searchNameAlbum(String namealbum) {
		Album album = null;
		var status = HttpStatus.OK;
		try {
			album = albumDao.searchAlbum(namealbum);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(album, null, status);
	}
}
