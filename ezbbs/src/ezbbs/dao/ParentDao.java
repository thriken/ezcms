package ezbbs.dao;

import java.util.List;

import ezbbs.entity.Parent;


public interface ParentDao {
	public Parent findParent(int parentId);

	public List findParentList();

}
