package com.appmusic.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.appmusic.Dao.AccountDao;
import com.appmusic.Dao.RoleDao;
import com.appmusic.model.Account;
import com.appmusic.model.Role;
import com.appmusic.service.JwtUserDetailsService;

@RestController
@Configuration
@RefreshScope
@RequestMapping("/apiaccount")
public class AccountApiController {

	private RoleDao roleDao;
	private AccountDao accountDao;

	@Autowired
	private JwtUserDetailsService userDetailsService;
	
	public AccountApiController() {
		roleDao = new RoleDao();
		accountDao = new AccountDao();
	}

	@RequestMapping(value = "/getaccountlogin", method = RequestMethod.GET)
	public ResponseEntity<Account> getAccountLogin() {
		var status = HttpStatus.OK;
		Account account = null;
		try {
			UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			String username = userDetails.getUsername();
			account = accountDao.getAccount(username);
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
			// Login.account.token = null;
			return new ResponseEntity<>("Bạn đã thoát khỏi hệ thống", null, status);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return null;
	}

	@RequestMapping(value = "/getaccount", method = RequestMethod.GET)
	public ResponseEntity<Account> getAccountByID(int id) {
		Account account = null;
		var status = HttpStatus.OK;
		try {
			account = accountDao.getAccountByID(id);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(account, null, status);
	}

	@RequestMapping(value = "/getallrole", method = RequestMethod.GET)
	public ResponseEntity<List<Role>> getAllRole() {

		List<Role> role = new ArrayList<>();
		var status = HttpStatus.OK;
		try {
			role = roleDao.getAllRole();
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(role, null, status);
	}

	@RequestMapping(value = "/getaccountpagesize", method = RequestMethod.GET)
	public ResponseEntity<List<Account>> getAccountpageSize(int page) {

		List<Account> account = new ArrayList<>();
		var status = HttpStatus.OK;
		try {
			account = accountDao.getAccountpageSize(page);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(account, null, status);
	}

	@RequestMapping(value = "/deleteaccount", method = RequestMethod.POST)
	public ResponseEntity<String> deleteMusic(@RequestBody Account account) {
		var result = "deletesuccess";
		var status = HttpStatus.OK;
		try {
			accountDao.deleteAccount(account.id);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(result, null, status);
	}

	@RequestMapping(value = "/insertaccount", method = RequestMethod.POST)
	public ResponseEntity<Account> insertAccount(@RequestBody Account account) {
		var status = HttpStatus.OK;
		try {
			accountDao.insertAccount(userDetailsService.encode(account));
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(account, null, status);
	}

	@RequestMapping(value = "/updateaccount", method = RequestMethod.POST)
	public ResponseEntity<Account> updateAccount(@RequestBody Account account) {
		var status = HttpStatus.OK;
		try {
			accountDao.updateAccount(account);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(account, null, status);
	}

	@RequestMapping(value = "/searchaccountpagesize", method = RequestMethod.GET)
	public ResponseEntity<List<Account>> searchMusicpageSize(String name) {
		List<Account> account = null;
		var status = HttpStatus.OK;
		try {
			account = accountDao.searchAccountpageSize(name);
		} catch (Throwable e) {
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<>(account, null, status);
	}
}
