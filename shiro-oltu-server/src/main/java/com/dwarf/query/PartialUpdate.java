package com.dwarf.query;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PartialUpdate implements Update {
	
	private final ValueHoldingField idField;
	private Object version;
	private final List<UpdateField> updates = new ArrayList<UpdateField>();
	
	public PartialUpdate(String idFieldName, Object idFieldValue) {
		this(new IdField(idFieldName, idFieldValue));
	}

	public PartialUpdate(Field idField, Object idFieldValue) {
		this(new IdField(idField.getName(), idFieldValue));
	}

	PartialUpdate(IdField idField) {
		this.idField = idField;
	}

	@Override
	public ValueHoldingField getIdField() {
		return this.idField;
	}

	/**
	 * Add field with given name and value to the fields to be updated. Default {@link UpateAction} will be
	 * {@link UpateAction.SET}.
	 * 
	 * @param fieldName
	 * @param value
	 */
	public void add(String fieldName, Object value) {
		add(new SimpleUpdateField(fieldName, value));
	}

	/**
	 * Add {@link UpdateField} to the list of fields to be updated
	 * 
	 * @param field
	 */
	public void add(UpdateField field) {
		this.updates.add(field);
	}

	/**
	 * Add field with given name and value using {@link UpateAction.ADD} to the fields to be updated.
	 * 
	 * @param fieldName
	 * @param value
	 */
	public void addValueToField(String fieldName, Object value) {
		add(new SimpleUpdateField(fieldName, value, UpdateAction.ADD));
	}

	/**
	 * Add field with given name and value using {@link UpateAction.SET} to the fields to be updated.
	 * 
	 * @param fieldName
	 * @param value
	 */
	public void setValueOfField(String fieldName, Object value) {
		add(new SimpleUpdateField(fieldName, value, UpdateAction.SET));
	}

	/**
	 * Add field with given name and value using {@link UpateAction.INC} to the fields to be updated.
	 * 
	 * @param fieldName
	 * @param value
	 */
	public void increaseValueOfField(String fieldName, Object value) {
		add(new SimpleUpdateField(fieldName, value, UpdateAction.INC));
	}

	@Override
	public List<UpdateField> getUpdates() {
		return Collections.unmodifiableList(updates);
	}

	@Override
	public Object getVersion() {
		return this.version;
	}

	/**
	 * set {@code _version_} of document to apply update to. Use null to skip version check in solr.
	 * 
	 * @param documentVersion
	 */
	public void setVersion(Object documentVersion) {
		this.version = documentVersion;
	}
	
	static class IdField extends AbstractValueHoldingField {

		public IdField(String fieldName, Object fieldValue) {
			super(fieldName, fieldValue);
		}

	}

}
