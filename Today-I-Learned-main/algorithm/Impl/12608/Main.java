import java.util.*;
//예제 입력 1 
// 3
// 4 2 5 1 7
// 3 1 9 4 5
// 9 8 1 2 3
// 8 1 9 3 4
// 7 2 3 4 8
// 1 9 2 5 7
// 6 5 2 3 4
// 5 1 9 2 8
// 2 9 3 1 4
// 입력
// 첫째 줄에 N이 주어진다. 
// 둘째 줄부터 N2개의 줄에 학생의 번호와 
// 그 학생이 좋아하는 학생 4명의 번호가 한 줄에 하나씩 선생님이 자리를 정할 순서대로 주어진다.

// 학생의 번호는 중복되지 않으며, 어떤 학생이 좋아하는 학생 4명은 모두 다른 학생으로 이루어져 있다.
// 입력으로 주어지는 학생의 번호, 좋아하는 학생의 번호는 N2보다 작거나 같은 자연수이다. 어떤 학생이 자기 자신을 좋아하는 경우는 없다.
public class Main {
    static int N = 0;
    static int[][] favoriteArr;
    static int[][] pointArr;
    static int[][] positionArr;
    static ArrayList<Integer>[] favoriteList; 
    static int[][] dir = { {1,0}, {-1, 0}, {0, 1}, {0, -1} };
    static Scanner sc = new Scanner(System.in);
    
    
    public static void main(String args[]) {
        input();
        
        for(int num = 0; num < N*N ; num++){
            int studentNum = favoriteArr[num][0];
            choose(studentNum);
        }
        
        int ans = calcPoint();
        System.out.println(ans);
    }
    
    static int calcPoint(){
        int resultPoint = 0;
        
        for(int i = 0; i < N; i++){
            for(int j = 0; j < N; j++){
                int row = i;
                int col = j;
                int me = positionArr[row][col];
                int count = 0;
                
                for(int d = 0 ; d < 4; d++ ){
                    int nr = row + dir[d][0];
                    int nc = col + dir[d][1];
                    if(nr < 0 || nr >= N || nc < 0 || nc >= N){ continue; }
                    int people = positionArr[nr][nc];
                    boolean isFavorite = favoriteList[me - 1].contains(people);
                    if(isFavorite){ count += 1; }
                }
                if(count == 1){resultPoint += 1; 
                }
                if(count == 2){resultPoint += 10; }
                if(count == 3){resultPoint += 100; }
                if(count == 4){resultPoint += 1000; }
                
            }
        }
        return resultPoint;
    }
    
    //학생 앉히기
    static void choose(int student){
        ArrayList<Result> list = new ArrayList<Result>();
        
        for(int i = 0; i < N; i++){
            for(int j = 0; j < N; j++){
                if(positionArr[i][j] != 0){continue;} //빈자리가 아니라면 패스
                Result result = check(i,j, student);
                list.add(result);
            }
        }
        
        Collections.sort(list, (a, b) -> {
           if (a.favoriteCount != b.favoriteCount){
               return Integer.compare(b.favoriteCount , a.favoriteCount); //좋아하는 사람이 많을수록 -> 내림차
           }else if(a.emtpyCount != b.emtpyCount){
               return Integer.compare(b.emtpyCount, a.emtpyCount); // 빈자리가 많을 수록 -> 내림차.
           }else if(a.row != b.row){
               return Integer.compare(a.row, b.row); //오름차.
           }else{
               return Integer.compare(a.col, b.col);
           }
        });
        
        int resultRow = list.get(0).row;
        int resultCol = list.get(0).col;
        
        positionArr[resultRow][resultCol] = student;
        
        // System.out.println("row :" + resultRow + " col : " + resultCol + ", value : " + student);
    }
    
    //
    
    //해당 자리 값 매기기
    static Result check(int row, int col, int student){
        //if(positionArr[nr][nc] == 0){ return }
        int likeCount = 0; //좋아하는 사람 수
        int blankCount = 0;//빈자리 수
        
        for(int i = 0; i< 4; i++){
            int nr = row + dir[i][0];
            int nc = col + dir[i][1];
            if(nr < 0 || nr >= N || nc < 0 || nc >= N){ continue; }
            //if(positionArr[nr][nc] != 0){ continue; }
            int people = positionArr[nr][nc];
            
            if(people != 0){
                //사람이 있다면
                boolean isContain = favoriteList[student - 1].contains(people);
                if(isContain){
                    likeCount += 1;
                }
            }else{
                //빈자리라면
                blankCount += 1;
            }
        }
        
        Result rs = new Result(likeCount, blankCount, row, col);
        return rs;
    }
    
    static void input(){
        N = sc.nextInt();
        favoriteList = new ArrayList[N*N];
        favoriteArr = new int[N * N][5];
        pointArr = new int[N][N];
        positionArr = new int[N][N];
        
        for(int i = 0; i < N*N ; i++){
            favoriteList[i] = new ArrayList<Integer>();
        }
        int student = 0;
        for(int i = 0; i < N * N; i++){
            
            for(int j = 0; j < 5; j++){
                favoriteArr[i][j] = sc.nextInt();
                if(j == 0){ student = favoriteArr[i][j];}
                else{ favoriteList[student - 1].add( favoriteArr[i][j] ); }
            }
        }
        
    }
    
}
    class Result{
        int favoriteCount;
        int emtpyCount; 
        int row;
        int col;
    
        public Result(int favoriteCount, int emtpyCount, int row , int col){
            this.favoriteCount = favoriteCount;
            this.emtpyCount = emtpyCount;
            this.row = row;
            this.col = col;
        }
    }
