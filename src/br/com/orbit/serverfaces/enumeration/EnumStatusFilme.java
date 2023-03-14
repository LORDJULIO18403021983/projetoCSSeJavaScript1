package br.com.orbit.serverfaces.enumeration;

import java.util.LinkedHashMap;
import java.util.Map;

public enum EnumStatusFilme {
	DISPONIVEL(0, "Disponível"), ALUGADO(1, "Alugado"), EM_CARTAZ(2, "Em Cartaz.");

	private Integer codigo;
	private String descricao;

	private EnumStatusFilme(Integer codigo, String descricao) {
		this.codigo = codigo;
		this.descricao = descricao;
	}

	public Integer getCodigo() {
		return codigo;
	}

	public String getDescricao() {
		return descricao;
	}

	public static EnumStatusFilme getByDescricao(String descricao) {
		for (EnumStatusFilme obj : EnumStatusFilme.values()) {
			if (obj.descricao.equals(descricao)) {
				return obj;
			}
		}
		return null;
	}

	public static EnumStatusFilme getByValor(Integer valor) {
		for (EnumStatusFilme obj : EnumStatusFilme.values()) {
			if (obj.codigo.equals(valor)) {
				return obj;
			}
		}
		return null;
	}

	public static Map<String, Object> retornaSelectItems() {
		Map<String, Object> listMap = new LinkedHashMap<String, Object>();
		for (EnumStatusFilme obj : EnumStatusFilme.values()) {
			listMap.put(obj.getDescricao(), obj.getCodigo());
		}
		return listMap;
	}
}
