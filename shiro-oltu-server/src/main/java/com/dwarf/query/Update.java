package com.dwarf.query;

public interface Update {

	ValueHoldingField getIdField();
	
	Iterable<UpdateField> getUpdates();
	
	Object getVersion();
}
