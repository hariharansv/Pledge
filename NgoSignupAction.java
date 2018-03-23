/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author SOOSAI NIVEK
 */
public class NgoSignupAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static final String SUCCESS = "success";

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        NgoSignupActionBean nsb=(NgoSignupActionBean)form;
        String ngoid=nsb.getNgoid();
        String ngoname=nsb.getNgoname();
        String loc=nsb.getLocation();
        String spc=nsb.getSpace();
        String pass=nsb.getPassword();
        String cp=nsb.getCp();
        int flag=0;
        Connection con=DbConnection.getConnection();
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from ngo where id='"+ngoid+"'");
        System.out.println("After rs");
        if(rs.next())
        {
            System.out.println("if ");
            System.out.println(rs.getString(ngoid));
            return mapping.findForward("failure");        
        }
        else
        {
            System.out.println("else");
          int i=  st.executeUpdate("insert into ngo(name,id,location,sampspace,password) values('"+ngoname+"','"+ngoid+"','"+loc+"','"+spc+"','"+pass+"')");
            flag=1;
        }
        System.out.println("else");
       
            if(flag==1)
                           return mapping.findForward(SUCCESS);
            else
                   return mapping.findForward("failure");

    }
}
