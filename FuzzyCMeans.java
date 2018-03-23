public class FuzzyCMeans {

	public static void main(String[] args) {
	
	 final long startTime = System.nanoTime();
	int array[] = {1, 18, 20, 3, 7, 24, 4, 22, 23};
        int i, Centroid1, Centroid2, Temp1, Temp2, Count = 0,j=0,k=0;
        boolean flag=false;
        float Cluster1Sum, Cluster2Sum;
        Temp1 = array[0];
        Temp2 = array[1];
        Centroid1 = Temp1;
        Centroid2 = Temp2;
        int m=2;
        int cluster1[] = new int[array.length], cluster2[] = new int[array.length];
        float membership[][]=new float[array.length][2];
        float mem1,mem2;
        do {
        	
        	for(i=0;i<array.length;i++)
        	{
        		if(array[i]!=Centroid1 && array[i]!=Centroid2) {
        		mem1=getMembership(array[i],Centroid1,Centroid2,m);
        		mem2=getMembership(array[i],Centroid2,Centroid1,m);
        		membership[i][0]=mem1;
        		membership[i][1]=mem2;
        	}
        		else if(array[i]==Centroid1)
        		{
        			membership[i][0]=1;
            		membership[i][1]=0;
            	
        		}
        		else if(array[i]==Centroid2){
        			membership[i][0]=0;
            		membership[i][1]=1;
            	
        		}
        	}
        	Temp1=Centroid1;
        	Temp2=Centroid2;
        	Centroid1=getCentroid(array,membership,0);
        	Centroid2=getCentroid(array,membership,1);
        	flag=!(Centroid1 == Temp1 && Centroid2 == Temp2);
        }while(flag);
         j=0;k=0;
        for(i=0;i<array.length;i++) {
        	if(membership[i][0]>membership[i][1])
        		cluster1[j++]=array[i];
        	else
        		cluster2[k++]=array[i];        		
        }
        System.out.println("Cluster 1");
        for(i=0;i<j;i++)
        	System.out.print(cluster1[i]+"\t");
        System.out.println("\nCluster 2");
        for(i=0;i<k;i++)
        	System.out.print(cluster2[i]+"\t");
	
	final long duration = System.nanoTime() - startTime;
	System.out.println("Execution time of Fuzzy C MEans Algorithm is "+duration+" nanoseconds");
			
	}
	public static float getMembership(int ele,int c1,int c2,int m){
		float temp=0,sum=0;
		temp=getDistance(ele,c1)/getDistance(ele,c2);
		sum+=1+(temp*temp);
		float result=1/sum;
		
		return result;
	}
	public static int getDistance(int a,int b) {
		return Math.abs(a-b);
	}
	public static int getCentroid(int[] array,float mem[][],int m){
		float sum=0,den=0;
		for(int i=0;i<array.length;i++)
		{
			sum+=mem[i][m]*mem[i][m]*array[i];
			den+=mem[i][m]*mem[i][m];
			}
		float cent=sum/den;
		int res=(int)cent;
		//System.out.println("Centroid "+res);
		return res;
	}

}

