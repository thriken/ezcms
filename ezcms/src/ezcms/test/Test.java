package ezcms.test;

import ezcms.entity.*;
import ezcms.dao.impl.*;
import ezcms.dao.*;

public class Test {

	public static void main(String[] args) {
		Notice notice = new Notice();
		NoticeDao ndao = new NoticeDaoImpl();
		notice.setTitle("���Թ���");
		notice.setNotice("���Թ�������");
		int i = 0;
		try {
			i = ndao.addNotice(notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(i);
	}
}
