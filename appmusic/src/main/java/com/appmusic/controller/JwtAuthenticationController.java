package com.appmusic.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.appmusic.config.JwtTokenUtil;
import com.appmusic.model.Account;
import com.appmusic.model.Role;
import com.appmusic.service.JwtUserDetailsService;

@RestController
@CrossOrigin
public class JwtAuthenticationController {

	@Autowired
	private AuthenticationManager authenticationManager;

	@Autowired
	private JwtTokenUtil jwtTokenUtil;

	@Autowired
	private JwtUserDetailsService userDetailsService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<Account> createAuthenticationToken(@RequestBody Account authenticationRequest,
			HttpServletResponse response) throws Exception {
			authenticate(authenticationRequest.name, authenticationRequest.password);
			final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.name);
			final String token = "Bearer " + jwtTokenUtil.generateToken(userDetails);
			response.addHeader("Authorization", token);
			authenticationRequest.token = token;

			return ResponseEntity.ok(authenticationRequest);
	}

	private void authenticate(String username, String password) throws Exception {
		try {
			authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(username, password));
		} catch (DisabledException e) {
			throw new Exception("USER_DISABLED", e);
		} catch (BadCredentialsException e) {
			throw new Exception("INVALID_CREDENTIALS", e);
		}
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<Account> createAccount(@RequestBody Account account, HttpServletResponse response)
			throws Exception {
		Role role = new Role();
		account.role = role;
		userDetailsService.register(account);
		return ResponseEntity.ok(account);
	}
}