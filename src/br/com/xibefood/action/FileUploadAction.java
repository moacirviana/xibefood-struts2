package br.com.xibefood.action;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@Namespace("/arquivos")
@ResultPath(value = "/")
@ParentPackage(value = "default")
public class FileUploadAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;
	private String saveDirectory = "C:/temp/";
	
	
	@Action(value = "frmSetup", results = { @Result(name = "success", location = "/forms/frmFileUpload.jsp"),
			@Result(name = "error", location = "/pages/result.jsp")} 
	)
	public String frmSetup() {
		return "success";
	}
	
	@Action( value = "upload",
			 results={@Result(name="success",location="/pages/result.jsp"),
			         @Result(name="input",location="/forms/frmFileUpload.jsp")
			},
	            interceptorRefs={
			        @InterceptorRef(
			            params={"allowedTypes","image/png,image/gif,image/jpeg,image/pjpeg",
					    "maximumSize","2097152"}, 
			            value="fileUpload"
			        ),
		  @InterceptorRef("authStack")
	  })
	public String doUpload() {
		try {
	         if (! (fileUploadFileName==null)){
	        	File destFile = new File(saveDirectory + fileUploadFileName);
	            try {
	            	FileUtils.copyFile(fileUpload, destFile);
	            } catch (Exception ex) {
	                addActionError(getText("upload.error")); // ocorre quando não consegue copiar o arquivo
	            }
	 	 		addActionMessage(getText("upload.success"));
             }
	         else // quando não há arquivo
             {
            	 addActionError(getText("upload.nofile")); 
             }
			
		} catch (Exception e) {
			addActionError(getText("upload.error"));
			return "error";
		}
 	 return "success";
	}

	
	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String execute() throws Exception{
		
		return SUCCESS;
		
	}
	
	public String display() {
		return NONE;
	}
	
}