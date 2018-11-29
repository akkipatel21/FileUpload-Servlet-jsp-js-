package Vo;

public class vo
{
	private  int id;
	private String Filename;
	private String Filepath;
	private Long Filesize;
	private String Createddate;
	private String Updateddate;
	public int getId()
	{
		return id;
	}
	public void setId(int id)
	{
		this.id = id;
	}
	public String getFilename()
	{
		return Filename;
	}
	public void setFilename(String filename)
	{
		Filename = filename;
	}
	public String getFilepath()
	{
		return Filepath;
	}
	public void setFilepath(String filepath)
	{
		Filepath = filepath;
	}
	public Long getFilesize()
	{
		return Filesize;
	}
	public void setFilesize(Long filesize)
	{
		Filesize = filesize;
	}
	public String getCreateddate()
	{
		return Createddate;
	}
	public void setCreateddate(String createddate)
	{
		Createddate = createddate;
	}
	public String getUpdateddate()
	{
		return Updateddate;
	}
	public void setUpdateddate(String updateddate)
	{
		Updateddate = updateddate;
	}
}