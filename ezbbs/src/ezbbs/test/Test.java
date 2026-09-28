package ezbbs.test;

import ezbbs.dao.*;
import ezbbs.dao.impl.*;
import ezbbs.entity.*;


public class Test {

	public static void main(String[] args) {
		BbsinfoDao binfoDao = new BbsinfoDaoImpl();
		BbsInfo bbsinfo = new BbsInfo();
		bbsinfo = binfoDao.getInfo();
		System.out.print(bbsinfo.getName());
	}
	
}
