package com.dwarf.bean;

import java.io.Serializable;

public class Task implements Serializable {

	private static final long serialVersionUID = -4508964193818601273L;
	
	private Long id;
	
	private String name;
	
	public Task(){
		
	}

	public Task(Long id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
