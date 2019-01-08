package br.com.xibefood.action;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

import br.com.xibefood.DAO.VendaDAO;
import br.com.xibefood.DAO.VendaDAOImpl;
import br.com.xibefood.DAO.VendaItemDAO;
import br.com.xibefood.DAO.VendaItemDAOImpl;
import br.com.xibefood.DTO.VendaSituacaoDTO;
import br.com.xibefood.dominio.BeanResult;
import br.com.xibefood.dominio.Usuario;
import br.com.xibefood.dominio.Venda;
import br.com.xibefood.dominio.VendaItens;

@SuppressWarnings("serial")
@Namespace("/comandas")
@ResultPath(value = "/")
@ParentPackage(value = "default")
public class VendasAction extends ActionSupport {
	private List<Venda> lstVenda;
	private List<VendaSituacaoDTO> lstVendaSituacao;
	private List<VendaItens> itens;
   // private VendaItens item;
	private Venda venda;
	private int id = 0;
	private BeanResult result;
	private final static VendaDAO daoVenda = VendaDAOImpl.getInstance();
	private final static VendaItemDAO daoItens = VendaItemDAOImpl.getInstance();
	
	@Action(value = "fechar", results = { @Result(name = "success", location = "/pages/result.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
			interceptorRefs = @InterceptorRef("authStack"))
	public String doFechar() {
		try {
			 this.venda = daoVenda.getBean(this.venda.getId());
			 this.venda.setStatus(this.id);
			 daoVenda.alterar(this.venda);
			 addActionMessage(getText("fechameto.sucesso"));
		} catch (Exception e) {
			addActionError(getText("fechamento.erro") + " SystemError: " + e.getMessage() );
			return "error";
		}
		return "success";
	}
	
	@Action(value = "frmSetupNova", results = { @Result(name = "success", location = "/forms/frmNovaVenda.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
		   interceptorRefs = @InterceptorRef("authStack"))
	public String setupNova() {
		return "success";
	}
	
	@Action(value = "situacao", results = { @Result(name = "success", location = "/consultas/vendas-situacao.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
		   interceptorRefs = @InterceptorRef("authStack"))
	public String doListarSituacao() {
		return "success";
	}
	
	@Action(value = "inserir", results = { @Result(name = "success", location = "/pages/result.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
			interceptorRefs = @InterceptorRef("authStack"))
	public String doInserir() {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession(true);
			Usuario b = (Usuario)session.getAttribute("login");
			 for(VendaItens item: this.itens) {
				 item.setValor(item.getSubTotal());
				 item.setVenda(this.venda);
				 this.venda.getItens().add(item);	 
			 }
			 this.venda.setUsuario(b);
			 this.venda.setStatus(0);
			 this.venda.setTotal(this.venda.getValorTotal());
			 this.venda.setDatacad(new Date(System.currentTimeMillis()));
			 daoVenda.inserir(this.venda);
			 addActionMessage(getText("inserir.sucesso"));
		} catch (Exception e) {
			addActionError(getText("inserir.error") + " SystemError: " + e.getMessage() );
			return "error";
		}
		return "success";
	}
	
	@Action(value = "frmCadVendaItem", results = { @Result(name = "success", location = "/forms/frmCadVendaItem.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
			interceptorRefs = @InterceptorRef("authStack"))
	public String frmSetupVendaItem() {
		return "success";
	}
	
	@Action(value = "incluirItem", results = { @Result(name = "success", location = "/pages/result.jsp"),
			@Result(name = "error", location = "/pages/result.jsp")},
			interceptorRefs = @InterceptorRef("authStack"))
	public String doIncluirItem() {
		try {
			//HttpSession session = ServletActionContext.getRequest().getSession(true);
			//Usuario b = (Usuario)session.getAttribute("login");
			Double soma = 0.0;
			for(VendaItens item: this.itens) {
				 item.setValor(item.getSubTotal());
				 item.setVenda(this.venda);
				 soma += item.getValor();
				 daoItens.insert(item);
				 //this.venda.getItens().add(item);	 
				 System.out.println("Item " + item.getProduto().getId());
			 }
			Venda v = daoVenda.getBean(this.venda.getId());
		    // System.out.println("Venda " + v.getId() + " Cliente " + v.getCliente().getNome());
		     soma += v.getTotal();
			 v.setTotal(soma);
			 daoVenda.alterar(v);
			 //daoItens.insert(it);
			 addActionMessage(getText("inserir.sucesso"));
		} catch (Exception e) {
			addActionError(getText("inserir.error") + " SystemError: " + e.getMessage() );
			return "error";
		}
		return "success";
	}
	
	@Action(value = "remover", results = {
			@Result(name = "success", type = "json", params = { "root", "result" }),
			@Result(name = "error", location = "/pages/resultAjax.jsp") })
	public String doExcluir() {
		BeanResult result = new BeanResult();
		int ret = 0;
		try {
			ret = daoVenda.remover(this.venda);
			result.setId(ret);
			result.setMensagem(getText("remover.sucesso"));
			this.result = result;
		} catch (Exception e) {
			    result.setId(0);
			   result.setMensagem(getText("remover.error") +" Error:" + e.getMessage());
			  this.result = result;
			 //addActionError(getText("remover.error") +" Error:" + e.getMessage());
			return "error";
		}
		return "success";
	}
	
	
	@Action(value = "listar", results = { @Result(name = "success", location = "/consultas/vendas-listar.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")}, 
			interceptorRefs = @InterceptorRef("authStack"))
	public String doListar() {

		try {
			this.lstVenda = daoVenda.listar();
		} catch (Exception e) {
			addActionError(getText("listar.error"));
			return "error";
		}
		return "success";
	}
	
	@Action(value = "listarJson", results = {
			@Result(name = "success", type = "json", params = { "root", "lstVenda" }),
			@Result(name = "error", location = "/pages/resultAjax.jsp") })
	public String doListarJson() {

		try {
			this.lstVenda = daoVenda.listar();
		} catch (Exception e) {
			addActionError(getText("listar.error"));
			return "error";
		}
		return "success";
	}
	
	@Action(value = "listarSituacaoJson", results = {
			@Result(name = "success", type = "json", params = { "root", "lstVendaSituacao" }),
			@Result(name = "error", location = "/pages/resultAjax.jsp") })
	public String doListarSituacaoJson() {

		try {
			this.lstVendaSituacao = daoVenda.listarSituacao();
		} catch (Exception e) {
			addActionError(getText("listar.error"));
			return "error";
		}
		return "success";
	}
	
	@Action(value = "listarPorDataJson", results = {
			@Result(name = "success", type = "json", params = { "root", "lstVenda" }),
			@Result(name = "error", location = "/pages/resultAjax.jsp") })
	public String doListarPorDataJson() {

		try {
			this.lstVenda = daoVenda.listar("11/06/2018","11/06/2018");
		} catch (Exception e) {
			addActionError(getText("listar.error"));
			return "error";
		}
		return "success";
	}
	

	@Action(value = "getBeanJson", results = { @Result(name = "success", type = "json", params = { "root", "venda" }),
			@Result(name = "error", location = "/pages/error.jsp") })
	public String getBeanJson() {
		try {
			this.venda = daoVenda.getBean(this.id);
		} catch (Exception e) {
			addActionError(getText("getbean.error"));
			return "error";
		}
		return "success";
	}

	
	public List<Venda> getLstVenda() {
		return lstVenda;
	}

	public void setLstVenda(List<Venda> lstVenda) {
		this.lstVenda = lstVenda;
	}

	public Venda getVenda() {
		return venda;
	}

	public void setVenda(Venda venda) {
		this.venda = venda;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<VendaItens> getItens() {
		return itens;
	}

	public void setItens(List<VendaItens> itens) {
		this.itens = itens;
	}

	/*public VendaItens getItem() {
		return item;
	}

	public void setItem(VendaItens iten) {
		this.item = iten;
	}*/

	public BeanResult getResult() {
		return result;
	}

	public void setResult(BeanResult result) {
		this.result = result;
	}

	public List<VendaSituacaoDTO> getLstVendaSituacao() {
		return lstVendaSituacao;
	}

	public void setLstVendaSituacao(List<VendaSituacaoDTO> lstVendaSituacao) {
		this.lstVendaSituacao = lstVendaSituacao;
	}


}