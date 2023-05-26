package kr.or.kosa.contorller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.service.MemoListAction;
import kr.or.kosa.service.MemoServletAction;


@WebServlet("*.do")
public class MemoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemoController() {
        super();
       
    }
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	request.setCharacterEncoding("UTF-8");

    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String urlcommand = requestUri.substring(contextPath.length());
    	
    	System.out.println("requestUri : " + requestUri);
    	System.out.println("contextPath : " + contextPath);
    	System.out.println("urlcommand : " + urlcommand);
    	
    	
    	Action action=null;
    	ActionForward forward=null;
    	
    	//Client 요청 (1.화면주세요(service 필요없어요) 2.처리해주세요(별도의 service 필요)
    	if(urlcommand.equals("/memo.do")) {
    		//UI제공 (서비스 객체 필요없어요)
    		action = new MemoServletAction();
    		forward = action.execute(request, response);
    		
    	}else if(urlcommand.equals("/memolist.do")) {
    		//UI제공 + 서비스 로직 필요
    		action = new MemoListAction();
    		forward = action.execute(request, response);
    	}
    	
    	if(forward != null) {
    		if(forward.isRedirect()) { //true location.href="" 새로운 페이지 받겠다
    			response.sendRedirect(forward.getPath());
    		}else {
    			//false (forward) >> view 페이지 >> 저장 자원 출력 

    	    	RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    	    	dis.forward(request, response);
    		}
    	}
 
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
