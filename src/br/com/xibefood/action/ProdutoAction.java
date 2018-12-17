package br.com.xibefood.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import br.com.xibefood.DAO.ProdutoDAOImpl;
import br.com.xibefood.dominio.Produto;

@SuppressWarnings("serial")
@Namespace("/produtos")
@ResultPath(value = "/")
@ParentPackage(value = "default")
public class ProdutoAction extends ActionSupport {
	private List<Produto> lstProduto;
	private Produto produto;
	private int id;
	// ATRIBUTOS PARA FAZER O DOWNLOAD DA IMAGEM
	private File fileUpload;
	private String fileUploadContentType;
	private String fileUploadFileName;
	private InputStream inputStream;
	private String fileName;
	
	
	@Action(value = "frmSetupNovo", results = { @Result(name = "success", location = "/forms/frmNovoProduto.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")} 
	)			// interceptorRefs = @InterceptorRef("authStack")
	public String setupNovoProduto() {
		return "success";
	}
	
	@Action(value = "incluir",
            results = { @Result(name = "success", type = "stream",
                params = { "contentType", "application/octet-stream",
                            "inputName", "inputStream",
                            "bufferSize", "1024",
                            "contentDisposition","filename=\"${fileName}\"" }) })	// interceptorRefs = @InterceptorRef("authStack")
	public String doIncluir() {
		
		String pathToFile = "c:/temp/img/" + fileName;
        try {
            inputStream = new FileInputStream(new File(pathToFile));
        } catch (Exception e) {
            return ERROR;
        }
        return SUCCESS;
	}
	
	@Action(value = "listarJson", results = {
			@Result(name = "success", type = "json", params = { "root", "lstProduto" }),
			@Result(name = "error", location = "/pages/resultAjax.jsp") })
	public String doListarJson() {

		try {
			this.lstProduto = ProdutoDAOImpl.getInstance().listar();
		} catch (Exception e) {
			addActionError(getText("error.listar"));
			return "error";
		}
		return "success";
	}
	
	@Action(value = "listar", results = { @Result(name = "success", location = "/consultas/produto-listar.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")} 
	)			// interceptorRefs = @InterceptorRef("authStack")
	public String doListar() {

		try {
			this.lstProduto = ProdutoDAOImpl.getInstance().listar();
		} catch (Exception e) {
			addActionError(getText("error.listar"));
			return "error";
		}
		return "success";
	}

	@Action(value = "getBeanJson", results = { @Result(name = "success", type = "json", params = { "root", "produto" }),
			@Result(name = "error", location = "/pages/error.jsp") })
	public String getBeanJson() {
		try {
			this.produto = ProdutoDAOImpl.getInstance().getBean(this.id);
		} catch (Exception e) {
			addActionError(getText("getbean.error"));
			return "error";
		}
		return "success";
	}

    

	public List<Produto> getLstProduto() {
		return lstProduto;
	}


	public void setLstProduto(List<Produto> lstProduto) {
		this.lstProduto = lstProduto;
	}


	public Produto getProduto() {
		return produto;
	}


	public void setProduto(Produto produto) {
		this.produto = produto;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public File getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File fileUpload) {
		this.fileUpload = fileUpload;
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

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	

}