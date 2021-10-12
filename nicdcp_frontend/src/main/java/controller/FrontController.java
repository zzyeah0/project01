package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.codeAction;
import action.configAction;
import action.loginAction;
import action.signUpAction;

public class FrontController extends HttpServlet {	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// getRequestURI() : "/프로젝트명/파일명(*.do)"라는 문자열을 반환하는 메서드
		String uri = request.getRequestURI();
			
		// getContextPath() : 현재 프로젝트명을 문자열로 반환하는 메서드
		String path = request.getContextPath();		
		String command = uri.substring(path.length()+1);
	
		
		Action action = null;
		ActionForward forward = null;
		
		Properties prop = new Properties();
		FileInputStream fis = new FileInputStream("C:\\Users\\Yeyeong\\Desktop\\NICCOMPANY\\nicdcp demo0.1\\JAVA\\Project\\nicdcp_frontend\\src\\main\\java\\controller\\mapping.properties");
		
		prop.load(fis);
		String value = prop.getProperty(command);
		
		if(value.substring(0, 7).equals("execute")) {
			StringTokenizer st = new StringTokenizer(value, "|");
			String url_1 = st.nextToken(); 	// "execute"
			String url_2 = st.nextToken();  // "패키지명.클래스명"
	
		try {			
			Class url = Class.forName(url_2);
				
				// action = new UploadListAction(); UploadListAction의 동적 객체 생성 방법				
				action = (Action)url.newInstance(); // 동적 객체 생성(실행 시 객체 생성)
				forward = action.execute(request, response);				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}else {		// value 값 중에 "execute"가 아닌 경우 view page로 이동
			forward = new ActionForward();
			forward.setRedirect(false); 	// *.jsp 페이지로 이동
			forward.setPath(value);
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {	// true인 경우 - *.do인 경우
				response.sendRedirect(forward.getPath());
			}else {	// false인 경우 - jsp파일인 경우
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}

	}
	
}
