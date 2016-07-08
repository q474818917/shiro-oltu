package com.dwarf.repository;

import com.dwarf.bean.Task;

@MyBatisRepository
public interface TaskBatisRepository {
	Task get(Long id);
}
