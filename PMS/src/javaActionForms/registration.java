package javaActionForms;

import java.io.IOException;
import java.util.Enumeration;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DbManager.DbConnection;
import DbManager.DbMethods;

/**
 * Servlet implementation class addMedicineType
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	DbConnection db =	new	DbConnection();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String originalFormName = this.getClass().getSimpleName();
		String method = request.getParameter("method");
		if(method.equals("add")){
				Vector vec	=	new	Vector();
				int	count	=	0;    
				Enumeration en=request.getParameterNames();
				 
				while(en.hasMoreElements())
				{
					Object objOri=en.nextElement();
					String param=(String)objOri;
					String value=request.getParameter(param);
					if(count!=0)
			    	{
				    	vec.add(value);
				 	}
			    	count	=	count	+	1;
			     }
				 DbMethods.add(vec,originalFormName);
				 request.setAttribute("message","Data Added Successfully");
				 request.getRequestDispatcher("/jsp/registrationSuccess.jsp").forward(request,response);
		}
		else if(method.equals("emptyaction")){
			request.getRequestDispatcher("/jsp/registration.jsp").forward(request,response);
		}
		else if(method.equals("list")){
				String formName	=	originalFormName.toUpperCase();	
				int columnCount	=	DbMethods.listColumnCount(formName);
				request.setAttribute("formName", originalFormName);
				request.setAttribute("className", this.getClass().getSimpleName());
				request.setAttribute("rows",DbMethods.listRows(formName,columnCount));
				request.setAttribute("columns",DbMethods.listColumns(formName,columnCount));
				request.setAttribute("columnCount",columnCount);
				request.getRequestDispatcher("/jsp/list.jsp").forward(request,response);
		}
		else if(method.equals("listId")){
			Vector vec	=	new	Vector();
			int columnCount	=	Integer.valueOf(request.getParameter("cc"));
			Vector 	vec1	=	DbMethods.listEdit(Integer.parseInt(request.getParameter("id")),originalFormName,columnCount);
			registrationBean	object	=	new registrationBean();
			object.setId(Integer.parseInt((String)vec1.get(0)));
			object.setFirstName((String)vec1.get(1));
			object.setLastName((String)vec1.get(2));
			object.setEmailId((String)vec1.get(3));
			object.setZipCode((String)vec1.get(4));
			object.setPhoneNumber((String)vec1.get(5));
			object.setUserName((String)vec1.get(6));
			object.setPassword((String)vec1.get(7));
			object.setConfirmPassword((String)vec1.get(8));
			request.setAttribute("object", object);
			request.getRequestDispatcher("/jsp/registrationSuccess.jsp").forward(request,response);
		}
		else if(method.equals("edit")){
			String	formName	=	originalFormName.toUpperCase();	
			int columnCount	=	DbMethods.listColumnCount(formName);
			Vector variables	=	new	Vector();
			Vector values	=	new	Vector();
			
		    Vector vec	=	new	Vector();
			int	count	=	0;    
			Enumeration en=request.getParameterNames();
			 
			while(en.hasMoreElements())
			{
				Object objOri=en.nextElement();
				String param=(String)objOri;
				String value=request.getParameter(param);
				if(count!=0)
		    	{
					variables.add(param);
					values.add(value);
				}
		    	count	=	count	+	1;
		     }
		    	try {
		    		DbMethods.edit(variables,values,formName, Integer.valueOf(request.getParameter("id")));
		    		request.getRequestDispatcher("/"+this.getClass().getSimpleName()+"?method=emptyaction").forward(request,response);
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (InstantiationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
	}


}
