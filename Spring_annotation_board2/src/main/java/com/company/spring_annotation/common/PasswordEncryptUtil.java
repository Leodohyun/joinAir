package com.company.spring_annotation.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryptUtil {
   public static String encryptSHA256(String plainText) throws
      NoSuchAlgorithmException, UnsupportedEncodingException {
      String sha256 = "";
      
      try {
         MessageDigest mdSHA256 = MessageDigest.getInstance("SHA-256");
         mdSHA256.update(plainText.getBytes("UTF-8"));
         
         byte[] sha256Hash = mdSHA256.digest();
         StringBuffer hexSHA256hash = new StringBuffer();
         
         for(byte b: sha256Hash) {
            String hexString = String.format("%02x", b);
            hexSHA256hash.append(hexString);            
         }
         sha256 = hexSHA256hash.toString();
      } catch (NoSuchAlgorithmException e) {
         // 예외 처리 - 알고리즘 이름이 잘못된 경우
         e.printStackTrace();
         throw e; // 예외를 호출한 곳으로 다시 던집니다.
      } catch (UnsupportedEncodingException e) {
         // 예외 처리 - 인코딩이 잘못된 경우
         e.printStackTrace();
         throw e; // 예외를 호출한 곳으로 다시 던집니다.
      }
      
      return sha256;   
   }      
}