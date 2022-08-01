package com.janadri.classFile;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
public class Encrypt {
static Cipher cipher;

public String method2(String insta, String pText) throws Exception {
	KeyGenerator keyGenerator = KeyGenerator.getInstance(insta);
	keyGenerator.init(128); // block size is 128bits
	SecretKey secretKey = keyGenerator.generateKey();

	cipher = Cipher.getInstance(insta); //SunJCE provider AES algorithm, mode(optional) and padding schema(optional)

	String plainText = pText;
	System.out.println("Plain Text Before Encryption: " + plainText);

	byte[] plainTextByte = plainText.getBytes();
	cipher.init(Cipher.ENCRYPT_MODE, secretKey);
	byte[] encryptedByte = cipher.doFinal(plainTextByte);
	Base64.Encoder encoder = Base64.getEncoder();
	String encryptedText = encoder.encodeToString(encryptedByte);
	
	Base64.Decoder decoder = Base64.getDecoder();
	byte[] encryptedTextByte = decoder.decode(encryptedText);
	cipher.init(Cipher.DECRYPT_MODE, secretKey);
	byte[] decryptedByte = cipher.doFinal(encryptedTextByte);
	String decryptedText = new String(decryptedByte);
	return "\n" + "Encrypted password : "+  encryptedText + "\n" + "Decrypted one : " + decryptedText;
	
}

public static void main(String[] args) throws Exception {

}
