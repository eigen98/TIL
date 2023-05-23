
/*
입력
첫 번째 줄에 추천 문제 리스트에 있는 문제의 개수 
N 가 주어진다.

두 번째 줄부터 
N + 1 줄까지 문제 번호 
P와 난이도 
L가 공백으로 구분되어 주어진다.
N + 2줄은 입력될 명령문의 개수 
M이 주어진다.

그 다음줄부터 
M개의 위에서 설명한 명령문이 입력된다.

출력
recommend 명령이 주어질 때마다 문제 번호를 한 줄씩 출력한다. 최소 한번의 recommend 명령어가 들어온다.
*/
import java.util.*;
class Prob{
	int num;
	int level;
	Prob(int num, int level){
		this.num = num;
		this.level = level;
	}
}
public class Main {
	static Scanner sc = new Scanner(System.in);
	static int N = 0;
	static int M = 0;
	static StringBuilder sb = new StringBuilder();
	//가장 쉬운 문제 Or 가장 작은 숫자.
	static PriorityQueue<Prob> minQ = new PriorityQueue<Prob>((o1, o2) -> {
		if(o1.level != o2.level){
			return Integer.compare(o1.level, o2.level);
		}else{
			return Integer.compare(o1.num, o2.num);
		}
	});
	
	//가장 어려운 문제
	static PriorityQueue<Prob> maxQ = new PriorityQueue<Prob>((o1, o2) -> {
		if(o1.level != o2.level){
			return Integer.compare(o2.level, o1.level);
		}else{
			return Integer.compare(o2.num, o1.num);
		}
	});
	
	static HashMap<Integer, Integer> map = new HashMap<>();
	
	
	public static void main(String[] args) {
		N = sc.nextInt();
		
		for(int i = 0; i < N ; i++){
			int num = sc.nextInt();//번호
			int level = sc.nextInt();//난이도
			
			Prob newPro = new Prob(num,level);
			minQ.add(newPro);
			maxQ.add(newPro);
			map.put(num, level);
		}
		
		M = sc.nextInt();
		sc.nextLine();
		
		for(int j = 0; j < M; j++){
			String input = sc.nextLine();
			String[] orderArr = input.split(" ");
			//추천
			if (orderArr[0].equals("recommend")){
				//가장 어려운 or 가장 큰 번호 추천
				if(orderArr[1].equals("1")){
					while(true){
						Prob topPro = maxQ.peek();
					
						if(map.getOrDefault(topPro.num, 0) != 0 && map.get(topPro.num) == topPro.level){
							
							System.out.println(topPro.num);
							break;
						}
					
						topPro = maxQ.poll();
					}
					
					
				
				}else{
				//가장 쉬운 or 가장 낮은 번호 추천
					while(true){
						Prob botPro = minQ.peek();
						if(map.getOrDefault(botPro.num, 0) != 0 && map.get(botPro.num) == botPro.level){
							System.out.println(botPro.num);
							break;
						}
						botPro = minQ.poll();
					}
				}
			}
			//추가 or 난이도 변경
			if (orderArr[0].equals("add")){
				int number = Integer.parseInt(orderArr[1]);  
				int level = Integer.parseInt(orderArr[2]);  
				Prob newPro = new Prob(number,level);
				
				minQ.add(newPro);
				maxQ.add(newPro);
				map.put(number, level);
			}
			
			//삭제
			if (orderArr[0].equals("solved")){
				int number = Integer.parseInt(orderArr[1]);  
				map.remove(number);
				
			}
			
			
			
			
		}
		
	}
}
