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
		gu=adminMemberDAO.getGu();//������ �ڵ�� �̸��� ArrayList�� �޾ƿ�.
		return gu;
	}

	@Override
	public ArrayList getGuMem(ArrayList guMem, ArrayList gu) {
		// TODO Auto-generated method stub
		for(int i=0; i<gu.size(); i++){
			AdmcdCommand command = (AdmcdCommand) gu.get(i);//gu��� ArrayList�� ����ִ� admcdĿ�ǵ� ��ü�ϳ��� �����ϴ�.
			guMem.add(adminMemberDAO.getGuMem(command));//guMem�� gucode�� �̿��� ȸ������ �ϳ��� �����մϴ�.
		}
		return guMem;
	}

}
