package validator;

import org.springframework.validation.Errors;

import command.MemberCommand;


public class MemberInfoValidator {
	public boolean supports(Class<?> clazz) {
		return MemberCommand.class.isAssignableFrom(clazz);
	}

	public void validate(Object target, Errors errors) {
		MemberCommand memberInfo = (MemberCommand) target;
		if (memberInfo.getId() == null || memberInfo.getId().trim().isEmpty()) {
			errors.rejectValue("id", "required");
		}
		if (memberInfo.getName() == null || memberInfo.getName().trim().isEmpty()) {
			errors.rejectValue("name", "required");
		}
		if (memberInfo.getName() == null || memberInfo.getPw().trim().isEmpty()) {
			errors.rejectValue("pw", "required");
		}
		
	}
}
