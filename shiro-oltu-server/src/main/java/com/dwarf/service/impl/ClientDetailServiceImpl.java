package com.dwarf.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dwarf.bean.ClientDetail;
import com.dwarf.repository.ClientDetailRepository;
import com.dwarf.service.ClientDetailService;

@Service
public class ClientDetailServiceImpl implements ClientDetailService {
	
	@Autowired
	private ClientDetailRepository clientDetailRepository;
	
	@Override
	public ClientDetail findByClientId(String clientId) {
		return clientDetailRepository.findByClientId(clientId);
	}

	@Override
	public ClientDetail findByClientSecret(String clientSecret) {
		return clientDetailRepository.findByClientSecret(clientSecret);
	}
	
}
