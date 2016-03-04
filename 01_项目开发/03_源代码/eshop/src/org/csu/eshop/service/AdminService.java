package org.csu.eshop.service;
import org.csu.eshop.domain.Admin;
import org.csu.eshop.persistence.AdminMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class AdminService {

		ApplicationContext appContext = new ClassPathXmlApplicationContext(
			"/applicationContext.xml");
	  private AdminMapper adminMapper=appContext
			.getBean(AdminMapper.class);

    
    public Admin getAdmin(String userName, String passWord) {
    	
        Admin admin = new Admin();
        admin.setAdminName(userName);
        admin.setPassWord(passWord);
        return adminMapper.getAdminByUserNameAndPassword(admin);
    }

}