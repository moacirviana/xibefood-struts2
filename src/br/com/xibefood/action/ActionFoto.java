package br.com.xibefood.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@Namespace("/upload")
@ResultPath(value="/upload/")
@ParentPackage(value = "default")
public class ActionFoto extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String desc="";
	
	
	
	@Action(value = "frmCad", results = { @Result(name = "success", location = "/forms/frmCadFoto.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
			interceptorRefs = @InterceptorRef("authStack"))
	public String frmSetupNovo() {
		return "success";
	}
	
	@Action( value = "/multiUploadFile",
			results={@Result(name="success",location="/pages/result.jsp"),
			         @Result(name="input",location="/forms/frmCadFoto.jsp")
			},
	                interceptorRefs={
			        @InterceptorRef(
			            params={"allowedTypes","image/jpeg,application/zip",
					    "maximumSize","1000000"}, 
			            value="fileUpload"
			        ),
			        @InterceptorRef("defaultStack"),
			        @InterceptorRef("validation")
		    }
	)
	public String multiUploadFile() {
			try {
				FileInputStream fis = new FileInputStream(upload);
				String fileName = uploadFileName;
				//String contentType = uploadContentType;
				System.out.println("Nome arquivo " + uploadFileName + " tipo: " + uploadContentType);
				
    			        FileOutputStream fos = new FileOutputStream("C:/tmp/"+fileName);
				byte[] b = new byte[1024];
				while(fis.read(b) != -1){
			    	fos.write(b);
			    }
			    desc += fileName +", ";
			    fos.close();
			    fis.close();
			} catch (IOException e) {
				System.out.println("Ocorreu um erro");
				e.printStackTrace();
			}
				
	    return SUCCESS;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}


	



	
}