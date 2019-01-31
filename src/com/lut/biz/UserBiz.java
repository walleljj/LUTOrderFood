package com.lut.biz;

import java.util.List;

import com.lut.dao.UserDao;
import com.lut.entity.Address;
import com.lut.entity.User;
import com.lut.exception.UnameViolateException;
import com.lut.exception.ValideNullException;
import com.lut.util.Log;


public class UserBiz {
	/**
	 * �û���¼
	 * 
	 * @param uname
	 * @param pwd
	 * @return
	 * @throws Exception
	 */
	public User login(String userid, String pwd) throws Exception {

		User user = null;
		Log.logger.info("UserBiz-->>login()");
		if (userid == null || pwd == null || userid.equals("") || pwd.equals("")) {
			throw new ValideNullException("�û���������Ϊ��");
		}
		UserDao dao = new UserDao();
		try {
			user = dao.login(userid, pwd);
		} finally {
			// �ر����ݿ�
			dao.closeConnection();
		}
	
		return user;
	}
	
	public boolean isValidUname(String userid) throws Exception {
		boolean bRet;
		
		UserDao dao = new UserDao();
		try {
			bRet = dao.isValidUname(userid);	
		} finally {
			dao.closeConnection();
		}
		
		return bRet;		
	}
	
	public void register(User user) throws ValideNullException,UnameViolateException,Exception {
		/*1. �ж��û����Ƿ�Ψһ
		       �ж��û��������볤�� 
		     �Ƿ�Ϊ���ж�
		  2. д�����û���Ϣ
		  3. �û�д��ɹ����Զ��������䣬���ֺ��
		*/
		if(user == null ) {
			throw new ValideNullException("�û���������Ϊ�գ�����");
		}
		if(user.getUserid() == null || user.getPwd()==null || user.getUserid().equals("") || user.getPwd().equals("")) {
			throw new ValideNullException("�û���������Ϊ�գ�����");
		}
		user.setMoney(0f);
		UserDao dao = new UserDao();
		boolean bRet = dao.isValidUname(user.getUserid());
		if(bRet) {
			dao.beginTransaction();               //��������
			try {
				dao.register(user);	
				dao.commit();                //�ύ����
			} catch (Exception e) {
				dao.rollback();              //�ع�����
				throw e;
			}finally {
				dao.closeConnection();       //�ͷ���Դ
			}			
		}else {
			throw new UnameViolateException("�û����ѱ�ռ��");
		}	
	}
	
	public User updateperson(User user) throws Exception{
		UserDao dao = new UserDao();
		dao.beginTransaction();               //��������
		try {
			dao.updateperson(user);	
			dao.commit();                //�ύ����
		} catch (Exception e) {
			dao.rollback();              //�ع�����
			throw e;
		}finally {
			dao.closeConnection();       //�ͷ���Դ
		}
		return user;
	}
	
	public void updatepwd(String npwd, String userid) throws Exception {
		Log.logger.info("UserBiz-->>updatepwd()");
		UserDao dao = new UserDao();
		dao.beginTransaction();               //��������
		try {
		dao.updatepwd(npwd, userid);
		dao.commit();                //�ύ����
		} catch (Exception e) {
			dao.rollback();              //�ع�����
			throw e;
		}finally {
			dao.closeConnection();       //�ͷ���Դ
		}
	}

	public void keepaddress(Address addr) throws Exception {
		Log.logger.info("UserBiz-->>keepaddress()");
		UserDao dao = new UserDao();
		dao.beginTransaction();               //��������
		try {
		dao.keepaddress(addr);
		dao.commit();                //�ύ����
		} catch (Exception e) {
			dao.rollback();              //�ع�����
			throw e;
		}finally {
			dao.closeConnection();       //�ͷ���Դ
		}
		
	}

	public List<Address> getAddressInfo(String userid) throws Exception {
		List<Address> addrs;
		
		UserDao dao = new UserDao();
		try {
			addrs = dao.getAddressInfo(userid);
		} finally {
			dao.closeConnection();
		}		
		return addrs;
	}

	public void delAddress(int addressid) throws Exception {
		UserDao dao = new UserDao();
		dao.beginTransaction();               //��������
		try {
		dao.delAddress(addressid);
		dao.commit();                //�ύ����
		} catch (Exception e) {
			dao.rollback();              //�ع�����
			throw e;
		}finally {
			dao.closeConnection();       //�ͷ���Դ
		}
	}
	
	public void alertAddress(Address address) throws Exception {
		UserDao dao = new UserDao();
		dao.beginTransaction();               //��������
		try {
		dao.alertAdress(address);
		dao.commit();                //�ύ����
		} catch (Exception e) {
			dao.rollback();              //�ع�����
			throw e;
		}finally {
			dao.closeConnection();       //�ͷ���Դ
		}
	}
}
