package db;

import javax.crypto.Cipher; 
import javax.crypto.SecretKey; 
import javax.crypto.spec.IvParameterSpec; 
import javax.crypto.spec.SecretKeySpec; 
import org.apache.commons.codec.binary.Base64; 

public class AES256Util {
	final String secretKey = "dpdlvldptmghfeldtmitsmdbwlrhksfl"; //32bit 
	final byte[] IV = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }; // 16bit 

  //암호화 
  	public String aesEncode(String str) throws Exception { 
  		
  		byte[] keyData = secretKey.getBytes();
  		SecretKey secureKey = new SecretKeySpec(keyData, "AES");
  		
  		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
  		c.init(Cipher.ENCRYPT_MODE, secureKey, new IvParameterSpec(IV)); 
  		
  		byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
  		String enStr = new String(Base64.encodeBase64(encrypted)); 
  		
  		return enStr;
  	} 
  	
  	//복호화 
  	public String aesDecode(String str) throws Exception { 
  		
  		byte[] keyData = secretKey.getBytes();
  		SecretKey secureKey = new SecretKeySpec(keyData, "AES");
  		
  		Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
  		c.init(Cipher.DECRYPT_MODE, secureKey, new IvParameterSpec(IV)); 
  		
  		byte[] byteStr = Base64.decodeBase64(str.getBytes()); 
  		return new String(c.doFinal(byteStr), "UTF-8");
  	} 
}
