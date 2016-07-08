package com.dwarf.repository;

import com.dwarf.bean.ClientDetail;

@MyBatisRepository
public interface ClientDetailRepository {

	ClientDetail findOne(Long clientId);
	
	ClientDetail findByClientId(String clientId);
	
	ClientDetail findByClientSecret(String clientSecret);
}
