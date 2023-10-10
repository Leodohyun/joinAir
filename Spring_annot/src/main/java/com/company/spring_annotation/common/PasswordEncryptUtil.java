package com.company.spring_annotation.common;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordEncryptUtil {
	public static String encryptSHA256(String plainText) throws
		NoSuchAlgorithmException, UnsupportedEncodingException {
		String sha256 = "";						// 빈 문자열, null
		
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
		}catch(NoSuchAlgorithmException | UnsupportedEncodingException e) {e.printStackTrace();
		}		// catch는 여러개 사용가능하다
		//System.out.println(sha256);
		
		return sha256;	
		}		
	
}
