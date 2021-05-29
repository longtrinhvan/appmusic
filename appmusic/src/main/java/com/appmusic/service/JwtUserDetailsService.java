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
import com.appmusic.model.Account;

@Service
public class JwtUserDetailsService implements UserDetailsService {

	private AccountDao accountDao;

	public JwtUserDetailsService() {
		accountDao = new AccountDao();
	}

	@Autowired
	private PasswordEncoder bcryptEncoder;

	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		Account account = null;
		try {
			account = accountDao.getAccount(name);
		} catch (Exception e) {

		}
		if (account.name != null) {
			return new User(account.name, account.password, new ArrayList<>());
		} else {
			throw new UsernameNotFoundException("User not found with username: " + name);
		}
	}

	public Account encode(Account account) {
		account.password = bcryptEncoder.encode(account.password);
		return account;
	}

	public String register(Account account) {
		account.password = bcryptEncoder.encode(account.password);
		String insert = accountDao.register(account);
		return insert;
	}
}