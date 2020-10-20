package com.mem.model;

import java.util.List;

public interface MemDAO_interface {
	public void insert(MemVO memVO);
	public void updateByMem(MemVO memVO);
	public void updateByEmp(MemVO memVO);
	public MemVO findByMem_no(String mem_no);
	public List<MemVO> getAll();
}
