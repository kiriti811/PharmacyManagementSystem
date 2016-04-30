package javaActionForms;

import java.util.Vector;

public class removeDuplicate {
	public static Vector removeDuplicates(Vector v) {
		for (int i = 0; i < v.size(); i++) {
			for (int j = 0; j < v.size(); j++) {
				if (i != j) {
					if (v.elementAt(i).equals(v.elementAt(j))) {
						v.removeElementAt(j);
					}
				}
			}
		}
		return v;
		}
}
