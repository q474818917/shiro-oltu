package com.dwarf.service.impl;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dwarf.service.ClientDetailService;
import com.dwarf.service.OAuth2Service;

@Service
public class OAuth2ServiceImpl implements OAuth2Service {
	
	private Cache cache;
	
	@Autowired
	private ClientDetailService clientDetailService;
	
	@Autowired
    public OAuth2ServiceImpl(CacheManager cacheManager) {
        this.cache = cacheManager.getCache("code-cache");
    }

	@Override
	public boolean checkAuthCode(String authCode) {
		return cache.get(authCode) != null;
	}

	@Override
	public boolean checkAccessToken(String accessToken) {
		return cache.get(accessToken) != null;
	}

	@Override
	public boolean checkClientId(String clientId) {
		return clientDetailService.findByClientId(clientId) != null;
	}

	@Override
	public boolean checkClientSecret(String clientSecret) {
		return clientDetailService.findByClientSecret(clientSecret) != null;
	}

	@Override
	public long getExpireIn() {
		return 3600L;
	}

	@Override
	public String getUsernameByAuthCode(String authCode) {
		return (String)cache.get(authCode);
	}

	@Override
	public String getUsernameByAccessToken(String accessToken) {
		return (String)cache.get(accessToken);
	}

	@Override
	public void addAuthCode(String authCode, String username) {
		cache.put(authCode, username);
	}

	@Override
	public void addAccessToken(String accessToken, String username) {
		cache.put(accessToken, username);
	}
	
	

}
