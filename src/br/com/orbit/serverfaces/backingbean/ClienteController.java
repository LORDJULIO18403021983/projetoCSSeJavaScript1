package br.com.orbit.serverfaces.backingbean;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.com.orbit.serverfaces.bean.Cliente;
import br.com.orbit.serverfaces.dao.ClienteDao;
import br.com.orbit.serverfaces.util.ConnectionFactory;
import br.com.orbit.serverfaces.util.JSFUtil;

public class ClienteController {
	private Cliente cliente = new Cliente();
	private List<Cliente> listaCliente;

	public String cadastrarMenu() {
		return "";
	}

	public String consultarMenu() {
		return "";
	}

	public String salvar() {
		Connection conn = ConnectionFactory.getConnection();
		ClienteDao clienteDao = new ClienteDao(conn);
		try {
			clienteDao.inserir(cliente);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSFUtil.addInfoMessage("Cliente: " + cliente.getNome() + " Salvo com sucesso!");
		cliente = new Cliente();
		return "";
	}

	public String clientePesquisar() {
		Connection conn = ConnectionFactory.getConnection();
		ClienteDao clienteDao = new ClienteDao(conn);
		listaCliente = new ArrayList<Cliente>();
		try {
			listaCliente = clienteDao.buscarTodosDao();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	public String voltar() {
		return "cancelar";
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public List<Cliente> getListaCliente() {
		return listaCliente;
	}

	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
	}

}
