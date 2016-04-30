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

public class changePasswordActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("changePasswordActionForm.emptyaction", "emptyaction");
		map.put("changePasswordActionForm.edit", "edit");
		return map;
	}

	public ActionForward edit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("book      "+originalFormName);

		DbMethods.changePassword(request.getParameter("userName"),request.getParameter("password"));
		request.setAttribute("message", "Password Reset Successful");
		return mapping.findForward("editSuccess");
	}
	
	public ActionForward emptyaction(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		System.out.println("emptyaction      "+originalFormName);
		
		return mapping.findForward("emptyactionSuccess");
	}

}
