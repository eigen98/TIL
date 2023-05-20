import java.util.*;

public class Main {
	static Scanner sc = new Scanner(System.in);
	static int N;
	static ArrayList<int[]> list = new ArrayList<>();
	static boolean[] visited; //깨진 여부
	static int count = 0; //깰수 있는 최대 개수
	public static void main(String[] args) {
	
		N = sc.nextInt();
		for(int i = 0; i < N ; i++){
			int hp = sc.nextInt();
			int strong = sc.nextInt();
			
			list.add(new int[]{hp, strong});
		}
		
		visited = new boolean[N];
		
		rec_func(0, 0);
		
		System.out.println(count); //최대 개수 출력
		
		
	}
	//깨진 개수, 고른 계란
	static void rec_func(int k, int idx){
		//if (list.get(idx)[0] <= 0){return; }
		if(k >= N || idx >= N){
			//모든 계란 깨짐
		//	System.out.println("모든 계란 깨짐" + k + "");
			count = Math.max(count, k);
			return;
		}
		
		if(list.get(idx)[0] <= 0){
			rec_func(k, idx + 1);
			return;
		}
			
		int myHp = list.get(idx)[0];
		int myStrong = list.get(idx)[1];
		
		for(int temp = 0; temp < N ; temp++){
			
			if(temp == idx){
				continue;
			}
			
			if(list.get(temp)[0] <= 0){ 
				continue; 
			}
			
			
			
			
			int hp = list.get(temp)[0];
			int strong = list.get(temp)[1];
			
			int resultMyHp = myHp - myStrong;
			int resultHp = hp - strong;
			
			list.set(idx, new int[]{resultMyHp, myStrong});
			list.set(temp, new int[]{ resultHp, strong});
			
			int resultCount = 0;
			
			if(resultHp <= 0){ resultCount += 1; }
			if(resultMyHp <= 0){ resultCount += 1; }
			
			rec_func(k + resultCount, idx + 1);
			
			list.set(idx, new int[]{myHp, myStrong}); // 충돌 전 상태로 복원
        	list.set(temp, new int[]{hp, strong});
			
		}
	}
}
