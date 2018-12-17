package br.com.xibefood.interceptor;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

import br.com.xibefood.dominio.Usuario;

@SuppressWarnings("serial")
public class AppInterceptor implements Interceptor{

	public void destroy() {}

	//called during interceptor initialization
	public void init() {}
	
	//put interceptor code here
	public String intercept(ActionInvocation invocation) throws Exception {
		String result = "success";

		/* VERIFICANDO A SESS�O */ 
		try{
		   HttpSession session = ServletActionContext.getRequest().getSession(true);
    	   Usuario b = (Usuario)session.getAttribute("login");
	    	if (b.getNome()==null) {
	    		 //System.out.println("Sess�o expirada");
	    		 result = "error";
	    	} 
	    	else {
	    	     //System.out.println("Sess�o Ativa - titulo : " + b.getTitulo());
	    		result = invocation.invoke();
	    	}
		}catch (Exception e) {
			result = "loginNecessario";
			//System.out.println("Sess�o expirada");
		}
		// -----------------------   DEPOIS DA ACTION
		// System.out.println("CustomInterceptor, after invocation.invoke()... Result........>> " + result);
		return result;
	}

}