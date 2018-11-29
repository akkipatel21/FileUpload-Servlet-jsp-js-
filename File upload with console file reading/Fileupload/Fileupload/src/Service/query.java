package Service;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Vo.vo;

import Db.Database;

public class query
{
	public boolean save(vo file) throws SQLException, ClassNotFoundException
	{
	String sql="INSERT INTO fileinfo(filename, filepath, filesize, createddate) values (?, ?, ?,Now())";
	PreparedStatement statement = Database.getConnection().prepareStatement(sql);
	statement.setString(1, file.getFilename());
	statement.setString(2, file.getFilepath());
	statement.setLong(3, file.getFilesize());
	
	int j= statement.executeUpdate();
	return(j>0 ? true : false );
	}
	
	
	public List<vo> getDetails() throws SQLException, ClassNotFoundException{
	List<vo>details = new ArrayList<vo>(); 
    Statement st= Database.getConnection().createStatement(); 
	ResultSet rs = st.executeQuery("SELECT * FROM fileinfo");
	vo data;
	while(rs.next()){
		data = new vo();
		data.setId(rs.getInt(1));
		data.setFilename(rs.getString(2));
		data.setFilepath(rs.getString(3));
		data.setFilesize(rs.getLong(4));
		data.setCreateddate(rs.getString(5));
		data.setUpdateddate(rs.getString(6));
		details.add(data);
	     }
	  return details;
	}
	public boolean delete(int id) throws SQLException, ClassNotFoundException {
		Statement st = Database.getConnection().createStatement();
		int done = st.executeUpdate("DELETE FROM fileinfo WHERE id='"+id+"'");
		return(done==1?true:false);
	}
	
	public vo getEdit(int id) throws SQLException, ClassNotFoundException{
		Statement st = Database.getConnection().createStatement();
		ResultSet rs =st.executeQuery("SELECT filename,filepath FROM fileinfo WHERE id='"+id+"'");
	
		vo edit = new vo();
		while(rs.next()){
			edit.setId(id);
			edit.setFilename(rs.getString(1));
			edit.setFilepath(rs.getString(2));
			
		}
		return edit;
	}
	
	public boolean update(vo file) throws SQLException, ClassNotFoundException{
		String sql ="update fileinfo set filename=?, filepath=?, filesize=?, updatedate=Now() WHERE id=" +file.getId();
		PreparedStatement statement = Database.getConnection().prepareStatement(sql);
		
		statement.setString(1, file.getFilename());
		statement.setString(2, file.getFilepath());
		statement.setLong(3, file.getFilesize());
		int j = statement.executeUpdate();
		return(j>0 ? true: false);
		
	}
}
