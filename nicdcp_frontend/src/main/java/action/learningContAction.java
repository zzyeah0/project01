package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.LearningDAO;
import model.LearningDTO;

public class learningContAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int no = Integer.parseInt(request.getParameter("no"));		
		LearningDAO dao = LearningDAO.getInstance();
		LearningDTO dto = dao.getDetail(no);
		request.setAttribute("dto", dto);				
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("learningCont.jsp");
		
		return forward;
	}

}
