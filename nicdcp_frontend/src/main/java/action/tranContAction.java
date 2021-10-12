package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CustomerDAO;
import model.CustomerDTO;
import model.TransactionDAO;
import model.TransactionDTO;

public class tranContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int tran_no = Integer.parseInt(request.getParameter("no"));
		
		TransactionDAO dao = TransactionDAO.getInstance();
		CustomerDAO c_dao = CustomerDAO.getInstance();
		TransactionDTO dto = dao.getDetail(tran_no);
		String cust_id = dto.getCust_id();
		CustomerDTO c_dto = c_dao.getDetail(cust_id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("info", c_dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("tranCont.jsp");			
				
		return forward;
	}

}
