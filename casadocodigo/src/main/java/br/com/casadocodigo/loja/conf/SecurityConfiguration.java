package br.com.casadocodigo.loja.conf;

import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
//	public class SecurityConfiguration{
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//	    http.authorizeRequests()
//	    .antMatchers("/produtos/form").hasRole("ADMIN")
//	    .antMatchers("/carrinho/**").permitAll()
//	    .antMatchers(HttpMethod.POST, "/produtos").hasRole("ADMIN")
//	    .antMatchers(HttpMethod.GET, "/produtos").hasRole("ADMIN")
//	    .antMatchers("/produtos/**").permitAll()
//	    .antMatchers("/").permitAll()
//	    .anyRequest().authenticated()
//	    .and().formLogin();
	}
}