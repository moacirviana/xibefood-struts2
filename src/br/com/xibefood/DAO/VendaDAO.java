package br.com.xibefood.DAO;

import java.util.List;

import br.com.xibefood.DTO.VendaSituacaoDTO;
import br.com.xibefood.dominio.Venda;

public interface VendaDAO {
	
	public List<Venda> listar() throws Exception;
	
	public List<Venda> listar(String dtini, String dtfim) throws Exception;
	
	public List<VendaSituacaoDTO> listarSituacao() throws Exception;
	
	public Venda getBean(int id) throws Exception;
	
	public Double total() throws Exception;
	
	public int inserir(Venda venda) throws Exception;
	
	public int alterar(Venda venda) throws Exception;
	
	public int remover(Venda venda) throws Exception;

}
