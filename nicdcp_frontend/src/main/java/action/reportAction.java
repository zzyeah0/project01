package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LearningDAO;
import model.LearningDTO;

public class reportAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		LearningDAO dao = LearningDAO.getInstance();	
		
		HashMap<String, String> map = new HashMap<>();
		map.put("df", "1900-01-01");
		map.put("dt", "2200-12-31");
		map.put("emp", "");
		map.put("st", "Y");
		
		List<LearningDTO> list = dao.getLearnList(1, 5, map);		
		request.setAttribute("list", list);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("report.jsp");
		
		return forward;
	}

}
