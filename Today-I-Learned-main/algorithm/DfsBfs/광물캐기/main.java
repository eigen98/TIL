package 광물캐기;
import java.util.*;

public class main {
  static int[] pickArr;
  static int totalPick = 0;
  static String[] mineralArr;
  static int group = 0;
  static ArrayList<String> list;
  public int solution(int[] picks, String[] minerals) {
      pickArr = picks;
      totalPick = picks[0] + picks[1] + picks[2];
      mineralArr = minerals;
      list = new ArrayList<String>();
      if(minerals.length % 5 == 0){
          group = minerals.length / 5;
      }else{
          group = minerals.length / 5 + 1;
      }
      dfs(0,0,0,"");
     
      
      int minPain = Integer.MAX_VALUE;
      
      for(String str : list){
          String[] arr = str.split("");
          int pointer = 0;
          int nowPain = 0;
          for(String ch : arr){
              //ch = 곡괭이 1 2 3
              int count = 5;
              while(pointer < mineralArr.length && count > 0){
                  nowPain += drill(ch, mineralArr[pointer]);
                  pointer += 1;
                  count -= 1;
              }
              
          }
          minPain = Math.min(minPain, nowPain);
      }
      int answer = minPain;
      
      
      
      
      return answer;
  }
  //(1 , diamond)
  public static int drill(String tool, String mine ){
      if (tool.equals("1")){
          return 1;
      }else if (tool.equals("2")){
          if( mine.equals("diamond")){
              return 5;
          }else{
              return 1;
          }
      }else{
          if( mine.equals("diamond")){
              return 25;
          }else if( mine.equals("iron")){
              return 5;
          }else{
              return 1;
          }
      }
  }
  
  public static void dfs(int diaNum, int ironNum, int stoneNum,String str){
      
      int nowCount = diaNum + ironNum + stoneNum;
      
      if (nowCount == group || nowCount >= totalPick){
          list.add(str);
          return;
      }
      
      //다이아로 캐기
      if(pickArr[0] > diaNum){
          dfs(diaNum + 1,ironNum,stoneNum, str + "1" );
      }
      
       //철로 캐기
      if(pickArr[1] > ironNum){
          dfs(diaNum, ironNum + 1, stoneNum, str + "2");
      }
      
       //돌로 캐기
      if(pickArr[2] > stoneNum){
          dfs(diaNum, ironNum, stoneNum + 1, str + "3");
      }
      
      return ;
  }
}
