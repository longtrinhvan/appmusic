package com.appmusic.controller.view.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.appmusic.Dao.MusicDao;
import com.appmusic.model.Music;

@Controller
public class MainController {

	private MusicDao musicDao;

	public MainController() {
		musicDao = new MusicDao();
	}

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public String index(Model model) {
//        String message = "Hello Spring Boot + JSP";
//        model.addAttribute("message", message);
		return "login";
	}

	@RequestMapping(value = { "/test" }, method = RequestMethod.GET)
	public String test(Model model) {
		return "test";
	}

	@RequestMapping(value = { "/music" }, method = RequestMethod.GET)
	public String musicPage(Model model) {
		return "music";
	}

	@RequestMapping(value = { "/edit" }, method = RequestMethod.GET)
	public String music(Model model, @RequestParam String id) {
		Music music = musicDao.getMusic(Integer.parseInt(id));
		model.addAttribute("music", music);
		return "edit";
	}

}