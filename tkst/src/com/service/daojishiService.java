package com.service;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.directwebremoting.WebContext;
import org.directwebremoting.WebContextFactory;

import com.util.ChStr;
import com.util.kaoshishijian;

public class daojishiService
{
   public String getDaojishiShijian()
   {
	     WebContext ctx = WebContextFactory.get(); 
		 HttpSession session=ctx.getSession(); 
		 if(session.getAttribute("dangqianshijian")==null)
		 {
			 session.setAttribute("dangqianshijian", new Date().getTime());
		 }
		 
		 Object dangqianshijian=session.getAttribute("dangqianshijian");
		 ChStr chStr=new ChStr();
		 long a=Long.parseLong(dangqianshijian.toString());
		 long b=new java.util.Date().getTime();
		 long r=kaoshishijian.kaoshijian*60000-(b-a-1000);
		 int h=(int)Math.abs(r/3600000);
		 String hour=chStr.formatNO(h,2);
		 int m=(int)(r)%3600000/60000;
		 String minute=chStr.formatNO(m,2);
	     int s=(int)((r)%3600000)%60000/1000;
		 String second=chStr.formatNO(s,2);
		 String time=hour+":"+minute+":"+second;
		 System.out.println(time);
		 return time;
		 
		 
		 /*long a=Long.parseLong(dangqianshijian.toString());
		 long b=new java.util.Date().getTime();
		 int h=(int)Math.abs((b-a)/3600000);
		 String hour=chStr.formatNO(h,2);
		 int m=(int)(b-a)%3600000/60000;
		 String minute=chStr.formatNO(m,2);
		 int s=(int)((b-a)%3600000)%60000/1000;
		 String second=chStr.formatNO(s,2);
		 String time=hour+":"+minute+":"+second;
		 System.out.println(time);*/
   }
	 
}
