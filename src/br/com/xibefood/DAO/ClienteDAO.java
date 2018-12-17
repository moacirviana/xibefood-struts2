package br.com.xibefood.DAO;

import java.util.List;

import br.com.xibefood.dominio.Cliente;

public interface ClienteDAO {
	
	public List<Cliente> listar() throws Exception;
	
	public List<Cliente> listarCbx() throws Exception; // para preenchimento de combobox
	
	public List<Cliente> listarSemComanda() throws Exception;
	
	public Cliente getBean(int id) throws Exception;
	
	public Cliente getBean(String email) throws Exception;
	
	public int inserir (Cliente cliente) throws Exception;
	
	public int alterar (Cliente cliente) throws Exception;
	
	public int remover (Cliente cliente) throws Exception;
	
} 