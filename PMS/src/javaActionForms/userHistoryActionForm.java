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

public class userHistoryActionForm extends LookupDispatchAction {
	String originalFormName1 = this.getClass().getSimpleName();
	String originalFormName	=	originalFormName1.substring(0, originalFormName1.indexOf("ActionForm"));
	protected Map getKeyMethodMap() {
		Map map = new HashMap();
		map.put("userHistoryForm.load", "load");
		return map;
	}

	public ActionForward load(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("load      "+originalFormName);

		HttpSession	session		=	request.getSession();
		String	ticketNumber	=	(String)session.getAttribute("userName");
		/*Vector	data			=	DbMethods.searchUserTickets(ticketNumber);
		for(int i	=	0;	i	<	data1.size();	i	++){
			data.add(data1.get(i));
		}
		request.setAttribute("Data", data);
		*/
		return mapping.findForward("loadSuccess");
	}
	


}
