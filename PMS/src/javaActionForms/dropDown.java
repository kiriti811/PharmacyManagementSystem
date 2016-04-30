package javaActionForms;

import java.util.Vector;

import DbManager.DbMethods;

public class dropDown {
	public static Vector dropDown(String str)
	{
		Vector dropDownVector	=	new Vector();
		if(str=="medicineType")
		{
			dropDownVector	= DbMethods.dropDown(str,"addMedicineType");
		}
		if(str=="medicineName")
		{
			dropDownVector	= DbMethods.dropDown(str,"addMedicines");
		}
		return	dropDownVector;
	}
	public static String dropDownReference(String ReferenceId,String formName)
	{
		String dropDownReferenceVector	=	"";
		if(formName.equals("addMedicines"))
		{
			dropDownReferenceVector	=	DbMethods.dropDownReference(ReferenceId,"MEDICINETYPE","ADDMEDICINETYPE");
		}
		if(formName.equals("sellMedicines"))
		{
			dropDownReferenceVector	=	DbMethods.dropDownReference1(ReferenceId,"MEDICINENAME","ADDMEDICINES");
		}
		
		return dropDownReferenceVector;
	}

}
