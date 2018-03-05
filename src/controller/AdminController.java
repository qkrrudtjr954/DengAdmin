package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
			
		} else if(command.equals("mainChart")) {
			
			HashMap<String, Object> map = new HashMap<>();
			
			AdminService adminService = AdminService.getInstance();
			HashMap<String, Integer> tablesCount = adminService.getTablesCount();
			// 각 카운트를 get 해오는 dao 함수 제작하기
			map.put("counts", tablesCount);
			
			
			List<GraphDayDto> days = adminService.getDateCount();
			map.put("days", days);
			
			String json = new Gson().toJson(map);
			
			resp.getWriter().write(json);
		}
	}
	
	public void dispatch(String urls, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(urls);
		dispatch.forward(req, resp);
	}
	
}
