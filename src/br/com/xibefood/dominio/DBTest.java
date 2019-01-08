package br.com.xibefood.dominio;

import java.text.SimpleDateFormat;
import java.util.Arrays;

import br.com.xibefood.DAO.ClienteDAO;
import br.com.xibefood.DAO.ClienteDAOImpl;
import br.com.xibefood.DAO.ProdutoDAO;
import br.com.xibefood.DAO.ProdutoDAOImpl;
import br.com.xibefood.DAO.UsuarioDAOImpl;
import br.com.xibefood.DAO.VendaDAO;
import br.com.xibefood.DAO.VendaDAOImpl;
import br.com.xibefood.DAO.VendaItemDAO;
import br.com.xibefood.DAO.VendaItemDAOImpl;

public class DBTest {

	public static void main(String[] args) throws Exception{
		/*
		ClienteDAO daoC = ClienteDAOImpl.getInstance();
		Cliente c = new Cliente();
		c.setNome("MESA 01");
		c.setCpf("04336034028");
		c.setEmail("moacir.viana@gmail.com");
		c.setStatus(1);
		daoC.inserir(c);
		Cliente c1 = new Cliente();
		c1.setNome("MESA 02");
		c1.setCpf("37644815015");
		c1.setEmail("souzasilvar@yahoo.com");
		c1.setStatus(1);
		daoC.inserir(c1);
		Cliente c2 = new Cliente();
		c2.setNome("MESA 03");
		c2.setCpf("57044824064");
		c2.setEmail("josedasilva@hotmail.com");
		c2.setStatus(1);
		daoC.inserir(c2);
		
		
		Produto p1 = new Produto();
		p1.setDescricao("Frango Crispy");
		p1.setValor(40.40);
		p1.setTitulo("Frango");
		Produto p2 = new Produto();
		p2.setDescricao("Vaca atolada 1 Pessoa");
		p2.setValor(13.50);
		p2.setTitulo("Carne");
		Produto p3 = new Produto();
		p3.setDescricao("Picanha na Brasa 2 Pessoas");
		p3.setValor(38.99);
		p3.setTitulo("Carde");
		Produto p4 = new Produto();
		p4.setDescricao("Tambaqui Assado 3 pessoas");
		p4.setValor(75.99);
		p4.setTitulo("Peixe");
		ProdutoDAO daoP = ProdutoDAOImpl.getInstance();
		daoP.inserir(p1);
		daoP.inserir(p2);
		daoP.inserir(p3);
		daoP.inserir(p4);
		*/
		
		/*
		Cliente c = new Cliente();
		c = ClienteDAOImpl.getInstance().getBean(2);
		Usuario u1 = new Usuario();
		u1 = UsuarioDAOImpl.getInstance().getBean(8);
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		Venda venda = new Venda();
		venda.setCliente(c);
		venda.setDatacad(sdf.parse("13/12/2018 12:25"));
		venda.setUsuario(u1);
		Produto p1 = new Produto();
		p1 = ProdutoDAOImpl.getInstance().getBean(4);
		Produto p2 = new Produto();
		p2 = ProdutoDAOImpl.getInstance().getBean(5);
		//venda.setDatacad(new Date(System.currentTimeMillis()));
		VendaItens it1 = new VendaItens(venda, p1, 1, 0.0, p1.getValor(), p1.getValor(), null);
		VendaItens it2 = new VendaItens(venda, p2, 2, 0.0, p2.getValor(), p2.getValor(), null);
		venda.getItens().addAll(Arrays.asList(it1, it2));
		venda.setTotal(venda.getValorTotal());
		venda.setStatus(0);
		VendaDAO daoV = VendaDAOImpl.getInstance();
		daoV.insert(venda);
		System.out.println("Done!!");
		*/
		
		/*
		VendaDAO daoV = VendaDAOImpl.getInstance();
		Venda venda = new Venda();
		venda = daoV.getBean(12);
		double soma = 0.0;
		System.out.println("Data " + venda.getCliente().getNome()+" Garcom: " + venda.getUsuario().getNome());
		
		for (VendaItens item : venda.getItens()) {
			soma += item.getValor();
			System.out.println("--- Item qtd "+ item.getQuantidade() + " " + item.getProduto().getDescricao() + 
					 " SubTotal = " + item.getSubTotal() + " Total " + item.getValor() );
		}
		
		System.out.println("Total " + venda.getTotal() + " (var soma = " + soma + ")");
		venda.setTotal(soma);
		venda.setObs("Teste alteração ");
		daoV.alterar(venda);
		System.out.println("Done!!");
		*/
		
		//System.out.println(venda.toString()); 
		
		
	}

}
