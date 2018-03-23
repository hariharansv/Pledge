/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author SOOSAI NIVEK
 */
public class SplitMoney {
    public static int amt;
    public static HashMap<String,Integer> split(HashMap<String,Integer> hm,int[] cluster,int amot,int total) throws SQLException {
        amt=amot;    
        Connection con=DbConnection.getConnection();
            Statement st=con.createStatement();
            Statement s=con.createStatement();
            ResultSet rs;
            int l=cluster.length;
            System.out.println("Cluster length is "+l);
            HashMap<String,Integer> hmap=new HashMap<String,Integer>();
            System.out.println("Inside while in Split");
                int j=0;
                int flag=0;
                for(j=0;j<l;j++)
                {
                    System.out.println("Inside j iteration "+j);
                     flag=0;
                    String ngoid=Hash.getKey(hm,cluster[j]);
                    System.out.println("ngo id is "+ngoid);
                    rs=st.executeQuery("select * from ngo where id='"+ngoid+"'");
                    if(rs.next()){
                        System.out.println("inside rs.next");
                        int amnt=rs.getInt("amount");
                        int fun=rs.getInt("fund");
                        float don;
                        System.out.println("amount is "+amt+" and fund is "+fun);
                        float tf,ta;
                        int f,a;
                        don=Math.abs((amnt*amt)/total);
                        System.out.println("don is "+don);
                        if(amnt>0)
                        {
                        System.out.println("amnt>0 is "+amnt);
                        tf=(float)fun+don;
                        ta=(float)amnt-don;
                        f=(int)tf;
                        a=(int)ta;
                        System.out.println("a is "+a+" and f is "+f);
                        s.executeUpdate("update ngo set amount="+a+",fund="+f+" where id='"+ngoid+"'");
                        amt=amt-(int)don;
                        System.out.println("amt is "+amt);
                        hmap.put(rs.getString("name"),(int)f-fun);
                        }      
    }
                }
                return hmap; 
    }
    public  static HashMap<String,Integer> getHashMap()
    {
        
             HashMap<String,Integer> hm=new  HashMap<String,Integer>();

        try
        {
            Connection con=DbConnection.getConnection();
            Statement st=con.createStatement();
            Statement s=con.createStatement();
            ResultSet rs=st.executeQuery("select id,amount from ngo");
            while(rs.next()){
                hm.put(rs.getString("id"),rs.getInt("amount"));
            }
    }
        catch(Exception e)
        {
            System.out.println("Exception in getHashMap method in split money "+e);
            hm.put("error", 100);
            
        }
       return hm;       
}
    public static int[] mapToArray(HashMap<String,Integer> hm)
    {
        System.out.println("in map to  array fn");
        int array[]=new int[hm.size()];
        int i=0;
           for(Map.Entry<String,Integer> e :hm.entrySet())
           {
               array[i]=e.getValue();
               System.out.println(array[i]);
               i++;
           }
           return array;
    }
    public static int getAmount(HashMap<String,Integer> hm,int amount){
        int sum=0;
        for(Map.Entry<String,Integer> e :hm.entrySet())
           {
               sum+=e.getValue();
           }
        return amount-sum;
    }
    public static float[] getAmount(String[] ngo){
            int size=ngo.length;
            String ng;
       float[] amt=new float[size];
       int i=0;
       for(int j=0;j<size;j++)
       {
            ng=ngo[j];
           try
        {
            
            Connection con=DbConnection.getConnection();
            Statement st=con.createStatement();
            Statement s=con.createStatement();
            ResultSet rs=st.executeQuery("select * from ngo where id='"+ng+"'");
            if(rs.next()){
                amt[i++]=rs.getFloat("amount");
            }
            
    }
         catch(Exception e){
             System.out.println("Exception "+e);
             
         }
       }
         return amt;
    }
}
