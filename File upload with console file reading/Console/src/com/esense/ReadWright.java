package com.esense;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class ReadWright
{

	public static void main(String[] args) throws IOException {
		BufferedReader in = new BufferedReader(new FileReader("d:\\jsonInput.txt"));
		String line = in.readLine();
		while (line != null)
		{
			System.out.println(line);
			line = in.readLine();
		}
		try {
			FileReader fr = new FileReader("d:\\jsonInput.txt");
			BufferedReader br = new BufferedReader(fr);
			FileWriter fw = new FileWriter("d:\\put.txt");
			String s;
 
			while ((s = br.readLine()) != null) { 
				String[] splited = s.split("\\s+");
				for (String part : splited)
				{
					System.out.println(part);
				}
				fw.write(s); // write to output file
				fw.flush();
			}
			br.close();
			fw.close();
                        System.out.println("file copied");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}