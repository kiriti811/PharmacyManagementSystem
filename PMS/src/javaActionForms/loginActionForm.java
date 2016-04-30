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

public class loginActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("loginActionForm.authenticate", "authenticate");
		return map;
	}

	public ActionForward authenticate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("authenticate      "+originalFormName);

		String userName		=	request.getParameter("username");
		String password		=	request.getParameter("password");
		String userType		=	request.getParameter("userType");
		String authStatus	=	DbMethods.authenticate(userName, password, userType);
		System.out.println(authStatus);
		String id	=	authStatus.substring(authStatus.indexOf("$$$")+3,authStatus.length());
		HttpSession	session	=	request.getSession();
		session.setAttribute("id", id);
		authStatus	=	authStatus.substring(0,authStatus.indexOf("$$$"));

		if(authStatus.equals("Success")){
		
			session.setAttribute("userName", userName);
			return mapping.findForward("authenticateSuccess");
		}
		else{
			request.setAttribute("message", "Please Provide The Correct UserName And Password");
			return mapping.findForward("authenticateFailure");
			
		}

	}
	


}
