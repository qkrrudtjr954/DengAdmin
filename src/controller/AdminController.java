package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.AfterBbsDto;
import dto.AnimalBbsDto;
import dto.BadWord;
import dto.CalendarDto;
import dto.CommuBbsDto;
import dto.GraphDayDto;
import dto.User;
import service.AdminService;

public class AdminController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=UTF-8");
		
		String command = req.getParameter("command");
		
		if(command.equals("main")) {
			dispatcher("index.jsp", req, resp);
		} else if(command.equals("animalList")) {
			
			AdminService adminService = AdminService.getInstance();
			List<AnimalBbsDto> animalList = adminService.getAllAnimalBbs();
			
			req.setAttribute("animalList", animalList);
			dispatcher("animalList.jsp", req, resp);
		} else if(command.equals("afterList")) {
			
			AdminService adminService = AdminService.getInstance();
			List<AfterBbsDto> afterList = adminService.getAllAfterBbs();
			
			req.setAttribute("afterList", afterList);
			dispatcher("afterList.jsp", req, resp);
		} else if(command.equals("commuList")) {
			
			AdminService adminService = AdminService.getInstance();
			List<CommuBbsDto> commuList = adminService.getAllCommuBbs();
			
			req.setAttribute("commuList", commuList);
			dispatcher("commuList.jsp", req, resp);
		} else if(command.equals("userList")) {
			AdminService adminService = AdminService.getInstance();
			List<User> userList = adminService.getAllUser();
			
			req.setAttribute("userList", userList);
			dispatcher("userList.jsp", req, resp);
		} else if(command.equals("calendar")) {
			
			dispatcher("calendar.jsp", req, resp);
			
		} else if(command.equals("badWord")) {
			
			dispatcher("badword.jsp", req, resp);
			
		} else if(command.equals("drowInfo")) {
			AdminService adminService = AdminService.getInstance();
			HashMap<String, Integer> tablesCount = adminService.getTablesCount();
			
			String json = new Gson().toJson(tablesCount);
			
			resp.getWriter().write(json);
		} else if(command.equals("drowChart")) {
			
			AdminService adminService = AdminService.getInstance();
			
			String table = req.getParameter("table");
			List<GraphDayDto> days = adminService.getDateCount(table);
			
			String json = new Gson().toJson(days);
			
			resp.getWriter().write(json);
		} else if(command.equals("getEvents")) {
			AdminService adminService = AdminService.getInstance();
			List<CalendarDto> events = adminService.getEvents();
			
			String json = new Gson().toJson(events);
			
			resp.getWriter().write(json);
		} else if(command.equals("getEvent")) {
			String sseq = req.getParameter("target");
			int seq = Integer.parseInt(sseq);
			
			System.out.println(seq);
			AdminService adminService = AdminService.getInstance();
			CalendarDto event = adminService.getEvent(seq);
			
			String json = new Gson().toJson(event);
			
			resp.getWriter().write(json);
		} else if(command.equals("addEvent")) {
			String title = req.getParameter("title");
			String start_date = req.getParameter("start_date");
			String end_date = req.getParameter("end_date");
			String content = req.getParameter("content");
			String location = req.getParameter("location");
			
			CalendarDto cal = new CalendarDto(start_date, end_date, location, title, content);
			
			AdminService adminService = AdminService.getInstance();
			boolean result = adminService.addEvent(cal);
			
			Cookie cookie = null;
			if(result) {
				cookie = new Cookie("notice", "addsuccess");
			} else {
				cookie = new Cookie("notice", "addfail");
			}
			
			cookie.setMaxAge(10);
			resp.addCookie(cookie);
			resp.sendRedirect("AdminControl?command=calendar");
			
		} else if(command.equals("getBadWords")) {
			AdminService adminService = AdminService.getInstance();
			List<BadWord> badwords = adminService.getAllBadWord();
			
			String json = new Gson().toJson(badwords);
			
			resp.getWriter().write(json);
		} else if(command.equals("addBadWord")) {
			String word = req.getParameter("word");
			
			AdminService adminService = AdminService.getInstance();
			boolean result = adminService.addBadWord(word);
			
			String json = new Gson().toJson(result);
			
			resp.getWriter().write(json);
		} else if(command.equals("deleteBadWord")) {
			String sseq = req.getParameter("seq");
			int seq = Integer.parseInt(sseq);
			
			AdminService adminService = AdminService.getInstance();
			boolean result = adminService.deleteBadWord(seq);
			
			String json = new Gson().toJson(result);
			
			resp.getWriter().write(json);
		} else if(command.equals("getEtcTable")) {
			
			String badword = req.getParameter("badword");
			
			System.out.println(badword);
			AdminService adminService = AdminService.getInstance();
			List<Object> result = adminService.getEtcTable(badword);
			
			String json = new Gson().toJson(result);
			
			resp.getWriter().write(json);
		}
	}
	
	public void dispatcher(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
}
