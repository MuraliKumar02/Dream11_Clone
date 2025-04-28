package com.dream11.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

import javax.crypto.SecretKey;
import java.util.Date;

public class JWT {

    private static final String SEC_KEY = "neverEverGiveUpBroTryMoreUntilYouDie";

    private static final long EXPIRATION_TIME_MS = 3 * 60 * 60 * 1000;

    private static SecretKey getSigningKey() {
        return Keys.hmacShaKeyFor(SEC_KEY.getBytes());
    }



    private static Claims extractAllClaims(String token) {
        return Jwts.parser()
                .verifyWith(getSigningKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }


    public static String generateToken(String userId, int role) {

        return Jwts.builder()
                .subject(userId)
                .claim("role", role)
                .issuedAt(new Date())
                .expiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME_MS))
                .signWith(getSigningKey())
                .compact();
    }

    public static String getUserId(String token) {
        return extractAllClaims(token).getSubject();
    }

    public static String getRole(String token) {
        return extractAllClaims(token).get("role", String.class);
    }






}
