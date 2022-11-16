package com.fork.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fork.user.db.MemberDTO;
import com.fork.user.db.StoreDAO;

public class AdminGenMemdetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		StoreDAO dao = new StoreDAO();
		int m_no = Integer.parseInt(request.getParameter("m_no"));
		ActionForward forward = new ActionForward();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");

		//로그인 제어
		
		if(id!=null) {
			if (!(id.equals("admin"))) {
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
			}
		} else{
			forward.setPath("./main.st");
			forward.setRedirect(true);
			return forward;
		}
		// 로그인 제어
		
		MemberDTO dto = dao.adminGetGenMemDetail(m_no);
		
		request.setAttribute("dto", dto);
		request.setAttribute("cnt", dao.adminGetGenCount(m_no));
		
		forward.setPath("./admin/adminGenMemDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
