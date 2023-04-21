

import java.util.*;

class Solution {
    
    static int[][] visited;
    static ArrayList<String[]> list;
    static int[][] dir = {
        {1,0}, {-1,0}, {0,1}, {0,-1}
    };
    
    public int solution(String[] board) {
        int answer = 0;
        
        //map
        list = new ArrayList<String[]>();
        
        for(String str : board){
            String[] arr = str.split("");
            list.add(arr);
        }
       
        visited = new int[board.length][board[0].length()];
        int[] start = new int[2];
        int[] end = new int[2];
        
        //출발 도착 찾기
        for(int i = 0; i < board.length; i++){
            for(int j = 0; j < board[0].length(); j++){
                 
                if(list.get(i)[j].equals("R")){
                    
                    start = new int[] { i, j };
                  
                }
                if(list.get(i)[j].equals("G")){
                    end = new int[] { i , j };
                }
            }
        }
        
        bfs(start[0], start[1]);
        int ans = visited[end[0]][end[1]];
        System.out.println( Arrays.deepToString(visited));
        if(ans == 0){
            return -1;
        }
        System.out.println(ans);
        
    
        
        return ans;
    }
    
    static void bfs(int r, int c){
        Queue<int[]> queue = new LinkedList<int[]>();
        
        int[] newArr = {r, c};
        queue.add(newArr);
        int moveCount = 0;
        System.out.println(r + " " + c);
        while(!queue.isEmpty()){
            
            int[] now = queue.poll();
            
            int row = now[0];
            int col = now[1];
            
            moveCount = visited[row][col];
           
            
            for(int i = 0; i < 4 ; i++){
                int nr = row + dir[i][0];
                int nc = col + dir[i][1];
                //직진
                while(isPossibleRegion(nr,nc)){
                    nr += dir[i][0];
                    nc += dir[i][1];
                }
                
                nr -= dir[i][0];
                nc -= dir[i][1];
                
                //if(nr < 0 || nr >= visited.length || nc < 0 || nc >= visited[0].length){ continue; }
                if(visited[nr][nc] <= visited[row][col] && visited[nr][nc] != 0){continue;}
                //if(list.get(nr)[nc].equals("D")){continue;}
                //if(list.get(nr)[nc].equals("R")){continue;}
                
                
                visited[nr][nc] = moveCount + 1;
                int[] next = {nr, nc};
                queue.add(next);
            }

        }
        
    }
    //이동 가능한 곳인지 체크
    static boolean isPossibleRegion(int nr, int nc){
        if(nr < 0 || nr >= visited.length || nc < 0 || nc >= visited[0].length){ return false; }
        //if(visited[nr][nc] <= visited[row][col] && visited[nr][nc] != 0){ return false;}
        if(list.get(nr)[nc].equals("D")){return false;}
        //if(list.get(nr)[nc].equals("R")){return false;}
        return true;
    }
    
}