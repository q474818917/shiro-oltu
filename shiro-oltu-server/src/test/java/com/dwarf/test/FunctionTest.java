package com.dwarf.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.dwarf.repository.ClientDetailRepository;
import com.dwarf.repository.UserRepository;
import com.dwarf.service.UserService;


/**
 * 测试时需将WebSocketConfig注解注释掉
 * @author jiyu
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/resources/applicationContext*.xml"})
public class FunctionTest {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ClientDetailRepository clientDetailRepository;
	
	@Autowired
	private UserService userService;
	
	@Test
	public void test(){
		
		userService.findByUsername("admin");
	}
	
	
}
