package com.dongyeop.okcomputer.dao_database;

import com.dongyeop.okcomputer.dto.*;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class JdbcTemplateTest {
	public static void main (String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("stockManagement-servlet.xml");
		
		DaoComputerImple dao = (DaoComputerImple) ctx.getBean("computerDao");
		List<Computer> coms = dao.getAllComputers();
		for (Computer c : coms) {
			System.out.println(c);
		}
		
		((ClassPathXmlApplicationContext) ctx).close();
	}

}
