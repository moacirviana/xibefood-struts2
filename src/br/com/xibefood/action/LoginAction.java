package br.com.xibefood.action;

import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

import br.com.xibefood.DAO.UsuarioDAOImpl;
import br.com.xibefood.dominio.Usuario;
import br.jus.xibefood.util.FuncsUtils;

@Namespace("/login")
@ResultPath(value = "/")
@ParentPackage(value = "default")
public class LoginAction extends ActionSupport implements SessionAware{
	private static final long serialVersionUID = 1L;
	SessionMap<String,Usuario> sessionmap;
	private String username;
	private String userpass;
	private Usuario usuario;
	
	@Action(value = "frmSetup", results = { @Result(name = "success", location = "/frmLogin.jsp"),
			@Result(name = "error", location = "/pages/frmLogin.jsp")} 
	)
	public String setupLogin() {
		return "success";
	}
	
	@Action(value = "process", results = { @Result(name = "success", location = "/index.jsp"),
			@Result(name = "error", location = "/frmLogin.jsp") })
	public String doProcess() {
		try {
			Usuario s = new Usuario();
			s = UsuarioDAOImpl.getInstance().getBean(this.username);
			if (s.getSenha().equals(FuncsUtils.getInstance().encriptar(userpass))) {
				sessionmap.put("login",s);
				addActionMessage(getText("login.sucesso"));
				return SUCCESS;
			} else {
				addActionError(getText("error.login"));
				return ERROR;
			}
		} catch (Exception e) {
			addActionError(getText("error.login"));
			return ERROR;
		}

	}

	@Action(value = "logout", results = {@Result(name = "success", location = "/frmLogin.jsp"),
	        @Result(name = "error", location = "/login.jsp")})
	public String logout(){  
	    sessionmap.invalidate();  
	    return "success";  
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void setSession(Map map) {  
	    sessionmap=(SessionMap)map;  
	    sessionmap.put("login",this.usuario);  
	}  
	
	public SessionMap<String, Usuario> getSessionmap() {
		return sessionmap;
	}

	public void setSessionmap(SessionMap<String, Usuario> sessionmap) {
		this.sessionmap = sessionmap;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

}