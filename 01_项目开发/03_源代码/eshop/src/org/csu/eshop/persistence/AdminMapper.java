package org.csu.eshop.persistence;
import org.csu.eshop.domain.Admin;


public interface AdminMapper {

    public Admin getAdminByUserNameAndPassword(Admin admin);

}