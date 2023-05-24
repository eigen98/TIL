
// 예제 입력 1 
// 8 2
// 1 2 3 4 5 6 7 8
// 예제 출력 1 
// 3
import java.util.*;

public class Main {
	static int N = 0;
	static int K = 0;
	static ArrayList<Integer> arr = new ArrayList<>();
	static Scanner sc = new Scanner(System.in);
	public static void main(String[] args) {
		
		N = sc.nextInt(); //수열 길이
		K = sc.nextInt(); //삭제 횟수
		
		for(int i = 0; i < N; i++){
			int input = sc.nextInt();
			arr.add(input);
		}
		int max = 0;
		int count = 0;
		int R = 0;
		for(int L = 0; L < N; L++){
			while(R < N && K >= 0){
				if(arr.get(R) % 2 == 0){
					count += 1;
				}else{
					K -= 1;
				}
				R++;
			}
			max = Math.max(max, count);
			
			if(arr.get(L) % 2 == 0){
				count -= 1;
			}else{
				K += 1;
			}
			max = Math.max(max, count);
		}
		
		System.out.println(max);
		
	}
}
