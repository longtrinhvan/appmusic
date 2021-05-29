package com.appmusic.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.appmusic.Dao.AccountDao;
import com.appmusic.common.Login;
import com.appmusic.model.Account;

@Service
public class JwtUserDetailsService implements UserDetailsService {

	private AccountDao accountDao;

	public JwtUserDetailsService() {
		accountDao = new AccountDao();
	}

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		Account account = null;
		try {
			account = accountDao.getAccount(name);
			Login.account.name = account.name;
			Login.account.id = account.id;
			Login.account.image = account.image;
			Login.account.fullname = account.fullname;
		} catch (Exception e) {

		}
		if (account.name != null) {
			return new User(account.name, account.password, new ArrayList<>());
		} else {
			throw new UsernameNotFoundException("User not found with username: " + name);
		}
	}

	public Account register(Account account) {
		Account result = new Account();
		result = account;
		result.password = passwordEncoder.encode(account.password);
		String insert = accountDao.register(account);
		if(insert.equals("insert")) {
			System.out.println(result.password);
		}
		return result;
	}
}