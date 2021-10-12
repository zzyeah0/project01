package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmpDAO;

public class deleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no"));
		EmpDAO dao = EmpDAO.getInstance(); 
		int res = dao.deleteEmp(no);
		PrintWriter out = response.getWriter();
		if(res > 0) {
			out.println("<script>");
			out.println("alert('삭제 성공')");
			out.println("history.go(-1)");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		return null;
	}

}
