package mybatis;

public class FileDB {

	private String fileName;
	private String filePath;
	private Long fileSize;
	
	FileDB(){}
	
	public FileDB(String fileName, String filePath, Long fileSize) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileSize = fileSize;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Long getFileSize() {
		return fileSize;
	}
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	

	
}

