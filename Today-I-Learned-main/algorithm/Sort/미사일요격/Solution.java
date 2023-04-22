package 미사일요격;

import java.util.*;

class Solution {
    static ArrayList<Missile> list;
    public int solution(int[][] targets) {
        int answer = 0;
        list = new  ArrayList<Missile>();
        for(int[] arr : targets){
            Missile nm = new Missile(arr[0],arr[1]);
            list.add(nm);
            
        }
        
        Collections.sort(list, (a,b) -> {
            // if(a.start != b.start){
            //     return Integer.compare(a.start, b.start);
            // }else{
                return Integer.compare(a.end, b.end);
            // }
        });
        
        int count = 0;
        int last = 0;
        
        for(Missile mis : list){
          
            int nowStart = mis.start;
            int nowEnd = mis.end;
            if(nowStart < last){
                
            }else{
                count += 1;
                last = nowEnd;
            }
            
            
        }
        
        return count;
    }
}
class Missile{
    
    int start;
    int end;
    
    public Missile(int start, int end){
        this.start = start;
        this.end = end;
    }
}