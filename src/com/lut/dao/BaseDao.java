package com.lut.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.lut.util.Log;

public  abstract class BaseDao {
	
	protected Connection conn;	   //子类可以直接使用，外部对象不能调用
	
	public Connection getConn() {
		return conn;
	}

	public void setConn(Connection conn) {
		this.conn = conn;
	}

	public Connection openConnection() throws ClassNotFoundException,SQLException{
	
		try {
			if(conn == null || conn.isClosed()) {
				//加载驱动
				Class.forName("com.mysql.jdbc.Driver");
				//获取数据库连接
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_lutorderfood","root","admin");	
			}			
			
		} catch (ClassNotFoundException e) {
		    Log.logger.error(e.getMessage(),e);
		    throw e;                            //二次抛出异常
		}catch( SQLException e) {
			Log.logger.error(e.getMessage(),e);
			throw e;
		}
		
		return conn;
	}	
	
	public void closeConnection(){		
		if(conn != null) {
			try {
				conn.close();	
			} catch (Exception e) {
				Log.logger.error(e.getMessage(),e);
			}			
		}
		
	}
	
	/**
	 * 开启事务
	 * @throws Exception
	 */
	public void beginTransaction() throws Exception{
		this.openConnection();
		conn.setAutoCommit(false);
	}
	
	/**
	 * 事务提交
	 * @throws Exception
	 */
	public void commit() throws Exception {
		conn.commit();
	}
	
	
	public void rollback() throws Exception{
		conn.rollback();
	}
	

}
