package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TransactionDAO;

public class tranInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HashMap<Integer, String> map = new HashMap<>();
		map.put(0, request.getParameter("tran_id"));
		map.put(3, request.getParameter("tran_chn"));
		map.put(8, request.getParameter("tran_amt"));		
		
		TransactionDAO dao = TransactionDAO.getInstance();
		int result = dao.tranUpdate(map);
		int no = Integer.parseInt(map.get(0));
		PrintWriter out = response.getWriter();		
		if (result > 0) {
			out.println("<script>");
			out.println("alert('수정이 완료되었습니다.')");
			out.println("location.href='tranCont.do?no="+no+"'");
			out.println("</script>");			
		}else {
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("history.back()");				
			out.println("</script>");
		}				
		return null;
	}

}
