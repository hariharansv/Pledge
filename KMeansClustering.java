package com.myapp.struts;
import java.util.HashMap;
public class KMeansClustering {
 public static int count=0;
	public static int[] getCluster(int[] array) {
      //    int array[] = {100, 950, 2000, 3, 21000, 2400, 400, 2200, 230};
            int point=Hash.getFlag();
        	int i, Centroid1, Centroid2, Temp1, Temp2, Count = 0;
        	boolean flag;
        	float Cluster1Sum, Cluster2Sum;
        	Temp1 = array[0];
        	Temp2 = array[1];
        	Centroid1 = Temp1;
        	Centroid2 = Temp2;
        	int cluster1[] = new int[array.length], cluster2[] = new int[array.length];
        do {
            Cluster1Sum = 0;
            Cluster2Sum = 0;
            cluster1 = new int[array.length];
            cluster2 = new int[array.length];
            Count++;
            int k = 0, j = 0;
            for (i = 0; i < array.length; i++) {
                if (Math.abs(array[i] - Centroid1) <= Math.abs(array[i] - 				Centroid2)) {
                    cluster1[k] = array[i];
                    k++;
                } else {
                    cluster2[j] = array[i];
                    j++;
                }
            }
            System.out.println();
            for (i = 0; i < k; i++) {
                Cluster1Sum = Cluster1Sum + cluster1[i];
            }
            for (i = 0; i < j; i++) {
                Cluster2Sum = Cluster2Sum + cluster2[i];
            }

            System.out.println("m1=" + Centroid1 + "   m2=" + Centroid2);
            Temp1 = Centroid1;
            Temp2 = Centroid2;
            Centroid1 = Math.round(Cluster1Sum / k);
            Centroid2 = Math.round(Cluster2Sum / j);
            flag = !(Centroid1 == Temp1 && Centroid2 == Temp2);

            System.out.println("After iteration " + Count + " , cluster 1 :\n");
            for (i = 0; i < cluster1.length; i++) {
                System.out.print(cluster1[i] + "\t");
            }

            System.out.println("\n");
            System.out.println("After iteration " + Count + " , cluster 2 :\n");
            for (i = 0; i < cluster2.length; i++) {
                System.out.print(cluster2[i] + "\t");
            }

	        } while (flag);

	      /*  System.out.println("\nFinal cluster 1 :\n");
	        for (i = 0; i < cluster1.length; i++) {
	            if(cluster1[i] != 0)
		            System.out.print(cluster1[i] + "\t");
		        }
        	System.out.println();
        	System.out.println("Final cluster 2 :\n");
        	for (i = 0; i < cluster2.length; i++) {
            if(cluster2[i] != 0)
            System.out.print(cluster2[i] + "\t");
              */
        	if((point)==0)
        	{
            calcCount(cluster1,cluster1.length);
            Hash.updateFlag();
            return (cluster1);
            
        	}
        	else{
            calcCount(cluster2,cluster2.length);
            Hash.updateFlag();
            return (cluster2);
        	}
        	}
    		/*    public static int[] getClust(int[]  a){
            int l=a.length;
            int i,j=0;
            int[] b=new int[l];
            for(i=0;i<l;i++){
                if(a[i]!=0){
                    b[j]=a[i];
                    j++;
                }
            }
                return b;
    		    }
    	    */
        public static void calcCount(int[] a,int l )
        {
            int i=0;
            count=0;
            for(i=0;i<l;i++)
            {
                count+=a[i];
            }
        }
        public static int getCount(){
            return count;
        }
}

