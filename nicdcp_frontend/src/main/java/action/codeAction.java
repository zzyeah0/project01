package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;

public class codeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String emp_id = request.getParameter("emp_id").trim();
		String emp_email = request.getParameter("emp_email").trim();
		
		EmpDAO dao = EmpDAO.getInstance();
		
		int result = dao.checkEmp(emp_id, emp_email);
		
		PrintWriter out = response.getWriter();
		if (result > 0) {							
			out.println("<script>");
			out.println("location.href='lostpwd2.jsp'");
			out.println("</script>");	
		} else if (result == -1) {			
			out.println("<script>");
			out.println("alert('이메일주소가 틀립니다.')");
			out.println("history.back()");	
			out.println("</script>");	
		} else if (result == -2) {				
			out.println("<script>");
			out.println("alert('사번을 확인해 주세요.')");
			out.println("history.back()");	
			out.println("</script>");	
		} else {
			out.println("<script>");
			out.println("alert('데이터 베이스 오류가 발생했습니다.')");
			out.println("history.back()");	
			out.println("</script>");
		}
		
		return null;
	}	

}
