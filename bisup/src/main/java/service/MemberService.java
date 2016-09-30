package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import command.MemberCommand;
import dao.JoinDAO;

public class MemberService {
	  @Autowired
	    private JoinDAO joinDAO;
	  
	   private MemberCommand member;
	    
	    /*public String getData(){
	        return "I am a boy";
	    }*/
	    public List<HashMap<String, Object>> selectAll() {
	        return joinDAO.selectAll();
	    }
	    public void joinMember(HashMap<String, Object> params){
	        
	        if(params.get("pw").equals(params.get("pw_c")))
	        {
	        	joinDAO.insertMember(params);
	        }
	    }
	    public HashMap<String, Object> getMemberInfo(String id){
	        return joinDAO.selectOne(id);
	    }
	    
	    public void memberUpdate(HashMap<String, Object> params){
	 
	        if(params.get("pw").equals(params.get("pw_c")))
	        {
	            HashMap<String, Object> record = joinDAO.selectOne((String)params.get("id"));
	            record.putAll(params); //원래있던거에 내가 받은걸로 수정
	            joinDAO.updateMember(record);
	        }
	    }
	}

