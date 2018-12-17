package br.com.xibefood.DAO;

import java.util.List;

import br.com.xibefood.dominio.Usuario;

public interface UsuarioDAO {
	
	public List<Usuario> listar() throws Exception;
	
	public List<Usuario> listarCbx() throws Exception; 
	
	public Usuario getBean(int id) throws Exception;
	
	public Usuario getBean(String email) throws Exception;
	
	public int inserir (Usuario usuario) throws Exception;
	
	public int alterar (Usuario usuario) throws Exception;
	
	public int remover (Usuario usuario) throws Exception;
	
} 