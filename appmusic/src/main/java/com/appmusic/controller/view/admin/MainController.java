package com.appmusic.controller.view.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/login" }, method = RequestMethod.GET)
	public String index(Model model) {
		return "login";
	}

	@RequestMapping(value = { "/music" }, method = RequestMethod.GET)
	public String musicPage(Model model) {
		return "music";
	}

	@RequestMapping(value = { "/account" }, method = RequestMethod.GET)
	public String account(Model model) {
		return "account";
	}

}