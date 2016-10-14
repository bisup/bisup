package service;

import javax.annotation.Resource;

import dao.MyStoreAction;

public class UpdatedUsersServiceImpl implements UpdatedUsersService {

	@Resource(name="myStoreAction")
	private MyStoreAction myStoreAction;
	
	public MyStoreAction getMyStoreAction() {
		return myStoreAction;
	}

	public void setMyStoreAction(MyStoreAction myStoreAction) {
		this.myStoreAction = myStoreAction;
	}

	@Override
	public int getAllUsers() {
		// TODO Auto-generated method stub
		int allUsers=0;
		allUsers=myStoreAction.getAllUsers(allUsers);
		return allUsers;
	}

	@Override
	public int getUpdatedUsers() {
		// TODO Auto-generated method stub
		int updatedUsers=0;
		updatedUsers=myStoreAction.getUpdatedUsers(updatedUsers);
		return updatedUsers;
	}

}
