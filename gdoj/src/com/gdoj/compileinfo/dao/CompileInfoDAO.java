package com.gdoj.compileinfo.dao;

import com.gdoj.compileinfo.vo.CompileInfo;

public interface CompileInfoDAO {
	public CompileInfo queryCompileInfo(Integer solutionId);
	public void save(CompileInfo compileInfo);
}
