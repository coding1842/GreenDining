package com.ecom4.green.encryption.service;

import org.springframework.stereotype.Service;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Service
public class EncryptionServiceImpl implements EncryptionService
{
        public String getSHA256Hash(String input) throws NoSuchAlgorithmException
        {
	      // SHA-256 해시 함수 생성
	      MessageDigest md = MessageDigest.getInstance("SHA-256");

	      // 입력 문자열을 바이트 배열로 변환
	      byte[] bytes = md.digest(input.getBytes(StandardCharsets.UTF_8));

	      // 바이트 배열을 16진수 문자열로 변환
	      StringBuilder hexStringBuilder = new StringBuilder();
	      for (byte b : bytes)
	      {
		    String hex = String.format("%02x", b);
		    hexStringBuilder.append(hex);
	      }

	      return hexStringBuilder.toString();
        }
}
