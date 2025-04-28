package com.dream11.security;

import com.dream11.util.DataBaseConnection;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.Properties;
import java.util.Random;


public class GmailOTP {

    private static final int OTP_LENGTH = 6;

    private static final String FROM_GMAIL = "a.rajagopalan415@gmail.com";

    private static final String PASSWORD = "hzcn ugoa mnrv mfrt";


    private static String generateOTP() {
        String numbers = "0123456789";
        StringBuilder otp = new StringBuilder();
        Random rand = new Random();
        for (int i = 0; i < OTP_LENGTH; i++) {
            otp.append(numbers.charAt(rand.nextInt(numbers.length())));
        }
        return otp.toString();
    }


    public static boolean sendEmailOTP(String toGmail) throws Exception {

         deleteOtp(toGmail);

        String otp = generateOTP();

        setOtpInServer(toGmail,otp);


        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_GMAIL, PASSWORD);
            }
        });

        Message msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(FROM_GMAIL, false));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toGmail));
        msg.setSubject("Your OTP Code");
        msg.setText("Your OTP is: " + otp);
        msg.setSentDate(new java.util.Date());

        Transport.send(msg);

        return true;
    }

    private static void deleteOtp(String gmail) throws SQLException {

        String qry = "DELETE FROM otp_tbl WHERE email = ?";

        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(qry))
        {
            preparedStatement.setString(1, gmail);

           preparedStatement.executeUpdate();
        }
    }

    public static String getOtpFromServer(String gmail) throws Exception {
        String qry = "SELECT otp FROM otp_tbl WHERE email = ?";

        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(qry))
        {
            preparedStatement.setString(1, gmail);

            try ( ResultSet resultSet = preparedStatement.executeQuery() )
            {
                if ( resultSet.next() )
                {
                   return resultSet.getString("otp");
                }
            }


        }
        return null;
    }

    private static void setOtpInServer(String gmail,String otp) throws Exception {
        String qry = "INSERT INTO otp_tbl (email,otp,expiry_time) VALUES(?,?,?)";

         LocalDateTime currentTime = LocalDateTime.now();

         LocalDateTime expiryTime = currentTime.plusMinutes(5);

         Timestamp expiryTimestamp = Timestamp.valueOf(expiryTime);


        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(qry))
        {
            preparedStatement.setString(1, gmail);
            preparedStatement.setString(2,otp);
            preparedStatement.setTimestamp(3,expiryTimestamp);

            preparedStatement.executeUpdate();
        }

    }

    public static boolean isOtpExpires(String userGmail) throws Exception
    {
        String qry = "SELECT  expiry_time FROM otp_tbl WHERE email = ?";

        LocalDateTime currentTime = LocalDateTime.now();

        try (Connection connection = DataBaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(qry))
        {
            preparedStatement.setString(1, userGmail);

            try ( ResultSet resultSet = preparedStatement.executeQuery() )
            {
                if ( resultSet.next() )
                {
                    return resultSet.getTimestamp("expiry_time").before(Timestamp.valueOf(currentTime));
                }
            }



        }

        return true;
    }














}
