package com.fork.user.action;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.fork.user.db.*;


public class MemberEmailCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		System.out.println(" M : MemberEmailCheckAction_execute() 호출");
		
		// 한글처리(필터)
				// 전달정보 저장 (email)
				String email = request.getParameter("email");
				System.out.println(" M : email	: "+email);
				
				// 페이지 이동(준비)
				ActionForward forward = new ActionForward();
				forward.setPath("./member/emailCheck.jsp?email="+email);	
				forward.setRedirect(false);	
				
				return forward;
	}
	
	

}
