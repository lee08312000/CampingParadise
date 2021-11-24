package com.campTagDetail.model;

public interface CampTagDetailDAO {

	void insert(CampTagDetailVO campTagDetailVO);

	void update(CampTagDetailVO campTagDetailVO);

	CampTagDetailVO findByPrimaryKey(Integer campTagId, Integer campId);

	void delete(Integer campTagId, Integer campId);

}
