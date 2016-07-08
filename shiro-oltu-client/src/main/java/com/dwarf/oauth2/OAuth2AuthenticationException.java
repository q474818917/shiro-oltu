package com.dwarf.oauth2;

import org.apache.shiro.authc.AuthenticationException;

public class OAuth2AuthenticationException extends AuthenticationException {

    public OAuth2AuthenticationException(Throwable cause) {
        super(cause);
    }
}
