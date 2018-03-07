package service;

import java.util.HashMap;
import java.util.List;

import dao.AdminDao;
import dao.BbsDao;
import dao.UserDao;
import dto.AfterBbsDto;
import dto.AnimalBbsDto;
import dto.BadWord;
import dto.CalendarDto;
import dto.CommuBbsDto;
import dto.GraphDayDto;
import dto.User;

public class AdminService {
	private static AdminService adminService = null;
	private AdminDao adminDao = new AdminDao();
	private UserDao userDao = new UserDao();
	private BbsDao bbsDao = new BbsDao();
	
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

	public List<AnimalBbsDto> getAllAnimalBbs() {
		return bbsDao.getAllAnimalBbs();
	}

	public List<AfterBbsDto> getAllAfterBbs() {
		return bbsDao.getAllAfterBbs();
	}

	public List<CommuBbsDto> getAllCommuBbs() {
		return bbsDao.getAllCommuBbs();
	}

	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	public List<BadWord> getAllBadWord() {
		return adminDao.getAllBadWord();
	}

	public boolean addBadWord(String word) {
		return adminDao.addBadWord(word);
	}
	
	public boolean deleteBadWord(int seq) {
		return adminDao.deleteBadWord(seq);
	}
	
	public AnimalBbsDto getAnimalBbs(int seq) {
		return bbsDao.getAnimalBbs(seq);
	}
	
	public AfterBbsDto getAfterBbs(int seq) {
		return bbsDao.getAfterBbs(seq);
	}
	
	public CommuBbsDto getCommuBbs(int seq) {
		return bbsDao.getCommuBbs(seq);
	}
	
	public User getUser(int seq) {
		return userDao.getUser(seq);
	}
}
