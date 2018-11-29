package com.esense;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Scanner;

public class FindWords
{
	
	public static void main(String ar[]) throws Exception
	{
		System.out.println("enter the word that You want to Search : ");
		Scanner sc = new Scanner(System.in);
		
		String testWord = sc.nextLine();
		
		int tLen = testWord.length();
		int wordCntr = 0;
		
		boolean check;

		try
		{
			FileInputStream fstream = new FileInputStream("d:\\json\\abc.json");
			BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
			String s;
			// Read File Line By Line
			while ((s = br.readLine()) != null)
			{
				// check to see whether testWord occurs at least once in the line of text
				check = s.toLowerCase().contains(testWord.toLowerCase());
				if (check)
				{
					// get the line, and parse its words into a String array
					String[] lineWords = s.split("\\s+");
					for (String w : lineWords)
					{
						// first see if the word is as least as long as the testWord
						if (w.length() >= tLen)
						{						
							String word = w.substring(0, tLen).trim();
							if (word.equalsIgnoreCase(testWord))
							{
								wordCntr++;
							}
						}
					}
				}
			}
			System.out.println("total is: " + wordCntr);
			// Close the input stream
			br.close();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}