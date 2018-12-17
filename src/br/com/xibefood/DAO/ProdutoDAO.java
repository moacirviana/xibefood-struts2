package br.com.xibefood.DAO;

import java.util.List;

import br.com.xibefood.dominio.Produto;

public interface ProdutoDAO {
	
	public List<Produto> listar() throws Exception;
	
	public List<Produto> listarLike(String vdesc) throws Exception;
	
	public Produto getBean(int id) throws Exception;
	
	public int inserir (Produto produto) throws Exception;
	
	public int alterar (Produto produto) throws Exception;
	
} 