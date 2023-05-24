package com.kosa;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(
			description = "test", 
			urlPatterns = { "/action.do" }			
		)


public class FrontServletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	
    public FrontServletController() {
        super();

    }
    
    //요청(동기식) >> doGet, doPost 실행 >> 로직 동일 >>private void doProcess 만들어서 호출 (둘다)     
	private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
		//GET 요청이나, POST 요청 둘다 doProcess 처리
		System.out.println("클라이언트 요청 방식 : " + method);
		//1. 한글처리
		request.setCharacterEncoding("UTF-8");
		
		//2. 요청 받기
		String cmd = request.getParameter("cmd");
		
		//3. 판단하기
			
		String msg = "";
		Message m = null;
		if(cmd.equals("greeting")) {
		m = new Message();
		msg = m.getMessage(cmd);
		}
		
		//4. 데이터 저장
		 request.setAttribute("msg",msg);
		 request.setAttribute("msgobj",m);
		 
		//5. 뷰 지정하기
		 RequestDispatcher dis = request.getRequestDispatcher("/greeting.jsp");
		
		//6. view 데이터 전달(forward)
		 dis.forward(request, response);
		
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "GET");
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response, "POST");
	}

}

/*
private void doProcess(HttpServletRequest request, HttpServletResponse response, String method) throws ServletException, IOException {
	
	
	 * 
	 * 
	 * 
	 * //1. 한글처리 
		request.setCharacterEncoding("UTF-8");
		//2. 요청받기 (request)
		String cmd = request.getParameter("cmd");	
		//3. 판단하기
		
		//String msg = "";
		//Message m = null;
//		if(cmd.equals("greeting")) {
//			m = new Message();
//			msg = m.getMessage(cmd);
//		}
		
		Object resultobj = null;
		Message msg = new Message();
		resultobj = msg.getMessage(cmd);

		request.setAttribute("result", resultobj);
		
		RequestDispatcher dis = request.getRequestDispatcher("greeting.jsp");
		
		dis.forward(request, response);
}
*/

