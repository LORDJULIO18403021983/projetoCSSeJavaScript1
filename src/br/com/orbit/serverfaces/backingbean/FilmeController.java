package br.com.orbit.serverfaces.backingbean;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import br.com.orbit.serverfaces.bean.Filme;
import br.com.orbit.serverfaces.dao.FilmeDao;
import br.com.orbit.serverfaces.enumeration.EnumStatusFilme;
import br.com.orbit.serverfaces.util.ConnectionFactory;
import br.com.orbit.serverfaces.util.JSFUtil;

public class FilmeController {
	private Filme filme = new Filme();
	private List<Filme> listaFilme;
	private Filme filmeSelecionado = new Filme();
	private EnumStatusFilme enumStatusFilme;

	public void limpar() {
		filme = new Filme();
		filmeSelecionado = new Filme();
		listaFilme = new ArrayList<Filme>();
	}

	public Map<String, Object> getListaStatusFilme() {
		return EnumStatusFilme.retornaSelectItems();
	}

	public String filmeAlterar() {
		return "redirectAlterar";
	}

	public String alterar() {
		Connection conn = ConnectionFactory.getConnection();
		FilmeDao filmeDao = new FilmeDao(conn);
		try {
			filmeDao.alterar(filmeSelecionado);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSFUtil.addInfoMessage("Filme: " + filmeSelecionado.getNome() + " Alterado com sucesso!");
		System.out.println(filmeSelecionado.getNome());
		filme = new Filme();
		return "";
	}

	public String filmeExcluir() {
		Connection conn = ConnectionFactory.getConnection();
		FilmeDao filmeDao = new FilmeDao(conn);
		try {
			filmeDao.excluir(filmeSelecionado);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JSFUtil.addInfoMessage("Filme: " + filmeSelecionado.getNome() + " Excluido com sucesso!");
		listaFilme.remove(getFilmeSelecionado());
		System.out.println(filmeSelecionado.getNome());
		filme = new Filme();
		return "";
	}

	public String salvar() {
		Connection conn = ConnectionFactory.getConnection();
		FilmeDao filmeDao = new FilmeDao(conn);
		try {
			filmeDao.inserir(filme);
		} catch (SQLException e) {
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
			e.printStackTrace();
		}
		filme = new Filme();
		return "";
	}

	public String cadastrarMenu() {
		limpar();
		return "";
	}

	public String consultarMenu() {
		limpar();
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

	public Filme getFilmeSelecionado() {
		return filmeSelecionado;
	}

	public void setFilmeSelecionado(Filme filmeSelecionado) {
		this.filmeSelecionado = filmeSelecionado;
	}

	public EnumStatusFilme getEnumStatusFilme() {
		return enumStatusFilme;
	}

	public void setEnumStatusFilme(EnumStatusFilme enumStatusFilme) {
		this.enumStatusFilme = enumStatusFilme;
	}
}
