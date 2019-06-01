package com.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.dao.TTeaDAO;
import com.model.TTea;
import com.opensymphony.xwork2.ActionSupport;

public class teaAction extends ActionSupport
{
	private Integer teaId;
	private String teaBianhao;
	private String teaRealname;
	private String teaSex;

	private String teaAge;
	private String loginPw;
	private String del;
	
	
	private TTeaDAO teaDAO;
	
	
	public String teaAdd()
	{
		TTea tea=new TTea();
		
		tea.setTeaId(teaId);
		tea.setTeaBianhao(teaBianhao);
		tea.setTeaRealname(teaRealname);
		tea.setTeaSex(teaSex);
		
		tea.setTeaAge(teaAge);
		tea.setLoginPw(loginPw);
		tea.setDel("no");
		teaDAO.save(tea);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "添加成功");
		return "msg";
	}
	
	
	public String teaMana()
	{
		String sql="from TTea where del='no'";
		List teaList=teaDAO.getHibernateTemplate().find(sql);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("teaList", teaList);
		return ActionSupport.SUCCESS;
	}
	
	public String teaDel()
	{
		TTea tea=teaDAO.findById(teaId);
		tea.setDel("yes");
		
		teaDAO.attachDirty(tea);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "删除成功");
		return "msg";
	}


	public Integer getTeaId() {
		return teaId;
	}


	public void setTeaId(Integer teaId) {
		this.teaId = teaId;
	}


	public String getTeaBianhao() {
		return teaBianhao;
	}


	public void setTeaBianhao(String teaBianhao) {
		this.teaBianhao = teaBianhao;
	}


	public String getTeaRealname() {
		return teaRealname;
	}


	public void setTeaRealname(String teaRealname) {
		this.teaRealname = teaRealname;
	}


	public String getTeaSex() {
		return teaSex;
	}


	public void setTeaSex(String teaSex) {
		this.teaSex = teaSex;
	}


	public String getTeaAge() {
		return teaAge;
	}


	public void setTeaAge(String teaAge) {
		this.teaAge = teaAge;
	}


	public String getLoginPw() {
		return loginPw;
	}


	public void setLoginPw(String loginPw) {
		this.loginPw = loginPw;
	}


	public String getDel() {
		return del;
	}


	public void setDel(String del) {
		this.del = del;
	}


	public TTeaDAO getTeaDAO() {
		return teaDAO;
	}


	public void setTeaDAO(TTeaDAO teaDAO) {
		this.teaDAO = teaDAO;
	}
	
	
}
