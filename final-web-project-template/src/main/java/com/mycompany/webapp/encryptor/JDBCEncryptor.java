package com.mycompany.webapp.encryptor;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JDBCEncryptor {
	public static void main(String[] args) {
	
	StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
	enc.setPassword("E5PROJECT");
	System.out.println(enc.encrypt("oracle.jdbc.driver.OracleDriver"));
	System.out.println(enc.encrypt("jdbc:oracle:thin:@localhost:1521:xe"));
	System.out.println(enc.encrypt("E5"));
	System.out.println(enc.encrypt("E5"));
	}
}
