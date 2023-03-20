package br.com.orbit.serverfaces.backingbean;

import br.com.orbit.serverfaces.bean.Vendedor;

public class VendedorController {
	private Vendedor vendedor = new Vendedor();
	
	public String salvar() {
		return "";
	}
	
	public String cadastrarMenu() {
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
