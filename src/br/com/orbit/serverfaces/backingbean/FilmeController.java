package br.com.orbit.serverfaces.backingbean;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.orbit.serverfaces.bean.Filme;
import br.com.orbit.serverfaces.dao.FilmeDao;
import br.com.orbit.serverfaces.util.ConnectionFactory;
import br.com.orbit.serverfaces.util.JSFUtil;

public class FilmeController {
	private Filme filme = new Filme();
	private List<Filme> listaFilme;

	public String cadastrarMenu() {
		return "";
	}

	public String consultarMenu() {
		return "";
	}

	public String salvar() {
		Connection conn = ConnectionFactory.getConnection();
		FilmeDao filmeDao = new FilmeDao(conn);
		try {
			filmeDao.inserir(filme);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSFUtil.addInfoMessage("Filme: " + filme.getNome() + " Salvo com sucesso!");
		filme = new Filme();
		return "";
	}

	public String filmePesquisar() {
		Connection conn = ConnectionFactory.getConnection();
		FilmeDao filmeDao = new FilmeDao(conn);
		listaFilme = new ArrayList<Filme>();
		try {
			listaFilme = filmeDao.buscarTodosDao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	public String voltar() {
		return "cancelar";
	}

	public Filme getFilme() {
		return filme;
	}

	public void setFilme(Filme filme) {
		this.filme = filme;
	}

	public List<Filme> getListaFilme() {
		return listaFilme;
	}

	public void setListaFilme(List<Filme> listaFilme) {
		this.listaFilme = listaFilme;
	}

}
