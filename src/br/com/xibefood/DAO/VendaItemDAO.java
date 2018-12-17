package br.com.xibefood.DAO;

import java.util.List;

import br.com.xibefood.dominio.VendaItens;

public interface VendaItemDAO {

	public List<VendaItens> listar() throws Exception;

	public VendaItens getBean(int id) throws Exception;

	public Double total() throws Exception;

	public int insert(VendaItens item) throws Exception;

	public int alterar(VendaItens item) throws Exception;

	public int remover(VendaItens item) throws Exception;

}
