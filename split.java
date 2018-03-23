package com.myapp.struts;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
public class split{
public static void main(String[] args) {
HashMap<String,Integer> hm=SplitMoney.getHashMap();
for(Map.Entry<String,Integer> e:hm.entrySet()){
                 System.out.println("Key :"+e.getKey()+" Value :"+e.getValue());
             }
int[] array=SplitMoney.mapToArray(hm);
KMeansClustering km=new KMeansClustering();
int cluster[]=km.getCluster(array);
int total=km.getCount();
int amt=4500;
//int total=km.getCount();
try{
	Connection con=DbConnection.getConnection();
            Statement st=con.createStatement();
            Statement s=con.createStatement();
            ResultSet rs;
            int l=cluster.length;
            System.out.println("Cluster length is "+l);
            HashMap<String,Integer> hmap=new HashMap<String,Integer>();
        while(amt>0){
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
                        amt-=(int)don;
                        System.out.println("amt is "+amt);
                        hmap.put(rs.getString("name"),(int)f-fun);
                        }
                    }
                    else 
                        flag++;
                }
		}

	for(Map.Entry<String,Integer> e:hmap.entrySet()){
                 System.out.println("Key :"+e.getKey()+" Value :"+e.getValue());
             }     

}
catch(Exception e){
System.out.println("Exception "+e);
}
}
}