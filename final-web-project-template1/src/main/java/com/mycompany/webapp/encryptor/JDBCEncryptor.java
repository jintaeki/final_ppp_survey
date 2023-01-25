<<<<<<< HEAD
<<<<<<< HEAD
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
=======
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
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
=======
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
>>>>>>> refs/remotes/origin/cbj2
