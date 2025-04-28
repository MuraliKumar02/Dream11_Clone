package com.dream11;

import com.dream11.security.JWT;

public class Main {

    public static void main(String[] args)    {


        String token = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMDAxIiwicm9sZSI6MCwiaWF0IjoxNzQ1NDg2NTUwLCJleHAiOjE3NDU0OTczNTB9.qkFnzsmJrafNpX7_NaqGF-O2j0I5V2raPT0gMIHdYnw";
        String userName = JWT.getUserId(token);

        System.out.println(userName);
    }
}
