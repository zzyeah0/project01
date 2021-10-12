package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;
import model.EmpDTO;

public class signUpAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String new_id = request.getParameter("new_id").trim();	
		String new_name = request.getParameter("new_name").trim();
		String new_posi = request.getParameter("new_posi").trim();
		String new_email = request.getParameter("new_email").trim();
		String new_phone = request.getParameter("new_phone").trim();
		String new_ip = request.getParameter("new_ip").trim();
		
		EmpDTO dto = new EmpDTO();		
		dto.setEmp_id(new_id);	
		dto.setEmp_name(new_name);
		dto.setEmp_posi(new_posi);
		dto.setEmp_email(new_email);
		dto.setEmp_phone(new_phone);
		dto.setEmp_ip(new_ip);		
				
		EmpDAO dao = EmpDAO.getInstance();
		int res = dao.signUp(dto);		
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script>");
			out.println("alert('등록 성공')");
			out.println("href.location='adminMenu.jsp'");
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
