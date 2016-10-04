package mail;

import org.springframework.stereotype.Component;

@Component
public class CreateCode {

	public String randomCode() {
		String code = "";
		for (int i = 0; i < 5; i++) {
			int n = (int) (Math.random() * 1000) + 1;
			char c = (char) ((Math.random() * 25) + 97); /*알파벳 a~z까지 생성*/
			code += c;
			code += n;
		}
		return code;
	}
}

