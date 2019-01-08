package br.com.xibefood.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.ResultPath;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Namespace("/json")
@ResultPath(value = "/")
@ParentPackage(value = "default")
public class JsonAction extends ActionSupport {

	@Action(value = "listar", 
			results = { @Result(name = "success", location = "/consultas/jsonlistar.jsp"),
			@Result(name = "error", location = "/pages/error.jsp")},
			interceptorRefs = @InterceptorRef("authStack"))
	public String doListar() {

		return "success";
	}
		

}