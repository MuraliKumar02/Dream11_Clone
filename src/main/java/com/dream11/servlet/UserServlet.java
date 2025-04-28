package com.dream11.servlet;

import com.dream11.security.GmailOTP;
import com.dream11.security.JWT;
import com.dream11.dao.UserManger;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;

public class UserServlet extends HttpServlet {




    protected void doPost(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {

        UserManger userManger = UserManger.INSTANCE;

        JSONObject jsonResponse = new JSONObject();

        httpServletResponse.setContentType("application/json");

        String path = httpServletRequest.getPathInfo();



        try
        {


            StringBuilder data = new StringBuilder();

            String line;
            try (BufferedReader reader = httpServletRequest.getReader()) {
                while ((line = reader.readLine()) != null) {
                    data.append(line);
                }
            }
            JSONObject json = new JSONObject(data.toString());

            String userName = json.optString("username", null);
            String password = json.optString("password", null);
            String gmailId = json.optString("gmail", null);
            String otp = json.optString("otp", null);
            String newPassword = json.optString("newPassword", null);



            switch ( path ) {
                case "/login":

                    if (userName == null || password == null) {
                        jsonResponse.put("status", "missing parameters!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }


                    int result = userManger.login(userName, password);

                    int userId = userManger.getUserId(userName);

                    if (result == 1) {
                        jsonResponse.put("status", "Login Successful");
                        jsonResponse.put("token", JWT.generateToken(String.valueOf(userId), 0));
                    } else if (result == 2) {
                        jsonResponse.put("status", "password incorrect!!!");
                    } else {
                        jsonResponse.put("status", "User does Exist!!!");
                    }

                    break;

                case "/register":

                    if (userName == null || password == null || gmailId == null) {
                        jsonResponse.put("status", "missing parameters!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    int registerResult = userManger.isValidForRegister(userName, gmailId);

                    if (registerResult == 1) {
                        if (GmailOTP.sendEmailOTP(gmailId)) {
                            jsonResponse.put("status", "OTP Send Successfully to required @gmail id enter the required OTP to register successfully");
                        }
                    } else if (registerResult == 2) {
                        jsonResponse.put("status", "Try another User name!!!....This user Name already exist!!!");
                    } else if (registerResult == 3) {
                        jsonResponse.put("status", "This gmail is already Exist!!!");
                    }
                    break;

                case "/regAuth":

                    if (userName == null || password == null || gmailId == null || otp == null) {
                        jsonResponse.put("status", "missing parameters!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    if (GmailOTP.isOtpExpires(gmailId))
                    {
                        jsonResponse.put("status", "otp expires!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    if (hasRequiredOtp(otp, gmailId)) {
                        if (userManger.register(userName, password, gmailId)) {
                            jsonResponse.put("status", "Register successfully");
                        }
                        else {
                            jsonResponse.put("status","Register fails!!!");
                        }
                    } else {
                        jsonResponse.put("status", "Wrong otp!!!");
                    }


                    break;
                    
                case "/forgotPassword" :

                    if ( userName == null || gmailId == null  )
                    {
                        jsonResponse.put("status","missing parameters!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    if ( userManger.isValidUser(userName,gmailId) )
                    {
                       if ( GmailOTP.sendEmailOTP(gmailId) ) {
                           jsonResponse.put("status", "OTP send successfully");
                       }

                    }
                    break;

                case "/forgotPasswordAuth" :

                    if ( userName == null || gmailId == null || newPassword == null ||otp == null )
                    {
                        jsonResponse.put("status","missing parameters!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    if (GmailOTP.isOtpExpires(gmailId))
                    {
                        jsonResponse.put("status", "otp expires!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    int forgotPasswordUserId = userManger.getUserId(userName);

                    if ( userManger.isValidUser(userName,gmailId) )
                    {
                        if ( hasRequiredOtp(otp,gmailId))
                        {
                           if ( userManger.updatePassword(String.valueOf(forgotPasswordUserId),newPassword) )
                           {
                               jsonResponse.put("status","password change successfully");
                           }
                           else
                           {
                               jsonResponse.put("status","something fails to change the password!!!");
                           }
                        }
                        else
                        {
                            jsonResponse.put("status","otp wrong!!!");
                        }
                    }
                    else
                    {
                        jsonResponse.put("status","Invalid User!!!");
                    }
                    break;

                case "/resetPassword" :

                    String authHeader = httpServletRequest.getHeader("Authorization");
                    String token = null;

                    if (authHeader != null && authHeader.startsWith("Bearer ")) {
                         token = authHeader.substring(7);
                    }
                    else
                    {
                        jsonResponse.put("status","some thing wrong!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }



                    if (  password == null || newPassword == null)
                    {
                        jsonResponse.put("status","missing parameters!!!");
                        httpServletResponse.getWriter().write(jsonResponse.toString());
                        return;
                    }

                    String userID = JWT.getUserId(token);

                    if ( password.equals(userManger.getPassword(userID)) )
                    {
                        if ( userManger.updatePassword(userID,newPassword) )
                        {
                            jsonResponse.put("status","password change successfully");
                        }
                    }
                    else
                    {
                        jsonResponse.put("status","your old password is incorrect!!!");
                    }


                    break;


                default:
                    jsonResponse.put("status","Invalid url");
                    break;

            }
        }
        catch (ExpiredJwtException e)
        {
            jsonResponse.put("error message", e.getMessage());
            jsonResponse.put("stack trace", e.getStackTrace());
            jsonResponse.put("status","Login time expires try to login again!!!");
        }
        catch (JwtException e)
        {
            jsonResponse.put("error message", e.getMessage());
            jsonResponse.put("stack trace", e.getStackTrace());
            jsonResponse.put("status","Invalid token!!!");
        }
        catch ( Exception e)
        {
            jsonResponse.put("error message", e.getMessage());
            jsonResponse.put("stack trace", e.getStackTrace());
            throw new RuntimeException(e);
        }

        httpServletResponse.getWriter().write(jsonResponse.toString());

    }

    private boolean hasRequiredOtp(String otp,String gmail) throws Exception {

        return otp.equals(GmailOTP.getOtpFromServer(gmail));
    }








}
