package service;

import java.util.List;

import org.springframework.stereotype.Service;

import command.GuCommand;

@Service
public interface TrendService {
	
	//������ �� �˻�
	public List<GuCommand> listgu();

}
