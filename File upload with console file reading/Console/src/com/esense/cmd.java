package com.esense;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

class cmd{
	
	
	 //Read output from a Command execution
	
	  public static void main(String[] args) {
	 
		
	        String s = null;

	        try {
	            
		    
	            // using the Runtime exec method:
	            Process p = Runtime.getRuntime().exec("C:\\Program Files\\nodejs\\node.exe 	-v");
	            
	            BufferedReader stdInput = new BufferedReader(new 
	                 InputStreamReader(p.getInputStream()));

	            BufferedReader stdError = new BufferedReader(new 
	                 InputStreamReader(p.getErrorStream()));

	            // read the output from the command
	            //System.out.println("Here is the standard output of the command:\n");
	            while ((s = stdInput.readLine()) != null) {
	                System.out.println(s);
	            }
	            
	            // read any errors from the attempted command
	            //System.out.println("Here is the standard error of the command (if any):\n");
	            while ((s = stdError.readLine()) != null) {
	                System.out.println(s);
	            }
	            
	            System.exit(0);
	        }
	        catch (IOException e) {
	            System.out.println("exception happened - here's what I know: ");
	            e.printStackTrace();
	            System.exit(-1);
	        }
	    }
}
	
	
	
	
	
	
	
	
	
	
	
	// execution of open cmd and mail
	 /*public static void main(String[] args) throws java.io.IOException {
		    String cmd = "cmd.exe /c start ";
		    // String file = "c:\\version.txt";
		    // String file = "http://www.google.com";
		    // String file = "c:\\";
		    // String file = "mailto:author@my.com";
		    String file = "mailto:";
		    Runtime.getRuntime().exec(cmd + file);
		  }*/
	
	
	
	
	
	
	
	
	
	/*public static void main(String[] args) {
	      Runtime.getRuntime().addShutdownHook(new Thread() {
	      public void run() {
	        System.out.println("Do shutdown work ...");
	      }
	    });

	  }
	}*/

	
	/*public static void main(String args[]) throws Exception {
	    Runtime.getRuntime().exec(
	        new String[] {
	            "cmd.exe",
	            "/c",
	            "\"" + System.getenv("APPDATA")
	                + "\\Microsoft\\Internet Explorer\\Quick Launch\\Show Desktop.scf" + "\"" });
	  }
	}*/