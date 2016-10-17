package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import command.GuCommand;
import command.ReportedCommand;

@Service
public interface TrendService {
	
	//������ �� �˻�
	public List<GuCommand> listgu();
	//�� ���� �Ѹ��� + ��ո��� ��...: 6/7/8/9��
	public List listtotal(String gucode);
	public List listtotal1(String gucode);
	public List listtotal2(String gucode);
	public List listtotal3(String gucode);
	
	//ī�� Ʈ���� ����Ʈ
	public List<ReportedCommand> selectReportList();
	// �� ��ȸ�� ����
	public void updatereport(int num);
}
 