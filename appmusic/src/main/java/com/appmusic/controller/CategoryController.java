package com.appmusic.controller;

import java.util.List;

import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.appmusic.Dao.CategoryDao;
import com.appmusic.model.Category;

@RestController
@Configuration
@RefreshScope
@RequestMapping("/apicategory")
public class CategoryController {

	private CategoryDao categoryDao;

	public CategoryController() {
		categoryDao = new CategoryDao();
	}

	@RequestMapping(value = "/getallcategory", method = RequestMethod.GET)
	public ResponseEntity<List<Category>> getAllCategory() {
		List<Category> category = null;
		var status = HttpStatus.OK;
		try {
			category = categoryDao.getAllCategory();
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(category, null, status);
	}
}
