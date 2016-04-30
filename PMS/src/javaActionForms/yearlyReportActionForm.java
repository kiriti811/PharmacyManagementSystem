package javaActionForms;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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

public class yearlyReportActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("yearlyReportActionForm.emptyaction", "emptyaction");
		map.put("yearlyReportActionForm.add", "add");
		return map;
	}

	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("add      "+originalFormName);

		

		Vector	Data		=	DbMethods.getYearlyReport(request.getParameter("bookedDate"));
		Map<String, Float> map = new HashMap<String, Float>();
		for(int i=0;i<Data.size();i++)
		{
						
					map.put((String)Data.get(i),(Float)Data.get(i+1));
					i	=	i	+	1;
		}
		request.setAttribute("yearlyReport",map);
		return mapping.findForward("addSuccess");
	}
	
	public ActionForward emptyaction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("emptyaction      "+originalFormName);
		
		return mapping.findForward("emptyactionSuccess");
	}

}
