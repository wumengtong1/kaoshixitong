package com.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;

import com.dao.TJiaoyuanDAO;
import com.dao.TKechengDAO;
import com.dao.TTimuDAO;
import com.model.TTimu;
import com.opensymphony.xwork2.ActionSupport;

public class timuAction extends ActionSupport
{
	private int timuId;
	private String timuName;
	private String timuXuanxianga;
	private String timuXuanxiangb;
	private String timuXuanxiangc;
	private String timuXuanxiangd;
	private String timuDaan;
	private int timuFenshu;
	private String timuLeixing;
	private int kechengId;
	private String message;
	private String path;
	
	private TTimuDAO timuDAO;
	private TKechengDAO kechengDAO;
	
	
	
	public String timu_danxuan_Add()
	{
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuXuanxiangc(timuXuanxiangc);
		timu.setTimuXuanxiangd(timuXuanxiangd);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	
	
	public String timu_duoxuan_Add()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		String daAn="";
		String[] timuDaan=request.getParameterValues("timuDaan");
		for(int j=0;j<timuDaan.length;j++)
		{
			daAn=daAn+timuDaan[j];
		}
		
		
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuXuanxianga(timuXuanxianga);
		timu.setTimuXuanxiangb(timuXuanxiangb);
		timu.setTimuXuanxiangc(timuXuanxiangc);
		timu.setTimuXuanxiangd(timuXuanxiangd);
		timu.setTimuDaan(daAn);
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	
	
	public String timu_jianda_Add()
	{
		TTimu timu=new TTimu();
		timu.setTimuName(timuName);
		timu.setTimuDaan(timuDaan.trim());
		timu.setTimuFenshu(timuFenshu);
		timu.setTimuLeixing(timuLeixing);
		timu.setKechengId(kechengId);
		timu.setDel("no");
		timuDAO.save(timu);
		this.setMessage("操作成功");
		this.setPath("admin/timu/timuLeixing.jsp");
		return "succeed";
	}
	
	

	public String timuMana()
	{
		String sql="from TTimu where del='no' order by kechengId,timuLeixing";
		List timuList=timuDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<timuList.size();i++)
		{
			TTimu timu=(TTimu)timuList.get(i);
			timu.setKecheng(kechengDAO.findById(timu.getKechengId()));
		}
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timuList", timuList);
		return ActionSupport.SUCCESS;
	}
	
	
	
	public String timuDel()
	{
		TTimu timu=timuDAO.findById(timuId);
		timu.setDel("yes");
		timuDAO.attachDirty(timu);
		this.setMessage("操作成功");
		System.out.println(timu.getKechengId()+"&&&");
		this.setPath("timuMana.action");
		return "succeed";
	}
		
	public String timuDetail()
	{
		TTimu timu=timuDAO.findById(timuId);
		timu.setKecheng(kechengDAO.findById(timu.getKechengId()));
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timu", timu);
		return ActionSupport.SUCCESS;
	}
	

	public int getKechengId()
	{
		return kechengId;
	}

	public void setKechengId(int kechengId)
	{
		this.kechengId = kechengId;
	}

	public void setTimuLeixing(String timuLeixing)
	{
		this.timuLeixing = timuLeixing;
	}

	public String getMessage()
	{
		return message;
	}

	public TKechengDAO getKechengDAO()
	{
		return kechengDAO;
	}


	public void setKechengDAO(TKechengDAO kechengDAO)
	{
		this.kechengDAO = kechengDAO;
	}



	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
	}

	public String getTimuDaan()
	{
		return timuDaan;
	}

	public void setTimuDaan(String timuDaan)
	{
		this.timuDaan = timuDaan;
	}

	public TTimuDAO getTimuDAO()
	{
		return timuDAO;
	}

	public void setTimuDAO(TTimuDAO timuDAO)
	{
		this.timuDAO = timuDAO;
	}

	public int getTimuFenshu()
	{
		return timuFenshu;
	}

	public void setTimuFenshu(int timuFenshu)
	{
		this.timuFenshu = timuFenshu;
	}

	public int getTimuId()
	{
		return timuId;
	}

	public void setTimuId(int timuId)
	{
		this.timuId = timuId;
	}


	public String getTimuLeixing()
	{
		return timuLeixing;
	}

	public String getTimuName()
	{
		return timuName;
	}

	public void setTimuName(String timuName)
	{
		this.timuName = timuName;
	}

	public String getTimuXuanxianga()
	{
		return timuXuanxianga;
	}

	public void setTimuXuanxianga(String timuXuanxianga)
	{
		this.timuXuanxianga = timuXuanxianga;
	}

	public String getTimuXuanxiangb()
	{
		return timuXuanxiangb;
	}


	public void setTimuXuanxiangb(String timuXuanxiangb)
	{
		this.timuXuanxiangb = timuXuanxiangb;
	}

	public String getTimuXuanxiangc()
	{
		return timuXuanxiangc;
	}

	public void setTimuXuanxiangc(String timuXuanxiangc)
	{
		this.timuXuanxiangc = timuXuanxiangc;
	}

	public String getTimuXuanxiangd()
	{
		return timuXuanxiangd;
	}

	public void setTimuXuanxiangd(String timuXuanxiangd)
	{
		this.timuXuanxiangd = timuXuanxiangd;
	}
}
