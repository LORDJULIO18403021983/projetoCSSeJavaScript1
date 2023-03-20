package br.com.orbit.serverfaces.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.orbit.serverfaces.bean.Cliente;

public class ClienteDao {
	private final Connection conn;

	public ClienteDao(Connection conn) {
		this.conn = conn;
	}

	// INSERIR
	public void inserir(Cliente cliente) throws SQLException {
		String sql = "insert into cliente(nome, idade, endereco, cidade, estado)values(?,?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, cliente.getNome().trim().toUpperCase());
		pstm.setInt(2, cliente.getIdade());
		pstm.setString(3, cliente.getEndereco().toUpperCase().trim());
		pstm.setString(4, cliente.getCidade().toUpperCase().trim());
		pstm.setString(5, cliente.getEstado().toUpperCase().trim());

		pstm.execute();
	}

	// CONSULTAR
	public List<Cliente> buscarTodosDao() throws SQLException {

		String sql = "select * from cliente ";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet cursor2 = pstm.executeQuery();

		List<Cliente> clientes = new ArrayList<Cliente>();

		while (cursor2.next()) {
			Cliente cliente = new Cliente();
			cliente.setCodigo(cursor2.getInt("Codigo"));
			cliente.setNome(cursor2.getString("nome"));
			cliente.setIdade(cursor2.getInt("idade"));
			cliente.setEndereco(cursor2.getString("endereco"));
			cliente.setCidade(cursor2.getString("cidade"));
			cliente.setEstado(cursor2.getString("estado"));
			clientes.add(cliente);
		}
		return clientes;
	}

	// DADOS ORDENADOS PELO NOME.
	public void consultar(Cliente cliente) throws SQLException {
		String sql = "select * from cliente order by nome";
		PreparedStatement pstm = conn.prepareStatement(sql);
		ResultSet cursor = pstm.executeQuery();
		while (cursor.next()) {
			// AS DUAS MANEIRAS SÂO ACEITADAS.
			// System.out.println(cursor.getString(1));
			System.out.println(cursor.getString("nome"));
		}
	}

	// ALTERAR.
	public void alterar(Cliente cliente) throws SQLException {

		String sql = "update cliente set estado =?, cidade = ?, endereco = ?, idade = ?, nome = ?  where codigo=?";
		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, cliente.getEstado().trim().toUpperCase());
		pstm.setString(2, cliente.getCidade().trim().toUpperCase());
		pstm.setString(3, cliente.getEndereco().trim().toUpperCase());
		pstm.setInt(4, cliente.getIdade());
		pstm.setString(5, cliente.getNome().trim().toUpperCase());
		pstm.setInt(6, cliente.getCodigo());

		pstm.execute();
	}

	// EXCLUIR.
	public void excluir(Cliente cliente) throws SQLException {

		String sql = "delete from cliente where nome = ?";
		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, cliente.getNome());
		pstm.execute();
	}
}
