package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.EmpDAO;
import model.EmpDTO;
import model.LearningDAO;
import model.LearningDTO;
import model.TransactionDAO;

public class loginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String emp_id = request.getParameter("emp_id").trim();
		String emp_pwd = request.getParameter("emp_pwd").trim();
				
		EmpDAO dao = EmpDAO.getInstance();		
		int result = dao.login(emp_id, emp_pwd);
			
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String ip_addr = request.getRemoteAddr();
	
		if (result > 0) {			
			EmpDTO dto = dao.getEmp(emp_id);			
			session.setAttribute("emp_id", dto.getEmp_id());
			session.setAttribute("emp_name", dto.getEmp_name());
			session.setAttribute("emp_ip", ip_addr);			
			
			out.println("<script>");
			out.println("location.href='dashboard.do'");
			out.println("</script>");	
		} else if (result == -1) {			
			out.println("<script>");
			out.println("alert('비밀번호가 틀립니다.')");
			out.println("history.back()");	
			out.println("</script>");	
		} else if (result == -2) {				
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.')");
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
