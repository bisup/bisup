package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import command.GuCommand;

@Service
public interface TrendService {
	
	//������ �� �˻�
	public List<GuCommand> listgu();
	public List listtotal(String gucode);

}
 