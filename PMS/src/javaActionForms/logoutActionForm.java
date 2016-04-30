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

public class logoutActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("logoutActionForm.logout", "logout");
		return map;
	}

	public ActionForward logout(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("logout      "+originalFormName);

		HttpSession	session	=	request.getSession();
		session.removeAttribute("userName");
		
		
		return mapping.findForward("logoutSuccess");
	}
	


}
