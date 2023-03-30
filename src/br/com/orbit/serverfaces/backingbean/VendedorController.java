package br.com.orbit.serverfaces.backingbean;

import br.com.orbit.serverfaces.bean.Vendedor;

public class VendedorController {
	private Vendedor vendedor = new Vendedor();
	
	public void limpar() {
		vendedor = new Vendedor();
	}
	
	public String salvar() {
		limpar();
		return "";
	}
	
	public String cadastrarMenu() {
		limpar();
		return "";
	}
	
	public String voltar() {
		return "cancelar";
	}

	public Vendedor getVendedor() {
		return vendedor;
	}

	public void setVendedor(Vendedor vendedor) {
		this.vendedor = vendedor;
	}
}
