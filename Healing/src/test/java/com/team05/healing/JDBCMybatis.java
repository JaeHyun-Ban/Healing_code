package com.team05.healing;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/springconfig/DB-context.xml")
public class JDBCMybatis {
	
	//커넥션 풀 연결 -> JUnit test진행
	@Autowired
	private SqlSessionFactoryBean sql;
	
	//sql세션 접속 확인하기 -> ok
	@Test
	public void test()	{
		System.out.println(sql);
	}
	
	

}
