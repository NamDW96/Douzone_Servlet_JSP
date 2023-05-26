package kr.or.kosa.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.MemoDao;
import kr.or.kosa.dto.Memo;

public class MemoServletAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		

  	  String id = request.getParameter("id");
  	  String email = request.getParameter("email");
  	  String memo = request.getParameter("memo");
  	  
  	  MemoDao dao = new MemoDao();
  	  dao.insertMemo(new Memo(id,email,memo));

  	  
  	  	try {
  	  	List<Memo> memolist1 = dao.getMemoList();
	
		request.setAttribute("memolist", memolist1);
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("memolist.do");
		
		return forward;
				
  		} catch (Exception e) {
  			System.out.println(e.getMessage());
		}
	
  	  return null;
	}

}
