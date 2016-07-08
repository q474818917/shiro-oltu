package com.dwarf.service;

public interface OAuth2Service {
	
	boolean checkAuthCode(String authCode);
    boolean checkAccessToken(String accessToken);
    boolean checkClientId(String clientId);
    boolean checkClientSecret(String clientSecret);
    
    long getExpireIn();
    String getUsernameByAuthCode(String authCode);
    String getUsernameByAccessToken(String accessToken);
    
    void addAuthCode(String authCode, String username);
    void addAccessToken(String accessToken, String username);
}
