package com.rest.demo.util;


import org.springframework.beans.factory.InitializingBean;

import com.zaxxer.hikari.HikariConfig;



public class EncryptHikariConfig extends HikariConfig implements InitializingBean {

	@Override
	public void afterPropertiesSet() throws Exception {
		super.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		super.setUsername("training");
		super.setJdbcUrl("jdbc:sqlserver://" + "172.19.246.21" + ":" + "1433" + ";databaseName=" + "EsunTraining" + ";");
		super.setPassword("168@esun");
	}

}
