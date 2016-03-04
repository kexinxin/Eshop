package test.action;

import com.opensymphony.xwork2.ActionSupport;

public class CustomerAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return this.SUCCESS;
	}
	
	public String test(){
		return SUCCESS;
	}
	
}
