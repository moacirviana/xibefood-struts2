package br.com.xibefood.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import br.com.xibefood.DAO.ProdutoDAOImpl;
import br.com.xibefood.dominio.Produto;

@Namespace("/produtos")
@ResultPath(value = "/")
@ParentPackage(value = "default")
public class ProdutoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private List<Produto> lstProduto;
	private Produto produto;
	private int id;
	// ATRIBUTOS PARA FAZER O DOWNLOAD DA IMAGEM
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private InputStream inputStream;
	
    
	@Action(value = "/showImagem",
            results = { @Result(name = "success", type = "stream",
                params = { "contentType", "image/jpeg,image/png,image/gif",
                            "inputName", "inputStream",
                            "bufferSize", "1024"}) })
		public String showImagem() {
			try {
					this.produto = ProdutoDAOImpl.getInstance().getBean(this.id);
					byte[] buffer = this.produto.getPicture();
					inputStream = new ByteArrayInputStream(buffer);
				}catch (Exception e) {
					return "error";
			}
		return "success";
	}
	
	
	@Action(value = "/downloadImagem",
            results = { @Result(name = "success", type = "stream",
                params = { "contentType", "application/octet-stream",
                            "inputName", "inputStream",
                            "bufferSize", "1024",
                            "contentDisposition","filename=\"${uploadFileName}\"" }) })
	public String downloadImagem() {
			try {
					this.produto = ProdutoDAOImpl.getInstance().getBean(this.id);
					this.uploadFileName = this.produto.getDescricao();
					byte[] buffer = this.produto.getPicture();
					inputStream = new ByteArrayInputStream(buffer);
				}catch (Exception e) {
					return "error";
			}
		return "success";
	}
	
	
	@Action(value = "frmSetupNovo", results = { @Result(name = "success", location = "/forms/frmNovoProduto.jsp"),
		@Result(name = "error", location = "/pages/error.jsp")},
		interceptorRefs = @InterceptorRef("authStack"))
	public String setupNovoProduto() {
		return "success";
	}
    
    
    @Action(value = "frmSetupEditar", results = { @Result(name = "success", location = "/forms/frmNovoProduto.jsp"),
    		@Result(name = "error", location = "/pages/error.jsp")},
    		interceptorRefs = @InterceptorRef("authStack"))
    	public String frmSetupEditar() {
    		try {
    			this.produto = ProdutoDAOImpl.getInstance().getBean(this.id);
    		}catch (Exception e) {
    			return "error";
			}
    		return "success";
    	}
		
	
	@Action( value = "/incluir",
	results={@Result(name="success",location="/forms/frmNovoProduto.jsp"),
	         @Result(name="input",location="/forms/frmNovoProduto.jsp")
		},
	            interceptorRefs={
		        @InterceptorRef(
		            params={"allowedTypes","image/jpeg,image/png,image/gif",
				    "maximumSize","1000000"}, 
		            value="fileUpload"
		        ),
		        @InterceptorRef("authStack"),
		        @InterceptorRef("validation")
	    }
	)
	public String doIncluir() {
        try {
       	   // VERIFICA SE O ARQUIVO FOI INFORMADO
			 if (! (uploadFileName==null)){
				 this.produto.setPicture(readBytes(upload));
			}
			 int ret = ProdutoDAOImpl.getInstance().inserir(this.produto);
			 if (ret==0) {
				 addActionError(getText("inserir.error"));
			 }else {
				 addActionMessage(getText("inserir.sucesso")); }
        } catch (Exception e) {
        	 addActionError(getText("inserir.error"));
        	 return "error";
        }
        return "success";
	}
	
	
	  @Action( value = "/alterar",
			results={@Result(name="success",location="/forms/frmNovoProduto.jsp"),
			         @Result(name="input",location="/forms/frmNovoProduto.jsp")
				}, interceptorRefs={
				        @InterceptorRef(
				            params={"allowedTypes","image/jpeg,image/gif,image/png",
						    "maximumSize","1000000"},value="fileUpload"
				        ),
				        @InterceptorRef("authStack"),
				        @InterceptorRef("validation")
			    })
			public String doAlterar() {
		        try {
		       	   // VERIFICA SE O ARQUIVO FOI INFORMADO
					 if (! (uploadFileName==null)){
						 this.produto.setPicture(readBytes(upload));
					}else {
						Produto p = new Produto();
						p = ProdutoDAOImpl.getInstance().getBean(this.produto.getId());
						this.produto.setPicture(p.getPicture());
					}
					 int ret = ProdutoDAOImpl.getInstance().alterar(this.produto);
					 if (ret==0) {
						 addActionError(getText("alterar.error"));
					 }else {
						 addActionMessage(getText("alterar.sucesso")); }
		        } catch (Exception e) {
		        	 addActionError(getText("alterar.error"));
		        	 return "error";
		        }
		        return "success";
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
	

	public byte[] readBytes(File file) throws IOException {
		ByteArrayOutputStream ous = null;
		InputStream ios = null;
		try {
			byte[] buffer = new byte[4096];
			ous = new ByteArrayOutputStream();
			ios = new FileInputStream(file);
			int read = 0;
			while ((read = ios.read(buffer)) != -1) {
				ous.write(buffer, 0, read);
			}
		} finally {
			try {
				if (ous != null)
					ous.close();
			} catch (IOException e) {
			}

			try {
				if (ios != null)
					ios.close();
			} catch (IOException e) {
			}
		}
		return ous.toByteArray();
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


	public InputStream getInputStream() {
		return inputStream;
	}


	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}    

	
}