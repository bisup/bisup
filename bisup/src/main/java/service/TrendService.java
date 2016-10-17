package service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import command.GuCommand;
import command.ReportedCommand;

@Service
public interface TrendService {
	
	//지역별 구 검색
	public List<GuCommand> listgu();
	//각 월별 총매출 + 평균매출 각...: 6/7/8/9월
	public List listtotal(String gucode);
	public List listtotal1(String gucode);
	public List listtotal2(String gucode);
	public List listtotal3(String gucode);
	
	//카페 트렌드 리스트
	public List<ReportedCommand> selectReportList();
	// 글 조회수 증가
	public void updatereport(int num);
}
 