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
public class NgoLoginAction extends org.apache.struts.action.Action {

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
        NgoLoginActionBean nlb=(NgoLoginActionBean)form;
        String ngoid=nlb.getMail();
        String pass=nlb.getPassword();
        int flag=0;
         try {
           // Class.forName("org.apache.derby.jdbc.ClientDriver");
            //Connection con=DriverManager.getConnection("jdbc:derby://localhost:1527/userdb","root","root");
           Connection con=DbConnection.getConnection();
           Statement st=con.createStatement();
            ResultSet  rs=st.executeQuery("select * from ngo where id='"+ngoid+"' and password='"+pass+"'");
            
        if(rs.next())
            flag=1;
        else
            flag=0;            
        }
         catch(Exception e){
             flag=0;
         }
        if(flag==1)
        return mapping.findForward(SUCCESS);
        else
        return mapping.findForward("failure");
    }
}
