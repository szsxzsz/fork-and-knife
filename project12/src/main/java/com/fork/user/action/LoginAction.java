package com.fork.user.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.StoreDAO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = (String)request.getParameter("id");
		String pw = (String)request.getParameter("pw");
		System.out.println(id+", "+pw);
		ActionForward forward = new ActionForward();
	
		
		StoreDAO dao = new StoreDAO();
		
		int result = dao.memberLogin(id, pw);
		System.out.println("result="+result);
		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('비밀번호 오류!");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
		if(result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();		
			out.print("<script>");
			out.print("alert('회원정보 없음!");
			out.print("history.back();");
			out.print("</script>");
			out.close();
			return null;
		}
		
//		if(result == 1) {
		// 로그인 성공 -> 아이디 세션영역에 저장
//		}
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
		
		
		
		forward.setPath("/main.st");
		forward.setRedirect(false);
		
		
		
		return forward;
	}

}
