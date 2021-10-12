package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;
import model.EmpDTO;

public class configUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		EmpDTO dto = new EmpDTO();
		int no = Integer.parseInt(request.getParameter("no"));
		dto.setEmp_no(no);
		System.out.println(no);
		dto.setEmp_pwd(request.getParameter("new_pwd").trim());		
		String email =request.getParameter("new_email").trim();
		dto.setEmp_email(email);
		System.out.println(email);
		dto.setEmp_phone(request.getParameter("new_phone").trim());

		EmpDAO dao = EmpDAO.getInstance();
	
		int res = dao.configUpdate(dto);		
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script>");
			out.println("alert('등록 성공')");
			out.println("history.go(-1)");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
