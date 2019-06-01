package com.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.dao.TAdminDAO;
import com.dao.TFenshuDAO;
import com.dao.TJiaoyuanDAO;
import com.dao.TKechengDAO;
import com.dao.TShitiDAO;
import com.dao.TStuDAO;
import com.dao.TTimuDAO;
import com.model.TAdmin;
import com.model.TFenshu;
import com.model.TJiaoyuan;
import com.model.TShiti;
import com.model.TStu;
import com.model.TTimu;
import com.opensymphony.xwork2.ActionSupport;
import com.util.Pagination;

public class shitiAction extends ActionSupport
{
	private int shitiId;
	private String shitiName;
	private String shitiJieshao;
	private String timuIdList;
	 
	private String message;
	private String path;
	

	private TShitiDAO shitiDAO;
	private TTimuDAO timuDAO;
	private TKechengDAO kechengDAO;
	private TJiaoyuanDAO jiaoyuanDAO;
	private TFenshuDAO fenshuDAO;
	private TStuDAO stuDAO;
	
	public String shitiAdd()
	{
		TShiti shiti=new TShiti();
		shiti.setShitiName(shitiName);
		shiti.setShitiJieshao(shitiJieshao);
		shiti.setTimuIdList("");
		shiti.setShitiShijian(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		shiti.setDel("no");
		shitiDAO.save(shiti);
		this.setMessage("操作成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	
	
	public String shitiMana()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	public String shitiDel()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		shiti.setDel("yes");
		shitiDAO.attachDirty(shiti);
		this.setMessage("删除成功");
		this.setPath("shitiMana.action");
		return "succeed";
	}
	
	public String shiti_timu_update_pre()
	{
		String sql="from TTimu where del='no' order by kechengId,timuLeixing";
		List timuList=timuDAO.getHibernateTemplate().find(sql);
		for(int i=0;i<timuList.size();i++)
		{
			TTimu timu=(TTimu)timuList.get(i);
			timu.setKecheng(kechengDAO.findById(timu.getKechengId()));
		}
		
		HttpServletRequest request=ServletActionContext.getRequest();
		
		request.setAttribute("shitiId", request.getParameter("shitiId"));
		request.setAttribute("timuList", timuList);
		return ActionSupport.SUCCESS;
	}
	
	public String shiti_timu_update()
	{
		TShiti shiti=shitiDAO.findById(shitiId);
		shiti.setTimuIdList(timuIdList);
		shitiDAO.update(shiti);
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("msg", "更新完毕");
		return "msg";
	}
	
	public String shiti_timu_liulan()
	{
		List timuList=new ArrayList();
		
		TShiti shiti=shitiDAO.findById(shitiId);
		String timuIdList=shiti.getTimuIdList();
		
		String[] s={};
		if(timuIdList.equals("")==false)
		{
			s=timuIdList.split(",");
		}
		for(int i=0;i<s.length;i++)
		{
			int timuId=Integer.parseInt(s[i].trim());
			TTimu timu=timuDAO.findById(timuId);
			timu.setKecheng(kechengDAO.findById(timu.getKechengId()));
			timuList.add(timu);
		}
		
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("timuList", timuList);
		return ActionSupport.SUCCESS;
	}
	
	public String shiti_all()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String shiti_kaoshi_timu()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		Map session= ServletActionContext.getContext().getSession();
		TStu stu=(TStu)session.get("stu");
		int shitiId=Integer.parseInt(request.getParameter("shitiId"));
		
		String sql="from TJiaoyuan where shitiId=? and stuId=?";
		Object con[]={shitiId,stu.getStuId()};
		List jiaoyuanList=jiaoyuanDAO.getHibernateTemplate().find(sql,con);
		if(jiaoyuanList.size()>0)
		{
			request.setAttribute("msg", "您已经参加过。请不要重复考试");
			return "msg";
		}
		
		List timuList=new ArrayList();
		
		TShiti shiti=shitiDAO.findById(shitiId);
		String timuIdList=shiti.getTimuIdList();
		
		String[] s={};
		if(timuIdList.equals("")==false)
		{
			s=timuIdList.split(",");
		}
		for(int i=0;i<s.length;i++)
		{
			int timuId=Integer.parseInt(s[i].trim());
			TTimu timu=timuDAO.findById(timuId);
			timu.setKecheng(kechengDAO.findById(timu.getKechengId()));
			timuList.add(timu);
		}
		
		request.setAttribute("timuList", timuList);
		request.setAttribute("shitiId", shitiId);
		return ActionSupport.SUCCESS;
	}
	
	
	public String shiti_jiaojuan()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		Map session= ServletActionContext.getContext().getSession();
		TStu stu=(TStu)session.get("stu");
		
		String timuIdList=shitiDAO.findById(shitiId).getTimuIdList();
		String[] s={};
		if(timuIdList.equals("")==false)
		{
			s=timuIdList.split(",");
		}
		for(int i=0;i<s.length;i++)
		{
			int timuId=Integer.parseInt(s[i].trim());
			String daAn="";
			String[] da_an=request.getParameterValues(String.valueOf(timuId));
			for(int j=0;j<da_an.length;j++)
			{
				daAn=daAn+da_an[j];
			}
			
			TJiaoyuan jiaoyuan=new TJiaoyuan();
			jiaoyuan.setStuId(stu.getStuId());
			jiaoyuan.setShitiId(shitiId);
			jiaoyuan.setTimuId(timuId);
			jiaoyuan.setTimuDaan(daAn);
			
			jiaoyuanDAO.save(jiaoyuan);
		}
		
		request.setAttribute("msg", "考试完毕，祝您取得好成绩");
		return "msg";
	}
	
	
	public String shiti_all1()
	{
		String sql="from TShiti where del='no'";
		List shitiList=shitiDAO.getHibernateTemplate().find(sql);
		Map request=(Map)ServletActionContext.getContext().get("request");
		request.put("shitiList", shitiList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String shiti_yuejuan()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int shitiId=Integer.parseInt(request.getParameter("shitiId"));
		int stuId=Integer.parseInt(request.getParameter("stuId"));
		
		String sql11111="from TFenshu where shitiId=? and stuId=?";
		Object con11111[]={shitiId,stuId};
		List list=fenshuDAO.getHibernateTemplate().find(sql11111,con11111);//是否已经阅卷。并且打分
		if(list.size()>0)
		{
			request.setAttribute("msg", "已经阅卷过。请重新选择");
			return "msg";
		}
		
		String sql="from TJiaoyuan where shitiId=? and stuId=?";
		Object con[]={shitiId,stuId};
		List jiaoyuanList=jiaoyuanDAO.getHibernateTemplate().find(sql,con);
		if(jiaoyuanList.size()==0)
		{
			request.setAttribute("msg", "该考生没有参加考试");
			return "msg";
		}
		else
		{
			List timuList=new ArrayList();
			
			for(int i=0;i<jiaoyuanList.size();i++)
			{
				TJiaoyuan jiaoyuan=(TJiaoyuan)jiaoyuanList.get(i);
				TTimu timu=timuDAO.findById(jiaoyuan.getTimuId());
				timu.setTimuDaanAsStu(jiaoyuan.getTimuDaan());
				timuList.add(timu);
				request.setAttribute("timuList", timuList);
				request.setAttribute("shitiId", shitiId);
				request.setAttribute("stuId", stuId);
			}
		}
		return ActionSupport.SUCCESS;
	}
	
	
	public String shiti_fenshu_add()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int fenshu=Integer.parseInt(request.getParameter("fenshu"));
		int shitiId=Integer.parseInt(request.getParameter("shitiId"));
		int stuId=Integer.parseInt(request.getParameter("stuId"));
		
		TFenshu fenshu1=new TFenshu();
		fenshu1.setFenshu(fenshu);
		fenshu1.setShitiId(shitiId);
		fenshu1.setStuId(stuId);
		fenshuDAO.save(fenshu1);
		
		request.setAttribute("msg", "阅卷完毕");
		return "msg";
	}
	
	
	public String shiti_fenshu_Mana()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		int shitiId=Integer.parseInt(request.getParameter("shitiId"));
		
		String sql="from TFenshu where shitiId=? order by fenshu desc";
		Object[] cc={shitiId};
		List fenshuList=fenshuDAO.getHibernateTemplate().find(sql,cc);
		for(int i=0;i<fenshuList.size();i++)
		{
			TFenshu fenshu=(TFenshu)fenshuList.get(i);
			fenshu.setStu(stuDAO.findById(fenshu.getStuId()));
		}
		
		request.setAttribute("fenshuList", fenshuList);
		return ActionSupport.SUCCESS;
	}
	
	
	public String fenshuMine()
	{
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		TStu stu=(TStu)session.getAttribute("stu");
		
		String sql="from TFenshu where stuId=?";
		Object[] cc={stu.getStuId()};
		List fenshuList=fenshuDAO.getHibernateTemplate().find(sql,cc);
		for(int i=0;i<fenshuList.size();i++)
		{
			TFenshu fenshu=(TFenshu)fenshuList.get(i);
			fenshu.setShiti(shitiDAO.findById(fenshu.getShitiId()));
		}
		
		request.setAttribute("fenshuList", fenshuList);
		return ActionSupport.SUCCESS;
	}
	 
	
	public String getMessage()
	{
		return message;
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

	public TShitiDAO getShitiDAO()
	{
		return shitiDAO;
	}

	public void setShitiDAO(TShitiDAO shitiDAO)
	{
		this.shitiDAO = shitiDAO;
	}

	public TKechengDAO getKechengDAO()
	{
		return kechengDAO;
	}



	public void setKechengDAO(TKechengDAO kechengDAO)
	{
		this.kechengDAO = kechengDAO;
	}



	public TTimuDAO getTimuDAO()
	{
		return timuDAO;
	}



	public void setTimuDAO(TTimuDAO timuDAO)
	{
		this.timuDAO = timuDAO;
	}



	public String getTimuIdList()
	{
		return timuIdList;
	}



	public void setTimuIdList(String timuIdList)
	{
		this.timuIdList = timuIdList;
	}



	public TJiaoyuanDAO getJiaoyuanDAO()
	{
		return jiaoyuanDAO;
	}



	public void setJiaoyuanDAO(TJiaoyuanDAO jiaoyuanDAO)
	{
		this.jiaoyuanDAO = jiaoyuanDAO;
	}



	public int getShitiId()
	{
		return shitiId;
	}

	public void setShitiId(int shitiId)
	{
		this.shitiId = shitiId;
	}

	public String getShitiJieshao()
	{
		return shitiJieshao;
	}

	public void setShitiJieshao(String shitiJieshao)
	{
		this.shitiJieshao = shitiJieshao;
	}

	public String getShitiName()
	{
		return shitiName;
	}

	public TFenshuDAO getFenshuDAO()
	{
		return fenshuDAO;
	}



	public void setFenshuDAO(TFenshuDAO fenshuDAO)
	{
		this.fenshuDAO = fenshuDAO;
	}



	public TStuDAO getStuDAO()
	{
		return stuDAO;
	}



	public void setStuDAO(TStuDAO stuDAO)
	{
		this.stuDAO = stuDAO;
	}



	public void setShitiName(String shitiName)
	{
		this.shitiName = shitiName;
	}
	
}
