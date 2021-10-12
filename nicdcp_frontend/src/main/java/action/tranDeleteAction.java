package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TransactionDAO;

public class tranDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int delNum = Integer.parseInt(request.getParameter("delNum"));			
		String[] delNoList = new String[delNum]; 
		
		System.out.println("delNum:"+delNum);		
		System.out.println("delNoList:"+delNoList);
		
		if(delNum == 1) {
			delNoList[0] = request.getParameter("delList").toString();
		}else {
			delNoList = request.getParameter("delList").toString().split(",");
		}
				
		int[] arrNo = new int[delNoList.length];
		
		
		for(int i=0; i<delNoList.length; i++) {
			arrNo[i] = Integer.parseInt(delNoList[i]);
		}
		
		int[] resultList = new int[arrNo.length];
		TransactionDAO dao = TransactionDAO.getInstance();
		for(int i=0; i<arrNo.length; i++) {
			resultList[i] = dao.tranDelete(arrNo[i]);			
		}
		int success = 0;
		String fail = null;
		for(int i=0; i<resultList.length; i++) {
			if(resultList[i] > 0) {
				success += 1;
			}else {
				fail += Integer.toString(resultList[i]) + ","; 
			}			
		}		
		
		PrintWriter out = response.getWriter();		
		if (success == delNoList.length) {
			out.println("<script>");
			out.println("var num ="+success);
			out.println("alert(num+'건 삭제되었습니다.')");
			out.println("location.href='transaction.do'");
			out.println("</script>");			
		}else {
			out.println("<script>");
			out.println("alert('삭제 실패: "+fail.substring(0, fail.length()-1)+"')");
			out.println("history.back()");				
			out.println("</script>");
		}				
		return null;
	}

}
