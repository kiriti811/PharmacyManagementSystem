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

public class sellMedicinesActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("sellMedicinesActionForm.add", "add");
		map.put("sellMedicinesActionForm.list", "list");
		map.put("sellMedicinesActionForm.listId", "listId");
		map.put("sellMedicinesActionForm.edit", "edit");
		map.put("sellMedicinesActionForm.emptyaction", "emptyaction");
		map.put("sellMedicinesActionForm.reset", "reset");
		map.put("sellMedicinesActionForm.prescription", "prescription");
		map.put("sellMedicinesActionForm.bill", "bill");
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
		System.out.println(vec);
		request.setAttribute("message","Data Added Successfully");
		HttpSession	session	=	request.getSession();
		Vector	testData	=	null;
		Vector	childData	=	(Vector)session.getAttribute("childData");
		if(testData==childData)
		{
			childData	=	new	Vector();
			for(int	i	=	0;	i	<	vec.size();	i++)
			{
				childData.add(vec.get(i));
			}
			System.out.println(childData);
			session.setAttribute("childData",childData);
		}
		else{
			for(int	i	=	0;	i	<	vec.size();	i++)
			{
				childData.add(vec.get(i));
			}
			session.setAttribute("childData",childData);
		}
		//DbMethods.add(vec,originalFormName);
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
		HttpSession	session	=	request.getSession();
		
		Vector	rowData	=	(Vector)session.getAttribute("childData");
		System.out.println(rowData);
		request.setAttribute("rows",rowData);
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
		sellMedicinesBean	object	=	new sellMedicinesBean();
		object.setId(Integer.parseInt((String)vec1.get(0)));
		object.setMedicineType((String)vec1.get(1));
		object.setMedicineName((String)vec1.get(2));
		object.setManufacturer((String)vec1.get(3));
		object.setBatchNumber((String)vec1.get(4));
		object.setExpiryDate((String)vec1.get(5));
		object.setUnitCost(Float.parseFloat((String)vec1.get(6)));
		object.setTotalUnits(Integer.parseInt((String)vec1.get(7)));
		object.setTotalPurchaseCost(Float.parseFloat((String)vec1.get(8)));
		object.setRemainingStock((Integer.parseInt((String)vec1.get(9))));
		object.setUserName((String)vec1.get(10));
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
	public ActionForward reset(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("reset      "+originalFormName);
			HttpSession		session		=	request.getSession();
			session.removeAttribute("childData");
			return mapping.findForward("emptyactionSuccess");
	}
	public ActionForward prescription(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("prescription      "+originalFormName);
			
			return mapping.findForward("prescriptionSuccess");
	}
	public ActionForward bill(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
			System.out.println("bill      "+originalFormName);
			String	billId	=	(String)request.getParameter("b");
			Vector	bill		=	(Vector)DbMethods.getBill(billId);
			request.setAttribute("bill", bill);
			return mapping.findForward("billSuccess");
	}
}
