package org.karsha.visualizer;

import java.util.ArrayList;

public class data_manipulation {
	
	public static int[] H_index(int Hdata[][]) {

		int hindex[] = new int[Hdata[0].length];
		for (int i = 0; i < Hdata[0].length; i++) {
			
			for (int j = Hdata.length; j >0; j--) {
				int count =0;
				for (int j2 = 0; j2 < Hdata.length; j2++) {
					if(Hdata[j2][i]>=j)count++;
				}
				if(count>=j){
					hindex[i] = j;
					break;
				}
			}
			
		}
		for (int i = 0; i < hindex.length; i++) {
			System.out.print(hindex[i]+" ");
		}
		
		return hindex;
	}
	
	public static int[][] hindex_preprocess(int x,int y,ArrayList<Integer> a) {
		
		int [][] h = new int[x][y];
		int count =0;
		for (int i = 0; i < x; i++) {
			for (int j = 0; j < y; j++) {
				h[i][j]=a.get(count);
				count++;
			}
		}
		return h; 
	}
}
