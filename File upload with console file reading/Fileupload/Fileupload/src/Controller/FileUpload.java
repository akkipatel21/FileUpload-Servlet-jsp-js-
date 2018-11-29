package Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import Service.query;
import Vo.vo;



@WebServlet("/FileUpload")
@MultipartConfig(maxFileSize = 16177215)
public class FileUpload extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	query Service;
	public FileUpload()
	{
           Service =new query();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action =request.getParameter("action");
		try{
			if(action.equals("delete")){
				boolean info =Service.delete(Integer.parseInt(request.getParameter("id")));
				request.setAttribute("Message", "uploded");			
			}
			if(action.equals("edit")){
				vo dataEdit = Service.getEdit(Integer.parseInt(request.getParameter("id")));
				HttpSession session = request.getSession();
				session.setAttribute("dataEdit", dataEdit);
				getServletContext().getRequestDispatcher("/edit.jsp").forward(request, response);
					
			}
			else{
				List<vo> dataDetails =Service.getDetails();
				request.setAttribute("details", dataDetails);
				getServletContext().getRequestDispatcher("/view.jsp").forward(request, response);
				
			}
			
		}  catch(ClassNotFoundException | SQLException e){
		  e.printStackTrace();
          }
		}
	

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException
	{
		vo file = new vo();
		String name = request.getParameter("fname");
		Part filepart = request.getPart("file");
		Long filesize = filepart.getSize();
		String cont = filepart.getContentType();
		String action = request.getParameter("action");
		
    if (cont.startsWith("image/"))
		{
		InputStream is = filepart.getInputStream();
		System.out.println("d:/images" + "/" + name + ".jpeg");
		File fpath = new File("d:/images" + File.separator + name + ".jpeg");

		OutputStream os = new FileOutputStream(fpath);
		byte[] buf = new byte[1024];
		int len;

		while ((len = is.read(buf)) > 0)
		{
			os.write(buf, 0, len);
		}

		os.close();
		is.close();
		System.out.println("here");
		file.setFilename(name);
		file.setFilepath(String.valueOf(fpath));
		file.setFilesize(filesize);
		
		try{
			if(action.equals("update")){
			HttpSession session = request.getSession();
			int id= ((vo)session.getAttribute("dataEdit")).getId();
			file.setId(id);
			boolean result = Service.update(file);
			List<vo> dataDetails =Service.getDetails();
			request.setAttribute("details", dataDetails);
			getServletContext().getRequestDispatcher("/view.jsp").forward(request, response);
			}
		
			else if(action.equals("insert")){
			
				boolean result = Service.save(file);
		         if(result){
		        	 request.setAttribute("Msg", "Uploded Successfully");
		        	 getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);	
		 			
		         }
			}
		}catch(ClassNotFoundException | SQLException e){
			  e.printStackTrace();
        }
	
		}
	
	else
		{
			System.out.println("not my type");
		request.setAttribute("Msg",
					"Please Choose a valid file(.jpeg/jpg) ");
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);

		}
}
}
