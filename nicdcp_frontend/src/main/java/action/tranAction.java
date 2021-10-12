package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TransactionDAO;
import model.TransactionDTO;

public class tranAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			
		int rowsize = 0; 		// 한 페이지에 보여줄 게시글 수
		int page = 0;
		int block = 5;  		// 페이지 이동을 위한 블록의 갯수(한 번에 몇개씩?)
		int totalRecord = 0; 	// DB 상의 레코드 전체 수(게시물의 수)		
		int allPage = 0;		// 전체 페이지의 수		
				
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}else {  // tranjaction.jsp에 처음 진입했을 때 
			page = 1;			
		}
		
		if(request.getParameter("rowSize") != null) {
			rowsize = Integer.parseInt(request.getParameter("rowSize"));			
		}else {  // tranjaction.jsp에 처음 진입했을 때 
			rowsize = 5;			
		}		
						
		String [] ab_check = request.getParameterValues("tran_ab");
		
		HashMap<String, String> map = new HashMap<>();		
				
		if(ab_check == null || ab_check.length != 1) {
			map.put("ab", "1");
		}else {
			map.put("ab", request.getParameter("tran_ab"));			
		}		
		
		if(request.getParameter("cust_id") == null) {
			map.put("id", "");			
		}else {
			map.put("id", request.getParameter("cust_id"));
		}
		
		if(request.getParameter("t_chn") == null) {
			map.put("chn", "0");
		}else {
			map.put("chn", request.getParameter("t_chn"));
		}
		
		if(request.getParameter("t_name") == null) {
			map.put("nm", "0");
		}else {
			map.put("nm", request.getParameter("t_name"));
		}
		
		if(request.getParameter("t_act") == null) {
			map.put("act", "0");			
		}else {
			map.put("act", request.getParameter("t_act"));
		}
		
		if(request.getParameter("dateFrom") == null || request.getParameter("dateFrom") == "" ) {
			map.put("df", "1900-01-01");			
		}else {			
			map.put("df", request.getParameter("dateFrom"));
		}
		
		if(request.getParameter("dateTo") == null || request.getParameter("dateTo") == "" ) {
			map.put("dt", "2200-12-31");
		}else {			
			map.put("dt", request.getParameter("dateTo"));
		}
		
		TransactionDAO dao = TransactionDAO.getInstance();		
		List<TransactionDTO> list = dao.getTranList(page, rowsize, map);
		
		// 해당 페이지의 시작 블럭
		int startBlock = (((page-1)/block) * block)+1;
		// 해당 페이지의 마지막 블럭
		int endBlock = (((page-1)/block)*block)+block;
		totalRecord = dao.getCount(map);
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}

		request.setAttribute("page", page);		
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);		
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("list", list);
		request.setAttribute("map", map);
		System.out.println(map);
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("transaction.jsp");
		
		return forward;
	}

}
