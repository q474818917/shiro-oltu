package com.dwarf.service;

import com.dwarf.bean.User;

public interface UserService {
	
	User findByUsername(String username);
	
}
