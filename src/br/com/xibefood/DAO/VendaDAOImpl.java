package br.com.xibefood.DAO;


import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.xibefood.DTO.VendaSituacaoDTO;
import br.com.xibefood.dominio.Venda;
import br.com.xibefood.dominio.VendaItens;


public class VendaDAOImpl implements VendaDAO {
	private DAO<Venda> dao = new DAO<Venda>(Venda.class);
	private DAO<VendaItens> daoItens = new DAO<VendaItens>(VendaItens.class);
	
    static VendaDAOImpl db;
	
	public static VendaDAO getInstance(){
		if (db == null){
			db = new VendaDAOImpl();
		}
		return db;
	}
	
	@Override
	public List<VendaSituacaoDTO> listarSituacao() throws Exception{
		List<VendaSituacaoDTO> lista = new ArrayList<VendaSituacaoDTO>();
		EntityManager em = EntityManagerProvider.getInstance().createManager();
	   try {	  
		  //Query query   
		  TypedQuery<VendaSituacaoDTO> query = em.createQuery("SELECT NEW VendaSituacaoDTO(v.id, v.datacad, "
			 		 + "v.cliente.nome, v.usuario.nome, v.total, v.status) "
			 		 + "FROM Venda v WHERE v.status in (0,1)", VendaSituacaoDTO.class);
			lista = query.getResultList();
		  }
		  catch (Exception e) {
			     em.close();
				e.printStackTrace();
		  }	finally {
				em.close();
		  }
		return lista;	
	}
	
	@Override
	public List<Venda> listar() throws Exception {
		List<Venda> lista = null;
		  try {			  
			  lista =dao.listarTodos(); 
		  }
		  catch (Exception e) {
				e.printStackTrace();
			}
		return lista;	
	}

	
	@Override
	public List<Venda> listar(String dtini, String dtfim) throws Exception{
		List<Venda> vendas = null;
		EntityManager em = EntityManagerProvider.getInstance().createManager();
		try {
			 TypedQuery<Venda> query = 
					 em.createQuery("SELECT c FROM Venda c WHERE to_date(to_char(data,'dd/mm/yyyy'),'dd/mm/yyyy') " + 
					 		"BETWEEN to_date(?1,'dd/mm/yyyy') and to_date(?2,'dd/mm/yyyy')", Venda.class);
			 query.setParameter(1, dtini);
			 vendas = query.setParameter(2, dtfim).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return vendas;
	}
	
	@Override
	public Double total() throws Exception{
		EntityManager em = EntityManagerProvider.getInstance().createManager();
		Query query = em.createNativeQuery("SELECT sum(total) FROM venda");
		Double total = null;
		try {
		   total = new Double(query.getSingleResult().toString());
	     } catch (Exception e) {
		    e.printStackTrace();
	    }finally {
			em.close();
		}
		return total;
	}
	

	@Override
	public Venda getBean(int id) throws Exception{
		Venda venda = null;
		try {
			venda = dao.getBean(id);			
		   } catch (Exception e) {
			 e.printStackTrace();
		 }
		return venda;
	} 	

	
	@Override
   public int inserir(Venda venda) throws Exception{
		int ret = 0;
		try {
		    dao.adicionar(venda);
		    for(VendaItens item: venda.getItens()) {
		    	daoItens.adicionar(item);   	
			 }
			ret=1;
		} catch (Exception e) {			
			e.printStackTrace();
		}		
		
		return ret;
	}
	
	@Override
	public int alterar(Venda venda) throws Exception{
		int ret = 0;
		try {
			dao.atualizar(venda);
			ret=1;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return ret;
	}
	
	public int remover(Venda venda) throws Exception{
		int ret = 0;
		try {
			dao.remover(venda);
			ret=1;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return ret;
	}
	
    
	public static void main(String[] args) throws Exception{
		VendaDAO dao = VendaDAOImpl.getInstance();
		NumberFormat nf = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
		for (VendaSituacaoDTO venda : dao.listarSituacao()) {
			System.out.println("Data " + venda.getDatacad() + " Cliente " + 
		                       venda.getCliente() + " total = " + nf.format(venda.getTotal()) );
		}
		
	}
}
