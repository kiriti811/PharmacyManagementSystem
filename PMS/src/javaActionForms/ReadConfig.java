package javaActionForms;

import java.io.*;
import java.util.StringTokenizer;
import java.util.Vector;

public class ReadConfig {
	public static Vector dropDownColumns(String formName) throws IOException {
		Vector vec = new Vector();
		BufferedReader br;
		String fileName = "D:\\RadhaWorkspace\\PMS\\src\\config.txt";
		try {
			FileReader inputFile = new FileReader(fileName);
			BufferedReader bufferReader = new BufferedReader(inputFile);
			String line;
			Vector	vec1	=	new	Vector();
			while ((line = bufferReader.readLine()) != null) {
				StringTokenizer st = new StringTokenizer(line, "$$$");
				while (st.hasMoreTokens()) {
					String str1 = st.nextToken();
					vec1.add(str1);
				}
			}
			for(int	i=0	;	i	<	vec1.size();	i	++)
			{
				if(vec1.get(i).equals(formName.toUpperCase()))
				{
					
						vec.add(vec1.get(i+1));
				
				}
				i	=	i	+	1;
			}
			bufferReader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vec;
	}
}
