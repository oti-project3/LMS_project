package com.coderby.myapp.attendance.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coderby.myapp.attendance.dao.IAttendanceRepository;
import com.coderby.myapp.attendance.dao.IReportsRepository;
import com.coderby.myapp.attendance.model.AttendStat;
import com.coderby.myapp.attendance.model.AttendanceVO;
import com.coderby.myapp.attendance.model.ReportsVO;

@Service
public class AttendanceService implements IAttendanceService {
	@Autowired
	IAttendanceRepository attendanceRepository;

	@Autowired
	IReportsRepository reportsRepository;

	// 현재 상태 출력
	@Override
	public AttendanceVO attendToday(String stdId) {
		return attendanceRepository.attendToday(stdId);
	}

	// 출근 버튼
	@Override
	public void attendIn(String stdId, String now) {
		AttendanceVO selectAttend = attendanceRepository.attendToday(stdId);
		if (selectAttend == null) {
			attendanceRepository.attendIn(stdId, now);
		} else {
			// 출근한적 있음
		}

	}

	// 퇴근버튼
	@Override
	public void attendOut(String stdId) {
		AttendanceVO selectAttend = attendanceRepository.attendToday(stdId);
		if (selectAttend != null && selectAttend.getInTime() != null && selectAttend.getOutTime() == null) {
			// 출근 기록이 있고 퇴근 기록이 없어야한다.
			attendanceRepository.attendOut(stdId);
		} else {
			// 출근을 안했을수도 있고,
		}

	}

	@Override
	public List<String> getAllStd() {
		List<String> attendVO = attendanceRepository.getAllStd();
		return attendVO;
	}

	// 24시 특정 학생 status 변경
	@Override
	public void updateStatus(String stdId) {
		AttendanceVO attendToday = attendanceRepository.attendToday(stdId);
		if (attendToday == null) {
			attendanceRepository.insertBlank(stdId, "결석");
		}
		List<AttendanceVO> getAttends = attendanceRepository.attendAll(stdId);
		SimpleDateFormat format = new SimpleDateFormat("H");
		SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm:ss");
		
		for(AttendanceVO getAttend : getAttends) {
			if (getAttend.getInTime() != null && getAttend.getOutTime() == null) {
				// update) 해당 attendance행의 status값을 '결석'으로 변경
				attendanceRepository.updateStatus(stdId, getAttend.getAttendanceDate(), "결석");
				// 만약 관리자가 그 날 후에 승인을 해준다면 결석이 아니라 바뀌어야한다.(관리자 단에서 승인으로 바꿔주는 걸로 할까?)
				// in과 out이 존재할떄
			} else if(getAttend.getInTime() != null && getAttend.getOutTime() != null){
				List<ReportsVO> getReports = reportsRepository.selectStdReports(stdId, getAttend.getAttendanceDate());
				long cancleTime = 0;
				boolean isExist = false;
				
				
				for (ReportsVO repVO : getReports) {
					if (repVO.getRepStatus().equals("반려") && !(repVO.getRepType().equals("병가")
							|| repVO.getRepType().equals("경조사") || repVO.getRepType().equals("예비군"))) {
						cancleTime += repVO.getOutTime().getTime() - repVO.getInTime().getTime();
						isExist = true;
						// 후에 관리자가 반려를 승인으로 바꿔준다면 status를 변경해주어야한다. ㅜㅜ
						// 휴가 목록을 뺀 이유는 값을 빼기 했을데 -값이 나올수도 있기 때문이다.
					}
				}
				if(stdId.equals("subway")) {
					System.out.println("Intime:" + getAttend.getInTime());
					System.out.println("Outtime:" + getAttend.getOutTime());
					System.out.println("ReportsSize:" + getReports.size());
					System.out.println("IsExist:" + isExist);
				}
			
				String strIn = formatTime.format(getAttend.getInTime());
				String strOut = formatTime.format(getAttend.getOutTime());
				
				String[] inSplit = strIn.split(":");
				String[] outSplit = strOut.split(":");
				long inTime = 0;
				long outTime = 0;
				for(int i = 0; i < 3; i++) {
					// 시 
					if(i == 0) {
						// ex) 01 ~ 09시
						if(inSplit[i].charAt(0) == '0') {
							inTime = inTime + (3600 * Integer.parseInt(inSplit[i].charAt(1)+""));
						}
						else {
							inTime = inTime + (3600 * Integer.parseInt(inSplit[i]));
						}
						
						// ex) 01시 ~ 09시
						if(outSplit[i].charAt(0) == '0') {
							outTime = outTime + (3600 * Integer.parseInt(outSplit[i].charAt(1)+""));
						}
						else {
							outTime = outTime + (3600 * Integer.parseInt(outSplit[i]));
						}
					}
					// 분
					else if(i == 1) {
						// ex) 01 ~ 09분
						if(inSplit[i].charAt(0) == '0') {
							inTime = inTime + (60 * Integer.parseInt(inSplit[i].charAt(1)+""));
						}
						else {
							inTime = inTime + (60 * Integer.parseInt(inSplit[i]));
						}
						
						// ex) 01 ~ 09분
						if(outSplit[i].charAt(0) == '0') {
							outTime = outTime + (60 * Integer.parseInt(outSplit[i].charAt(1)+""));
						}
						else {
							outTime = outTime + (60 * Integer.parseInt(outSplit[i]));
						}
					}
					// 초
					else {
						// ex) 01 ~ 09초
						if(inSplit[i].charAt(0) == '0') {
							inTime = inTime + Integer.parseInt(inSplit[i].charAt(1)+"");
						}
						else {
							inTime = inTime + Integer.parseInt(inSplit[i]);
						}
						
						// ex) 01 ~ 09초
						if(outSplit[i].charAt(0) == '0') {
							outTime = outTime + Integer.parseInt(outSplit[i].charAt(1)+"");
						}
						else {
							outTime = outTime + Integer.parseInt(outSplit[i]);
						}
					}
				}
				
				// 밀리초 변환
				inTime = inTime * 1000;
				outTime = outTime * 1000;
				if(inTime < 32400000) {
					inTime = 32399999; //8시59분59초
				}
				
				if(outTime >= 64800000) {
					outTime = 64800000; //18시
				}

				long totalAttend = outTime - inTime - cancleTime;
				String inTimeStr =  format.format(getAttend.getInTime());
				String outTimeStr = format.format(getAttend.getOutTime());

				// 9시간 미만 수업 참여
				if (totalAttend < 32400000) {
					// update) 해당 attendance행의 status값을 '결석'으로 변경
					// 8시간 30분 이상 수업 참여
					if(totalAttend >= 30600000) {
						if(Integer.parseInt(outTimeStr) < 18) {
							attendanceRepository.updateStatus(stdId, getAttend.getAttendanceDate(), "결석");
						}
						// 반려된 외출,지하철 연착,조퇴가 없을 경우만 지각 처리  
						else if(Integer.parseInt(inTimeStr) >= 9 && !isExist) {
							attendanceRepository.updateStatus(stdId,getAttend.getAttendanceDate(),  "지각");
						}else {
							attendanceRepository.updateStatus(stdId, getAttend.getAttendanceDate(), "결석");
						}
					}
					// 8시간 30분 미만 수업 참여
					else {
						attendanceRepository.updateStatus(stdId, getAttend.getAttendanceDate(), "결석");
					}
					
				}
				// 9시간 이상 수업 참여
				else if (totalAttend >= 32400000 ) {
					attendanceRepository.updateStatus(stdId, getAttend.getAttendanceDate(), "출석");
				}
			}
		} 
			
	}

	// 전체 학생 근태(통계) 조회
	@Override
	public List<AttendStat> getAllAttendStat(int classId, String yearParam, String monthParam) {
		List<AttendStat> attendStatList = new ArrayList<AttendStat>();
		List<String> studentIdList = attendanceRepository.getClassStudentIdList(classId);

		for (String stdId : studentIdList) {
			List<Map<String, Object>> statMap = attendanceRepository.getStudentAttendStat(stdId, yearParam, monthParam);
			AttendStat attendStat = new AttendStat();
			attendStat.setStudentId(stdId);
			for (Map<String, Object> map : statMap) {
				String status = (String) map.get("STATUS");
				int count = Integer.parseInt(String.valueOf(map.get("COUNT")));
				if (status.equals("지각")) {
					attendStat.setLateCount(attendStat.getLateCount() + count);
				} else if (status.equals("결석")) {
					attendStat.setAbsenceCount(attendStat.getAbsenceCount() + count);
				}
				if (status.equals("출석")) {
					attendStat.setAttendCount(attendStat.getAttendCount() + count);
				}
			}
			attendStatList.add(attendStat);
		}

		return attendStatList;
	}

	// 학생 월간 근태 통계 조회
	public AttendStat getStudentAttendStat(String studentId, String yearParam, String monthParam) {
		List<Map<String, Object>> statMap = attendanceRepository.getStudentAttendStat(studentId, yearParam, monthParam);
		AttendStat attendStat = new AttendStat();
		attendStat.setStudentId(studentId);
		for (Map<String, Object> map : statMap) {
			String status = (String) map.get("STATUS");
			int count = Integer.parseInt(String.valueOf(map.get("COUNT")));
			if (status.equals("지각")) {
				attendStat.setLateCount(attendStat.getLateCount() + count);
			} else if (status.equals("결석")) {
				attendStat.setAbsenceCount(attendStat.getAbsenceCount() + count);
			}
			if (status.equals("출석")) {
				attendStat.setAttendCount(attendStat.getAttendCount() + count);
			}
		}
		return attendStat;
	}

	// 학생 월간 근태 목록 조회
	public List<AttendanceVO> getStudentAttendList(String studentId, String yearParam, String monthParam) {
		return attendanceRepository.getStudentAttendList(studentId, yearParam, monthParam);

	}
	
	@Override
	public void updateAttendStatus(Date attendanceDate, String studentId, String updateStatus) {
		attendanceRepository.updateAttendStatus(attendanceDate, studentId, updateStatus);
	}
	

}
