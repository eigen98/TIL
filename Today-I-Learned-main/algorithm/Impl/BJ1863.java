import java.util.*;

public class Main {
	static Scanner sc = new Scanner(System.in);
	static Stack<Integer> stack = new Stack();
	static int n = 0;
	static int answer = 0;
	public static void main(String[] args) {
		n = sc.nextInt();
		stack.add(0); //바닥
		for(int i = 0; i < n ; i++){
			int x = sc.nextInt();
			int y = sc.nextInt();
			
			
			while(!stack.isEmpty()){
				if(stack.peek() > y){
					int now = stack.pop();
					answer += 1;
				
				}else{
					break;
				}
			}
			if(y > stack.peek()){
				stack.add(y);
			}
		}
		while(!stack.isEmpty()){
			if(stack.peek() > 0){
				stack.pop();
				answer += 1;
			}else{
				break;
			}
		}
		
		System.out.println(answer);
		
	}
}
