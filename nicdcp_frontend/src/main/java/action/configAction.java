package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;

import model.EmpDAO;
import model.EmpDTO;

public class configAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		EmpDAO dao = EmpDAO.getInstance();		
		String emp_id = request.getParameter("emp_id");
		String emp_pwd = request.getParameter("emp_pwd").trim();
		
		EmpDTO dto = dao.getEmp(emp_id);
		request.setAttribute("info", dto);
		
		int result = dao.login(emp_id, emp_pwd);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		if(emp_id.equals("admin") && result > 0) {
			forward.setPath("adminMenu.jsp");					
		}else if(!emp_id.equals("admin") && result > 0) {			
			forward.setPath("config.jsp");			
		}
		return forward;
	}

}
