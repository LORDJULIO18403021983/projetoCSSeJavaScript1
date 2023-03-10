package br.com.orbit.serverfaces.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.orbit.serverfaces.bean.Filme;

public class FilmeDao {
	private final Connection conn;

	public FilmeDao(Connection conn) {
		this.conn = conn;
	}

	// INSERIR
	public void inserir(Filme filme) throws SQLException {
		String sql = "insert into filme(nome, valor, genero, disponivel)values(?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, filme.getNome().trim().toUpperCase());
		pstm.setDouble(2, filme.getValor());
		pstm.setString(3, filme.getGenero().toUpperCase().trim());
		pstm.setString(4, filme.getDisponivel());

		pstm.execute();
	}

	// CONSULTAR
	public List<Filme> buscarTodosDao() throws SQLException {

		String sql = "select * from filme ";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet cursor2 = pstm.executeQuery();

		List<Filme> filmes = new ArrayList<Filme>();

		while (cursor2.next()) {
			Filme filme = new Filme();
			filme.setCodigo(cursor2.getInt("Codigo"));
			filme.setNome(cursor2.getString("nome"));
			filme.setValor(cursor2.getDouble("valor"));
			filme.setGenero(cursor2.getString("genero"));
			filme.setDisponivel(cursor2.getString("disponivel"));
			filmes.add(filme);
		}
		return filmes;
	}
}
