package com.appmusic.controller;

import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.appmusic.common.Login;
import com.appmusic.model.Account;

@RestController
@Configuration
@RefreshScope
@RequestMapping("/apiaccount")
public class AccountApiController {

	@RequestMapping(value = "/getaccountlogin", method = RequestMethod.GET)
	public ResponseEntity<Account> getAccount() {
		var status = HttpStatus.OK;
		try {
			Account account = new Account();
			account.fullname = Login.account.fullname;
			account.image = Login.account.image;
			return new ResponseEntity<>(account, null, status);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return null;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ResponseEntity<String> logout() {
		var status = HttpStatus.OK;
		try {
			Login.account.token = null;
			return new ResponseEntity<>("Bạn đã thoát khỏi hệ thống", null, status);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return null;
	}

}
