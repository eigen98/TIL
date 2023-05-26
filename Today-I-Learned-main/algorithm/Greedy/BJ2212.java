import java.util.*;

public class Main {
	static Scanner sc = new Scanner(System.in);
	static int N = 0;
	static int K = 0;
	static int[] posArr;
	static ArrayList<Integer> list = new ArrayList<>();
	public static void main(String[] args) {
		N = sc.nextInt();
		posArr = new int[N];
		K = sc.nextInt();
		
		if(K >= N){
			System.out.println(0);
			return;
		}
		for(int i = 0; i < N; i++){
			posArr[i] = sc.nextInt();
		}
		
		Arrays.sort(posArr);
		for(int i = 1; i < N; i++){
			int gap = posArr[i] - posArr[i - 1];
			list.add(gap);
		}
		Collections.sort(list);
		
		int answer = 0;
		
		for(int i = 0; i < list.size() - (K - 1); i++){
			answer += list.get(i);
		}
		System.out.println(answer);
	}
}

