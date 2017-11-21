package com.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dao.HomepageDao;
import com.entity.HomepageUser;
import com.service.HomepageService;

public class HomepageServiceImpl implements HomepageService {

	private HomepageDao homepageDao;

	public HomepageDao getHomepageDao() {
		return homepageDao;
	}

	public void setHomepageDao(HomepageDao homepageDao) {
		this.homepageDao = homepageDao;
	}
	
	@Override
	public String validateUser(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("userName", request.getParameter("userName"));
		params.put("password", request.getParameter("password"));
		String tag = this.getHomepageDao().validateLogin(params);
		HttpSession session = request.getSession();
		

		if (tag.equals("U")) {
			System.out.println("Service= " + tag);

			List<HomepageUser> account = (List<HomepageUser>) session.getAttribute("userList");
			System.out.println("Services= " + tag + account == null);

			if (account == null) { //kung null gagawa ng session na userlist
				System.out.println("isEMpty");
				account = new ArrayList<>();
				account.add(new HomepageUser(request.getParameter("userName"), 1));//dito ipapasok sa session
				session.setAttribute("userList", account);// eto ung session na ginawa
				return "I";
			} else {		
				boolean checker = false;
				for (int i = 0; i < account.size(); i++) {
					System.out.println("TESTING "+account.get(i).getUsername());
					if (account.get(i).getUsername().equals(request.getParameter("userName"))) {//kung may laman iccheck kung existing ung user
						System.out.println("Account Exist");
						checker = true;
						if (account.get(i).getLoginCounter() >=2 ){//kung existing ung user titignan kung ilang count na 	
							updateUser(request); //kung 2 na yung count iuppdated active tag to "N" return "L"
							return "L";
						}else{
							account.get(i).setLoginCounter(account.get(i).getLoginCounter() + 1);//kung hindi pa 2 increment ung counter
							System.out.println("New count" + account.get(i).getLoginCounter());
							session.setAttribute("userList", account); //add session
							return "I";
						}							
					} else { 
						checker = false;//kung wala add lang ng record sa session sa userList para sa user
					} 
				}
				if (!checker){
					List<HomepageUser> account1 = (List<HomepageUser>) session.getAttribute("userList");
					account1.add(new HomepageUser(request.getParameter("userName"), 1));//dito ipapasok sa session
					session.setAttribute("userList", account1);
				}
			}
		}

		return tag==null?"I":tag;

	}

	@Override
	public void updateUser(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("userName", request.getParameter("userName"));
		params.put("password", request.getParameter("password"));
		this.getHomepageDao().updateUser(params);
		
	}

	@Override
	public String getUsername(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("userName", request.getParameter("userName"));
		return this.getHomepageDao().getUsername(params);
	}

	@Override
	public String getUserlevel(HttpServletRequest request) throws SQLException {
		Map<String, Object> params = new HashMap<>();
		params.put("userName", request.getParameter("userName"));
		return this.getHomepageDao().getUserlevel(params);
	}
}
/*
 * if (tag == U ){
 *  List<Map> get session 
 *  if session.exist{ 
 *  check if user is already count 
 *  if already counted { 
 * check the count if count of user ==2 
 * {
 * inactive user return 'L' 
 * }else{ 
 * add the count return I 
 * } 
 * }else{ 
 * add the user
 * to the sessionList 
 * } 
 * }else{ 
 * create session and add the user 
 * } 
 * }
 * 
 * return tag==null?'I':tag; }
 */
