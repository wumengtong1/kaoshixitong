package com.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.dao.TAdminDAO;
import com.dao.TKechengDAO;
import com.dao.TShitiDAO;
import com.dao.TStuDAO;
import com.dao.TTeaDAO;
import com.model.TAdmin;
import com.model.TStu;
import com.model.TTea;

public class loginService
{
	private TAdminDAO adminDAO;
	private TStuDAO stuDAO;
	private TTeaDAO teaDAO;
	private TKechengDAO kechengDAO;
	
	public TKechengDAO getKechengDAO()
	{
		return kechengDAO;
	}
	public void setKechengDAO(TKechengDAO kechengDAO)
	{
		this.kechengDAO = kechengDAO;
	}
	public TAdminDAO getAdminDAO()
	{
		return adminDAO;
	}
	public void setAdminDAO(TAdminDAO adminDAO)
	{
		this.adminDAO = adminDAO;
	}
	public TStuDAO getStuDAO()
	{
		return stuDAO;
	}
	public void setStuDAO(TStuDAO stuDAO)
	{
		this.stuDAO = stuDAO;
	}
	public TTeaDAO getTeaDAO()
	{
		return teaDAO;
	}
	public void setTeaDAO(TTeaDAO teaDAO)
	{
		this.teaDAO = teaDAO;
	}
	
	
	
	public String login(String userName,String userPw,int userType)
	{
		String result="no";
		
		if(userType==0)//系统管理员登陆
		{
			String sql="from TAdmin where userName=? and userPw=?";
			Object[] con={userName,userPw};
			List adminList=adminDAO.getHibernateTemplate().find(sql,con);
			if(adminList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TAdmin admin=(TAdmin)adminList.get(0);
				 session.setAttribute("userType", 0);
	             session.setAttribute("admin", admin);
	             result="yes";
			}
		}
		if(userType==1)//老师登陆
		{
			String sql="from TTea where teaBianhao=? and loginPw=? and del='no'";
			Object[] con={userName,userPw};
			List teaList=teaDAO.getHibernateTemplate().find(sql,con);
			if(teaList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TTea tea=(TTea)teaList.get(0);
				 session.setAttribute("userType", 1);
	             session.setAttribute("tea", tea);
	             result="yes";
			}
			
		}
		if(userType==2)//学生登陆
		{
			String sql="from TStu where stuXuehao=? and loginPw=? and del='no'";
			Object[] con={userName.trim(),userPw.trim()};
			List adminList=adminDAO.getHibernateTemplate().find(sql,con);
			if(adminList.size()==0)
			{
				 result="no";
			}
			else
			{
				 WebContext ctx = WebContextFactory.get(); 
				 HttpSession session=ctx.getSession(); 
				 TStu stu=(TStu)adminList.get(0);
				 session.setAttribute("userType", 2);
	             session.setAttribute("stu", stu);
	             result="yes";
			}
		}
		return result;
	}

    public String adminPwEdit(String userPwNew)
    {
		System.out.println("DDDD");
    	try 
		{
			Thread.sleep(700);
		} 
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		WebContext ctx = WebContextFactory.get(); 
		HttpSession session=ctx.getSession(); 
		 
		TAdmin admin=(TAdmin)session.getAttribute("admin");
		admin.setUserPw(userPwNew);
		
		adminDAO.getHibernateTemplate().update(admin);
		session.setAttribute("admin", admin);
		
		return "yes";
    }
    
    
    public List kechengSelect()
    {
    	try 
		{
			Thread.sleep(1000);
		} 
		catch (InterruptedException e)
		{
			e.printStackTrace();
		}
    	String sql="from TKecheng where del='no'";
		List kechengList=kechengDAO.getHibernateTemplate().find(sql);
		return kechengList;
    }
    
    
    
    public List stuSelect()
    {
    	List stuList=stuDAO.getHibernateTemplate().find("from TStu where del='no'");
		return stuList;
    }
    
   
}
