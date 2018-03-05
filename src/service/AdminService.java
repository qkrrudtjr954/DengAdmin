package service;

import java.util.HashMap;
import java.util.List;

import dao.AdminDao;
import dto.CalendarDto;
import dto.GraphDayDto;

public class AdminService {
	private static AdminService adminService = null;
	private AdminDao adminDao = new AdminDao();
	
	private AdminService() {
	}
	
	public static AdminService getInstance() {
		if(adminService == null) {
			adminService = new AdminService();
		}
		return adminService;
	}
	
	
	public HashMap<String, Integer> getMainChart(){
		return adminDao.getMainChar();
	}

	public HashMap<String, Integer> getTablesCount() {
		HashMap<String, Integer> returnMap = new HashMap<>();
		
		returnMap.put("animalCount", adminDao.getAnimalCount());
		returnMap.put("afterCount", adminDao.getAfterCount());
		returnMap.put("userCount", adminDao.getUserCount());
		returnMap.put("commuCount", adminDao.getCommuCount());
		returnMap.put("completeCount", adminDao.getCompleteCount());
		
		return returnMap;
	}
	
	public List<GraphDayDto> getDateCount(String table){
		return adminDao.getDateCount(table);
	}
	
	public List<CalendarDto> getEvents(){
		return adminDao.getEvents();
	}
	
	public CalendarDto getEvent(int seq){
		return adminDao.getEvent(seq);
	}
	
	public boolean addEvent(CalendarDto cal) {
		return adminDao.addEvent(cal);
	}
}
