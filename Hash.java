/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author SOOSAI NIVEK
 */
public class Hash {
 
    public static String getKey(HashMap<String,Integer> hm,int val)
    {
        for(Map.Entry<String,Integer> e:hm.entrySet()){
            if(val==e.getValue())
                return e.getKey();
        }
        return null;
    }
    public static String[] getKeys(HashMap<String,Integer> hm){
        int l=hm.size();
        System.out.println("HashMap size is "+l);
        System.out.println("In get Keys method");
        String a[]=new String[l];
        int j=0;
        for(Map.Entry<String,Integer> e:hm.entrySet()){
            a[j++]=e.getKey();
            System.out.println("Key "+j+" "+e.getKey());
        }
            return a;
    }
    public static int[] getValues(HashMap<String,Integer> hm){
        int l=hm.size();
        System.out.println("In getValues method");
        int a[]=new int[l];
        int j=0;
        for(Map.Entry<String,Integer> e:hm.entrySet()){
            a[j++]=e.getValue();
            System.out.println("Value "+j+" "+e.getValue());
        }
        return a;
    }
    public static HashMap<String,Integer> integrate(HashMap<String,Integer> h1,HashMap<String,Integer> h2){
        HashMap<String,Integer> h3=new HashMap<String,Integer>(); 
        System.out.println("In integrate method");
        for(Map.Entry<String,Integer> e:h2.entrySet()){
            if((check(h1,e.getKey()))==1)
            {
                System.out.println("Putting values "+e.getKey()+" "+e.getValue());
                h3.put(e.getKey(), e.getValue());
            }
                
        }
        return h3;
    }

public static int check(HashMap<String,Integer> h,String key) {
    int flag=1;
    if(h.size()<=0)
        return flag;
    else {
    for(Map.Entry<String,Integer> e:h.entrySet()){
        if(key.equalsIgnoreCase(e.getKey()))
            flag=0;
    }
    }
    return flag;
}
public static void updateFlag()
{
    try {
        System.out.println("In update flag method");
        int flag=0;
        int pri=1;
   Connection con=DbConnection.getConnection();
   Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select flag from flags where pri="+pri);
   if(rs.next()){
    flag=rs.getInt("flag");
    System.out.println("Inside rs.next flag is "+flag);
            }
   if(flag==1)
   st.executeUpdate("update flags set flag=0 where pri="+pri);
   else
          st.executeUpdate("update flags set flag=1 where pri="+pri);
    }
    catch(Exception e){
        System.out.println("Exception "+e);
    }
}
public  static int getFlag() {
    int flag=0;
    int pri=1;
    try{
    Connection con=DbConnection.getConnection();
   Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select flag from flags where pri="+pri);
   if(rs.next()){
    flag=rs.getInt("flag");
            }
}
    catch(Exception e){
                System.out.println("Exception "+e);
    }
    return flag;
}
}