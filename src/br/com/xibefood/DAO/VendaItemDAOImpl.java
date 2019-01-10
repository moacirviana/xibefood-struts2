package br.com.xibefood.DAO;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import br.com.xibefood.dominio.Venda;
import br.com.xibefood.dominio.VendaItens;


public class VendaItemDAOImpl implements VendaItemDAO {
	
	private DAO<VendaItens> dao = new DAO<VendaItens>(VendaItens.class);
    static VendaItemDAOImpl db;
	
	public static VendaItemDAO getInstance(){
		if (db == null){
			db = new VendaItemDAOImpl();
		}
		return db;
	}
	
	@Override
	public List<VendaItens> listar() throws Exception {
		List<VendaItens> lista = null;
		  try {			  
			  lista =dao.listarTodos(); 
		  }
		  catch (Exception e) {
				e.printStackTrace();
			}
		return lista;	
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
	public VendaItens getBean(int id) throws Exception{
		VendaItens venda = null;
		try {
			// venda = dao.getBean(id);			
		   } catch (Exception e) {
			 e.printStackTrace();
		 }
		return venda;
	} 	

	
	@Override
   public int insert(VendaItens item) throws Exception{
		int ret = 0;
		try {
		    dao.adicionar(item);
			ret=1;
		} catch (Exception e) {			
			e.printStackTrace();
		}		
		
		return ret;
	}
	
	@Override
	public int alterar(VendaItens item) throws Exception{
		int ret = 0;
		try {
			
			
			dao.atualizar(item);
			
			ret=1;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return ret;
	}
	
	public int remover(VendaItens item) throws Exception{
		int ret = 0;
		try {
			dao.remover(item);
			ret=1;
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return ret;
	}
	
    
	public static void main(String[] args) throws Exception{
		/* 
		VendaItemDAO daoItens = VendaItemDAOImpl.getInstance();
		 VendaDAO vendaDao = VendaDAOImpl.getInstance();
		 VendaItens i = new VendaItens();
		 Venda venda = new Venda();
		 venda = vendaDao.getBean(5);
		 */
		
	}
}
