package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LearningDAO;
import model.LearningDTO;

public class learningListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
				
		int rowsize = 0;
		int page = 0;
		int block = 5;
		int totalRecord = 0;
		int allPage = 0;
		
		HashMap<String, String> map = new HashMap<>();
		if(request.getParameter("dateFrom") == null || request.getParameter("dateFrom") == "") {
			map.put("df", "1900-01-01");
		}else {
			map.put("df", request.getParameter("dateFrom"));
		}
		
		if(request.getParameter("dateTo") == null || request.getParameter("dateTo") == "") {
			map.put("dt", "2200-12-31");
		}else {
			map.put("dt", request.getParameter("dateTo"));
		}
		
		if(request.getParameter("learning_emp") == null || request.getParameter("learning_emp") == "") {
			map.put("emp", "");
		}else {
			map.put("emp", request.getParameter("learning_emp"));
		}		
		
		map.put("st", "");
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));			
		}else {  // tranjaction.jsp에 처음 진입했을 때 
			page = 1;			
		}
		
		if(request.getParameter("rowSize") != null) {
			rowsize = Integer.parseInt(request.getParameter("rowSize"));			
		}else { 
			rowsize = 5;			
		}
		
		LearningDAO dao = LearningDAO.getInstance();
		
		int startBlock = (((page-1)/block) * block)+1;
		int endBlock = (((page-1)/block)*block)+block;
		totalRecord = dao.getCount(map);
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {
			endBlock = allPage;
		}
		
		List<LearningDTO> list = dao.getLearnList(page, rowsize, map);		
		request.setAttribute("list", list);
		request.setAttribute("page", page);		
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);		
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("list", list);
		request.setAttribute("map", map);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("learning.jsp");
		
		return forward;
	}
}
