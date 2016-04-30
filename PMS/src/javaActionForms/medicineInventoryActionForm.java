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

public class medicineInventoryActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("medicineInventoryActionForm.list", "list");
		map.put("medicineInventoryActionForm.emptyaction", "emptyaction");
		map.put("medicineInventoryActionForm.search", "search");
		return map;
	}

	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("list      "+originalFormName);

		String	table		=	"addMedicines";
		String 	formName	=	table.toUpperCase();	
		int columnCount	=	DbMethods.listColumnCount(formName);
		request.setAttribute("formName", table);
		request.setAttribute("className", table);
		request.setAttribute("rows",DbMethods.listRows(formName,columnCount));
		request.setAttribute("columns",DbMethods.listColumns(formName,columnCount));
		request.setAttribute("columnCount",columnCount);
		return mapping.findForward("listSuccess");
	}
	
	
	public ActionForward search(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("search      "+originalFormName);
		String	str	=	"";
		if(!str.equals(request.getParameter("p")))
		{
			String	table		=	"addMedicines";
			String 	formName	=	table.toUpperCase();	
			int columnCount	=	DbMethods.listColumnCount(formName);
			request.setAttribute("columnCount",columnCount);
			request.setAttribute("rows",DbMethods.listRows(formName,columnCount,request.getParameter("p")));
			return mapping.findForward("searchSuccess");
		}
		else{
			return	null;
		}
		
	}
	
	
	public ActionForward emptyaction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("emptyaction      "+originalFormName);
		return mapping.findForward("emptyactionSuccess");
	}	

}
