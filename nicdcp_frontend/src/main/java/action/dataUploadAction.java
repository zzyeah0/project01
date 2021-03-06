package action;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class dataUploadAction implements Action {
	
	private static final String CHARSET = "UTF-8";
	private static final String ATTACHES_DIR = "C:\\Users\\Administrator\\Desktop\\NICDCP\\dataset";
	private static final int LIMIT_SIZE_BYTES = 1000 * 1024 * 1024;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding(CHARSET);
		
		File attachesDir = new File(ATTACHES_DIR);
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(attachesDir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try {
			List<FileItem> items = fileUpload.parseRequest(request);
			for(FileItem item : items) {
				if(item.getSize() > 0) {
					String separator = File.separator;
					int index = item.getName().lastIndexOf(separator);
					String fileName = item.getName().substring(index + 1);
					File uploadFile = new File(ATTACHES_DIR + separator + fileName);
					item.write(uploadFile);
					System.out.println(fileName);
					List<List<String>> ret = new ArrayList<List<String>>(); 
					BufferedReader br =	null;
					 
					br=Files.newBufferedReader(Paths.get(ATTACHES_DIR+ "/" + fileName));
					String line = "";
					
					while((line=br.readLine()) != null) {
						List<String> tmpList = new ArrayList<String>();
						String array[] = line.split(",");
						tmpList = Arrays.asList(array);
						System.out.println(tmpList);
						ret.add(tmpList);
					}
					
					request.setAttribute("list", ret);
									
					try{
		                if(br != null){
		                    br.close();
		                }
		            }catch(IOException e){
		                e.printStackTrace();
		            }			
					
				}
			}
		}catch (Exception e) {
			// TODO: handle exception
		}

		/* try {
			MultipartRequest multi = new MultipartRequest(request, saveFolder, fileSize, "utf-8",
					new DefaultFileRenamePolicy());
			File upload_file = multi.getFile("file");

			if (upload_file != null) {
				String fileName = upload_file.getName();
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 1;
				int day = cal.get(Calendar.DAY_OF_MONTH);
				String homedir = saveFolder + "/" + year + "-" + month + "-" + day;
				File path1 = new File(homedir);
				if (!path1.exists())
					;
				{
					path1.mkdirs();
				}

				String refileName = fileName;
				upload_file.renameTo(new File(homedir + "/" + refileName));
		
				List<List<String>> ret = new ArrayList<List<String>>(); 
				BufferedReader br =	null;
				 
				br=Files.newBufferedReader(Paths.get(homedir + "/" + refileName));
				String line = "";
				
				while((line=br.readLine()) != null) {
					List<String> tmpList = new ArrayList<String>();
					String array[] = line.split(",");
					tmpList = Arrays.asList(array);
					System.out.println(tmpList);
					ret.add(tmpList);
				}
				
				request.setAttribute("list", ret);
								
				try{
	                if(br != null){
	                    br.close();
	                }
	            }catch(IOException e){
	                e.printStackTrace();
	            }		
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		} */

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("step1_upload.jsp");			
				
		return forward;
	}

}
