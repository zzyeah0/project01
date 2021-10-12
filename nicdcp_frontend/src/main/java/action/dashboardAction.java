package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LearningDAO;
import model.LearningDTO;
import model.TransactionDAO;
import model.TransactionDTO;

public class dashboardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		TransactionDAO t_dao = TransactionDAO.getInstance();		
		HashMap<String, String> map = new HashMap<>();		
		map.put("ab", "1");
		map.put("id", "");
		map.put("chn", "0");
		map.put("nm", "0");
		map.put("act", "0");
		map.put("df", "1900-01-01");
		map.put("dt", "2200-12-31");
		map.put("emp", "");
		map.put("st", "Y");
	
		int[] array = t_dao.getDashCount();
		request.setAttribute("array", array);
		
		List<TransactionDTO> t_dto = t_dao.getTranList(1, 5, map);
		request.setAttribute("t_dto", t_dto);				
		
		LearningDAO l_dao = LearningDAO.getInstance();
		List<LearningDTO> l_list = l_dao.getLearnList(1, 5, map);
		LearningDTO l_dto = l_list.get(0);
		request.setAttribute("l_dto", l_dto);
				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("dashboard.jsp");
		
		return forward;
	}

}
