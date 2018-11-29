package com.esense;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import Db.Database;

public class WordCounter
{

	public static void main(String[] args)
			throws FileNotFoundException, IOException, SQLException, ClassNotFoundException
	{
		Statement statement = Database.getConnection().createStatement();
		File file = new File("d:\\jsonInput.txt");
		BufferedReader bufferedReader = null;
		bufferedReader = new BufferedReader(new FileReader(file));
		String inputLine = null;
		Map<String, Integer> countword = new HashMap<>();
		while ((inputLine = bufferedReader.readLine()) != null)
		{
			String[] words = inputLine.split("[ \"\n\\t\\r.,;:!?(){}]");
			for (int counter = 0; counter < words.length; counter++)
			{
				String key = words[counter].toLowerCase(); // remove .toLowerCase for Case Sensitive result.
				{
					if (countword.get(key) == null)
					{
						countword.put(key, 1);
					} else
					{
						int value = countword.get(key).intValue();
						value++;
						countword.put(key, value);
					}
				}
			}
		}
		Set<Map.Entry<String, Integer>> entrySet = countword.entrySet();
		for (Map.Entry<String, Integer> entry : entrySet)
		{
			try
			{
				if ((!entry.getKey().equals("")))
				{
//					statement.executeUpdate("insert into counttable (word,count) values('" + entry.getKey() + "','"
//							+ entry.getValue() + "')");
					System.out.println(entry.getKey() + " = " + entry.getValue());

				}
				bufferedReader.close();
				// System.out.println("data inserted");
			}

			catch (IOException error)
			{
				System.out.println("Invalid File");
			} finally
			{
				
				bufferedReader.close();
			}

		}
	}
}