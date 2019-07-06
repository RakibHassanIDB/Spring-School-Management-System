/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rakib.sms.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 *
 * @author User
 */
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    
    @Autowired
    private DataSource dataSource;
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        
        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/adminpanel").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/teacherpanel").access("hasRole('ROLE_TEACHER')")
                .antMatchers("/studentpanel").access("hasRole('ROLE_STUDENT')")
                .antMatchers("/guardianpanel").access("hasRole('ROLE_GUARDIAN')")                
                .antMatchers("/showingacademicyearpage").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/showingclassnamepage").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/showsectionpage").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/showclassteacherpage").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/showaddmarkpage").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/studentmarksaddpage").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/studentprofilelink").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_STUDENT') or hasRole('ROLE_TEACHER')")
                .and().formLogin().loginPage("/login").loginProcessingUrl("/perform_login")
                .successForwardUrl("/loginsuccess").usernameParameter("usename")
                .passwordParameter("userpassword").failureUrl("/login")
                .and().logout().logoutUrl("/logout")
                .logoutSuccessUrl("/login").invalidateHttpSession(true)
                .and().csrf().disable();
    }
    
    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
        System.out.println("in security.............");
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select emailid, password, status from UserRole where emailid=? and status='True'")
                .authoritiesByUsernameQuery("select emailid,role from UserRole where emailid=?");
    }
    
}
