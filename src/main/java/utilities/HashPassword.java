/* HashPassword.java
 *
 * Copyright (C) 2014 Paperbet S.A.
 */

package utilities;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;

public class HashPassword {

	public static void main(String[] args) throws IOException {
		Md5PasswordEncoder encoder;
		InputStreamReader stream;
		BufferedReader reader;
		String line, hash;

		encoder = new Md5PasswordEncoder();
		stream = new InputStreamReader(System.in);
		reader = new BufferedReader(stream);

		System.out.println("Enter passwords to be hashed or <ENTER> to quit");

		line = reader.readLine();
		while (!line.isEmpty()) {
			hash = encoder.encodePassword(line, null);
			System.out.println(hash);
			line = reader.readLine();
		}
	}

}
