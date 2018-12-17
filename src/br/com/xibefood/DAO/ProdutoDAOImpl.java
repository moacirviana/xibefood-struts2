package br.com.xibefood.DAO;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.xibefood.dominio.Produto;


public class ProdutoDAOImpl implements ProdutoDAO {
	private DAO<Produto> dao = new DAO<Produto>(Produto.class);
	static ProdutoDAOImpl db;
	
	public static ProdutoDAO getInstance(){
		if (db == null){
			db = new ProdutoDAOImpl();
		}
		return db;
	}

	@Override
	public Produto getBean(int id) throws Exception{
		Produto Produto = new Produto();
		try {
			Produto = dao.getBean(id); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Produto;
	}

	@Override
	public List<Produto> listarLike(String vdesc) throws Exception{
		List<Produto> produtos = null;
		EntityManager em = EntityManagerProvider.getInstance().createManager();
		try {						
			 TypedQuery<Produto> query = em.createQuery("SELECT c FROM Produto c WHERE c.descricao LIKE ?1", Produto.class);
			 produtos = query.setParameter(1, "%" + vdesc + "%").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			em.close();
		}
		return produtos;
	}
	
	
	@Override
	public int inserir (Produto Produto) throws Exception{
		int ret = 0;
		try {
			dao.adicionar(Produto);
			ret =1;
		} catch (Exception e) {
			//System.out.println("Ocorreu um ERRO " + e.getMessage());
			e.printStackTrace();
		}
		return ret;
	}
	
	@Override
	public int alterar (Produto Produto) throws Exception{
		int ret = 0;
		try {
			dao.atualizar(Produto);
			ret =1;
		} catch (Exception e) {
			//System.out.println("Ocorreu um ERRO " + e.getMessage());
			e.printStackTrace();
		}
		return ret;
	}

	@Override
	public List<Produto> listar() throws Exception {
		List<Produto> lista = null;
		EntityManager em = EntityManagerProvider.getInstance().createManager();
		try {
			  // lista = dao.listarTodos();
			  TypedQuery<Produto> query = em.createQuery("SELECT c FROM Produto c ORDER BY c.descricao", 
					    Produto.class);
			  lista = query.getResultList();
		  }
		  catch (Exception e) {
				e.printStackTrace();
			}finally {
				em.close();
			}
		return lista;	
	}
	
	public byte[] readBytes(File file) throws IOException {
		ByteArrayOutputStream ous = null;
		InputStream ios = null;
		try {
			byte[] buffer = new byte[4096];
			ous = new ByteArrayOutputStream();
			ios = new FileInputStream(file);
			int read = 0;
			while ((read = ios.read(buffer)) != -1) {
				ous.write(buffer, 0, read);
			}
		} finally {
			try {
				if (ous != null)
					ous.close();
			} catch (IOException e) {
			}

			try {
				if (ios != null)
					ios.close();
			} catch (IOException e) {
			}
		}
		return ous.toByteArray();
	}
	
    
	public static void main(String[] args) throws Exception{
		ProdutoDAO dao = ProdutoDAOImpl.getInstance();
		//File fileUpload = new File("C://temp/galinha_molho_pardooo.jpg");
		
		//Produto p0 = new Produto();
		//int ret = 0;
		//p0 = dao.getBean(10);
		//p0.setDescricao("Lasanha de Carne para 2 pessoas");
		//p0.setTitulo("Lasanha de carne com molho bolonhesa");
		//p0.setValor(new BigDecimal("37.00"));
		//p0.setPicture(FuncsUtils.getInstance().readBytes(fileUpload));
		
		//ret = dao.alterar(p0);
		//System.out.println("atualizado  = " + ret );
		
		
		for (Produto p : dao.listar()) {
			System.out.println("produto " + p.getDescricao() + " " + p.getValor());
		}
		
				
	}
}
