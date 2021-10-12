package action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class step2Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int bs = Integer.parseInt(request.getParameter("batchsize"));
		int ep = Integer.parseInt(request.getParameter("epoch"));
		
		return null;
	}

}
