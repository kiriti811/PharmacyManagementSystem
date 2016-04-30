package javaActionForms;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.LookupDispatchAction;

import DbManager.DbMethods;

public class addMedicineTypeActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("addMedicineTypeActionForm.add", "add");
		map.put("addMedicineTypeActionForm.list", "list");
		map.put("addMedicineTypeActionForm.listId", "listId");
		map.put("addMedicineTypeActionForm.edit", "edit");
		map.put("addMedicineTypeActionForm.emptyaction", "emptyaction");
		return map;
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("add      "+originalFormName);

		
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
		request.setAttribute("message","Data Added Successfully");
		DbMethods.add(vec,originalFormName);
		return mapping.findForward("addSuccess");
	}
	
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("list      "+originalFormName);

		
		String formName	=	originalFormName.toUpperCase();	
		int columnCount	=	DbMethods.listColumnCount(formName);
		request.setAttribute("formName", originalFormName);
		request.setAttribute("className", originalFormName);
		request.setAttribute("rows",DbMethods.listRows(formName,columnCount));
		request.setAttribute("columns",DbMethods.listColumns(formName,columnCount));
		request.setAttribute("columnCount",columnCount);
		return mapping.findForward("listSuccess");
	}

	public ActionForward listId(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("listID      "+originalFormName);

		
		Vector vec	=	new	Vector();
		int columnCount	=	Integer.valueOf(request.getParameter("cc"));
		Vector 	vec1	=	DbMethods.listEdit(Integer.parseInt(request.getParameter("id")),originalFormName,columnCount);
		addMedicineTypeBean	object	=	new addMedicineTypeBean();
		object.setId(Integer.parseInt((String)vec1.get(0)));
		object.setMedicineType((String)vec1.get(1));
		request.setAttribute("object", object);
		return mapping.findForward("listIdSuccess");
	}
	
	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			
		System.out.println("edit      "+originalFormName);
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
			HttpSession session = request.getSession();
			return mapping.findForward("editSuccess");
	}
	
	public ActionForward emptyaction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("emptyaction      "+originalFormName);
		
			return mapping.findForward("emptyactionSuccess");
	}
}
