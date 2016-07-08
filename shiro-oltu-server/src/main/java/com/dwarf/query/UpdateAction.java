package com.dwarf.query;

public enum UpdateAction {
	
	ADD("add"), INC("inc"), SET("set"), REMOVE("remove");

	private String solrOperation;

	UpdateAction(String solrOperation) {
		this.solrOperation = solrOperation;
	}

	public String getSolrOperation() {
		return this.solrOperation;
	}
	
}
