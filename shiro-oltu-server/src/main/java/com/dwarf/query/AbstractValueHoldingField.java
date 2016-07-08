package com.dwarf.query;

public class AbstractValueHoldingField extends SimpleField implements
		ValueHoldingField {

	private Object value;

	protected AbstractValueHoldingField(String fieldName) {
		super(fieldName);
	}

	protected AbstractValueHoldingField(String fieldName, Object fieldValue) {
		this(fieldName);
		this.value = fieldValue;
	}

	@Override
	public Object getValue() {
		return this.value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

}
