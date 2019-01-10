package br.com.xibefood.action;

import java.io.File;

public class BeanFoto {
	private int idEstagiario;
	private byte[] foto;
	private String nomearquivo;
	private File foto2;
	
	public String getNomearquivo() {
		return nomearquivo;
	}

	public void setNomearquivo(String nomearquivo) {
		this.nomearquivo = nomearquivo;
	}

	public int getIdEstagiario() {
		return idEstagiario;
	}

	public void setIdEstagiario(int idEstagiario) {
		this.idEstagiario = idEstagiario;
	}

	public byte[] getFoto() {
		return foto;
	}

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}


	public File getFoto2() {
		return foto2;
	}

	public void setFoto2(File foto2) {
		this.foto2 = foto2;
	}

}