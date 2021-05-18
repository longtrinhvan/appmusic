package com.appmusic.controller.view.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

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
		return "musicpage";
	}

}