package com.dwarf.repository;

import com.dwarf.bean.User;

@MyBatisRepository
public interface UserRepository {
	
	User findOne(Long userId);
	
	User findByUsername(String username);
}
