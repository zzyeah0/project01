package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ActionDAO;
import model.ActionDTO;
import model.TransactionDAO;
import model.TransactionDTO;

public class actionPopupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no"));	
		TransactionDAO dao = TransactionDAO.getInstance();
		TransactionDTO dto = dao.getDetail(no);
				
		ActionDAO a_dao = ActionDAO.getInstance();
		List<ActionDTO> list = a_dao.getList(no);	
		request.setAttribute("list", dto);		
		request.setAttribute("dto", list);
				
		PrintWriter out = response.getWriter();
				
		out.println("<script>");
		out.println("window.open('actionWin.jsp', 'actionWin', 'location=no, width=500, height=700');");
		out.println("history.back(0)");
		out.println("</script>");
		
		return null;
	}

}
