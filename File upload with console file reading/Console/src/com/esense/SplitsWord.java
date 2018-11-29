package com.esense;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class SplitsWord
{
	public static void main(String[] args)
	{
		BufferedReader in = null;
		try
		{

			in = new BufferedReader(new FileReader("d:\\jsonInput.txt"));
			String read = null;
			while ((read = in.readLine()) != null)
			{
				String[] splited = read.split("\\s+");
				for (String part : splited)
				{
					System.out.println(part);
				}
			}
		} catch (IOException e)
		{
			System.out.println("There was a problem: " + e);
			e.printStackTrace();
		} finally
		{
			try
			{
				in.close();
			} catch (Exception e)
			{
			}
		}
	}
}
