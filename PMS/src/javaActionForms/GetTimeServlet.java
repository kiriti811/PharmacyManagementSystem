package javaActionForms;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetTimeServlet
 */
@WebServlet("/GetTimeServlet")
public class GetTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		PrintWriter out = response.getWriter();
		Date currentTime= new Date();
		String message = String.format("Currently time is %tr on %tD.",currentTime, currentTime);
		ArrayList	array	= new ArrayList();
		array.add(1);
		array.add(2);
		array.add(3);
		System.out.println(request.getParameter("name"));
	/*	response.getWriter().write(array.toString());
		request.setAttribute("test",array);*/
		System.out.println("tttttt");
		System.out.println(array);
		response.getWriter().println(array);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				response.setHeader("Cache-Control", "no-cache");
				response.setHeader("Pragma", "no-cache");
				PrintWriter out = response.getWriter();
				Date currentTime= new Date();
				String message = String.format("Currently time is %tr on %tD.",currentTime, currentTime);
				ArrayList	array	= new ArrayList();
				array.add(1);
				array.add(2);
				array.add(3);
				System.out.println(request.getParameter("name"));
			/*	response.getWriter().write(array.toString());
				request.setAttribute("test",array);*/
				System.out.println("tttttt");
				System.out.println(array);
				response.getWriter().println(array);
	}
	

}
