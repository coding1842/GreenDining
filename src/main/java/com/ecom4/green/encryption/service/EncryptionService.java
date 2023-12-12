package com.ecom4.green.encryption.service;

import java.security.NoSuchAlgorithmException;

public interface EncryptionService
{
        public String getSHA256Hash(String input) throws NoSuchAlgorithmException;
}
