package com.gdoj.compileinfo.service;

import com.gdoj.compileinfo.vo.CompileInfo;

public interface CompileInfoService {
	public CompileInfo queryCompileInfo(Integer solutionId);
	public void save(CompileInfo compileInfo);
}
