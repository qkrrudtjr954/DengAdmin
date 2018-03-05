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

import dto.CalendarDto;
import dto.GraphDayDto;
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
		
		if(command.equals("animalList")) {
			
		} else if(command.equals("afterList")) {
			
		} else if(command.equals("userList")) {
			
		} else if(command.equals("badWord")) {
			
		} else if(command.equals("calendar")) {
			
			dispatcher("calendar.jsp", req, resp);
			
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
			
		}
	}
	
	public void dispatcher(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
}
