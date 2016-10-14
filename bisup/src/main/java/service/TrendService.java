package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import command.GuCommand;

@Service
public interface TrendService {
	
	//지역별 구 검색
	public List<GuCommand> listgu();
	public List listtotal(String gucode);
	public List listtotal1(String gucode);
	public List listtotal2(String gucode);
	public List listtotal3(String gucode);

}
 