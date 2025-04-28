package com.dream11.model;

import java.util.HashMap;
import java.util.Map;

public class User
{

    private String userName;

    private String passWord;

    private String email;



    public String getRoleByKey(int key)
    {
        Map<Integer,String> role = new HashMap<>();

        role.put(0,"user");
        role.put(1,"Admin");

        return role.get(key);
    }



    public User(String userName, String passWord, String email) {
        this.userName = userName;
        this.passWord = passWord;
        this.email = email;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
