package com.dwarf.service;

import com.dwarf.bean.ClientDetail;

public interface ClientDetailService {
	
	ClientDetail findByClientId(String clientId);
	
	ClientDetail findByClientSecret(String clientSecret);
	
}
