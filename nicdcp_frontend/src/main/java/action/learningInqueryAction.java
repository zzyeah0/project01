package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LearningDAO;
import model.LearningDTO;

public class learningInqueryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int no = Integer.parseInt(request.getParameter("learningFt")); 
		
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
		
		
		LearningDAO dao = LearningDAO.getInstance();
		List<LearningDTO> list = dao.getLearnList(1, 5, map);
		LearningDTO dto = list.get(0);
		
		
		return null;
	}

}
