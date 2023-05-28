
import java.util.*;

public class Main {
	static Scanner sc = new Scanner(System.in);
	static ArrayList<Node> homeList = new ArrayList<>();
	static ArrayList<Node> chickList = new ArrayList<>();
	static int N = 0;
	static int M = 0;
	static boolean[] visitedChick;
	static int answer = Integer.MAX_VALUE;
	public static void main(String[] args) {
		N = sc.nextInt();
		M = sc.nextInt();
		
		for(int i = 0; i < N ; i++){
			for(int j = 0; j < N; j++){
				int num = sc.nextInt(); 
				if(num == 1){
					//집 
					homeList.add(new Node(i,j));
				}
				if(num == 2){
					//치킨집
					chickList.add(new Node(i,j));
				}
			}
		}
		visitedChick = new boolean[chickList.size()];
		
		rec_func(0,0);
		System.out.println(answer);
	}
	
	static void rec_func(int k, int idx){
		//k번째 집의 치킨집 찾기
		
		if(k == M){
			int total = 0;
			for(int i = 0; i < homeList.size() ; i++){
				int minimum = Integer.MAX_VALUE;
				for(int j = 0; j < visitedChick.length; j++){
					if(visitedChick[j]){
						int dist = Math.abs(homeList.get(i).x - chickList.get(j).x ) + Math.abs(homeList.get(i).y - chickList.get(j).y );
						minimum = Math.min(minimum, dist);
						
					}
				}
				total += minimum;
			}
			answer = Math.min(total,answer);
			return;
		}
		for(int cand = idx; cand < chickList.size(); cand++){
			if(!visitedChick[cand]){
				visitedChick[cand] = true;
				rec_func(k + 1, cand);
				visitedChick[cand] = false;
			}
			
		}
		
		
	}
}

class Node{
	int x;
	int y;
	Node(int x, int y){
		this.x = x;
		this.y = y;
	}
}
