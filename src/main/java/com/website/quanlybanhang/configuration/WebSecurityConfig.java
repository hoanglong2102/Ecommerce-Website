package com.website.quanlybanhang.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.website.quanlybanhang.service.impl.UserDetailsServiceImpl;

@EnableWebSecurity
@Configuration
@EnableGlobalMethodSecurity(securedEnabled = true, proxyTargetClass = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
	public UserDetailsService userDetailsService() {
		return new UserDetailsServiceImpl();
	};

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	};

	/*
	 * @Override protected void configure(AuthenticationManagerBuilder auth) throws
	 * Exception {
	 * auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder
	 * ()); }
	 */

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/", "/home/**", "/resources/**", "/uploads/**", "/listAllProductByManufacturers/**",
						"/thongtinchitietsanpham/**", "/login", "/error", "/shop/**", "/listAllProductByCategory/**",
						"/forgotPassword/**", "/resetPassword/**", "/changeNewPassword")
				.permitAll().antMatchers("/admin/user/**").hasRole("SUPER_ADMIN").antMatchers("/admin/**")
				.hasRole("AUTH").anyRequest().authenticated().and().formLogin().loginPage("/login")
				.defaultSuccessUrl("/admin/order/", true).failureUrl("/login?error").and().logout().permitAll()
				.logoutSuccessUrl("/login").and().csrf().disable();

	}
}