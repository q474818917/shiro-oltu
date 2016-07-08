package com.dwarf.query;

public class SimpleUpdateField extends AbstractValueHoldingField implements
		UpdateField {

	private static final UpdateAction DEFAULT_ACTION = UpdateAction.SET;
	private UpdateAction action;

	public SimpleUpdateField(String name) {
		this(name, null);
	}

	/**
	 * Creates new instance with {@link #DEFAULT_ACTION}
	 * @param name 
	 * @param value
	 */
	public SimpleUpdateField(String name, Object value) {
		this(name, value, DEFAULT_ACTION);
	}

	/**
	 * @param name
	 * @param value
	 * @param action
	 */
	public SimpleUpdateField(String name, Object value, UpdateAction action) {
		super(name, value);
		this.action = action;
	}

	@Override
	public UpdateAction getAction() {
		return this.action != null ? this.action : DEFAULT_ACTION;
	}

}
