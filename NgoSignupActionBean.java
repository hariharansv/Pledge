/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author SOOSAI NIVEK
 */
public class NgoSignupActionBean extends org.apache.struts.action.ActionForm {
    
    private String name;
    
    private int number;
    private String ngoname;
    private String ngoid;
    private String location;
    private String space;
    private String password;
    private String cp;
     public String getNgoname() {
        return ngoname;
    }
    public String getNgoid() {
        return ngoid;
    }
    public String getSpace() {
        return space;
    }
     public String getPassword() {
        return password;
    }
      public String getCp() {
        return cp;
    }
      public String getLocation() {
        return location;
    }
    /**
     * @return
     */
    public String getName() {
        return name;
    }
     public void setNgoname(String string) {
        ngoname = string;
    }
    public void setNgoid(String string) {
        ngoid = string;
    }
    public void setLocation(String string) {
        location = string;
    }
    public void setSpace(String string) {
        space = string;
    }
    public void setPassword(String string) {
        password = string;
    }
    public void setCp(String string) {
        cp = string;
    }
    /**
     * @param string
     */
    public void setName(String string) {
        name = string;
    }

    /**
     * @return
     */
    public int getNumber() {
        return number;
    }

    /**
     * @param i
     */
    public void setNumber(int i) {
        number = i;
    }

    /**
     *
     */
    public NgoSignupActionBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getName() == null || getName().length() < 1) {
            errors.add("name", new ActionMessage("error.name.required"));
            // TODO: add 'error.name.required' key to your resources
        }
        return errors;
    }
}
