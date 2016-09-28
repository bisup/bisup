package validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import command.MemberCommand;

public class LoginCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// TODO Auto-generated method stub
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "id", "required");
		// ���� ��ȿ�� �˻縦 ���ϰ� �ϱ����� ~~
		//�����ڵ�.��üŸ��,�ʵ��
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "pw","required");
		
	}
	

}
