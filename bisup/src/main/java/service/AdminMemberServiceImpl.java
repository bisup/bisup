package service;

import java.util.ArrayList;

import javax.annotation.Resource;

import command.AdmcdCommand;
import dao.AdminMemberDAO;

public class AdminMemberServiceImpl implements AdminMemberService {

	@Resource(name="adminMemberDAO")
	private AdminMemberDAO adminMemberDAO;
	
	public AdminMemberDAO getMyStoreAction() {
		return adminMemberDAO;
	}
	
	public void setMyStoreAction(AdminMemberDAO adminMemberDAO) {
		this.adminMemberDAO = adminMemberDAO;
	}
	
	@Override
	public ArrayList getGu(ArrayList gu) {
		// TODO Auto-generated method stub
		gu=adminMemberDAO.getGu();//지역구 코드와 이름을 ArrayList로 받아옴.
		return gu;
	}

	@Override
	public ArrayList getGuMem(ArrayList guMem, ArrayList gu) {
		// TODO Auto-generated method stub
		for(int i=0; i<gu.size(); i++){
			AdmcdCommand command = (AdmcdCommand) gu.get(i);//gu라는 ArrayList에 들어있는 admcd커맨드 객체하나를 꺼냅니다.
			guMem.add(adminMemberDAO.getGuMem(command));//guMem에 gucode를 이용해 회원수를 하나씩 저장합니다.
		}
		return guMem;
	}

}
