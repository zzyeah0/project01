package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;
import model.EmpDTO;

public class empDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int emp_no = Integer.parseInt(request.getParameter("no"));
		
		EmpDAO dao = EmpDAO.getInstance();
		EmpDTO dto = dao.getDetail(emp_no);
		
		request.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("empDetail.jsp");			
				
		return forward;
	}

}
