package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.StoreDAO;

public class DCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println(" M : DCheckAction_execute() 호출 ");
		
		String id = request.getParameter("id");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
//		System.out.println(id);
//		System.out.println(nick);
		
		// DB 확인
		StoreDAO dao = new StoreDAO();
		
		if(nick == null && email == null) {
		int result = dao.checkId(id);
		
			if(result == 1) {
				System.out.println(" M : 아이디 중복, 사용불가 ");
			} else {
				System.out.println(" M : 아이디 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		} 
		
		else if(id == null && nick == null) {
			
			int result = dao.checkEmail(email);
			
			if(result == 1) {
				System.out.println(" M : 이메일 중복, 사용불가 ");
			} else {
				System.out.println(" M : 이메일 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		}
		
		else if(id == null && email == null) {
			int result = dao.checkNick(nick);
			
			if(result == 1) {
				System.out.println(" M : 닉네임 중복, 사용불가 ");
			} else {
				System.out.println(" M : 닉네임 사용가능 ");
			}
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.write(result+"");
			out.flush();
			out.close();
		}

		return null;
	}

}
