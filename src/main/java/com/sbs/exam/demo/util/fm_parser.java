package com.sbs.exam.demo.util;
import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
public class fm_parser {


    public static void main(final String[] args) throws IOException{
    	
    	java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
    	
		String db = "jdbc:mysql://122.38.239.60:3300/sb_c_2021_2nd_t";
		String user = "sb";
		String password = "1234";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
    	
        Document doc = Jsoup.connect("https://www.fmkorea.com/index.php?mid=best&page=1").get();//html 가져오기
    	//System.out.println(doc.toString()); //전체 html 출력

	    Elements els = doc.select(".title a"); // class dv_input인 a 태그 전부 찾음
	    	//Element els = doc.select(".dv_input a").get(0); //get(i)를통해 몇번째 요소 가져올수 있음
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("드라이버 로딩 성공");
		
		conn = DriverManager.getConnection(db, user, password);
		System.out.println("연결 성공\n*******************************************************************************");
		
	    for(Element e : els){
	        String URL = "https://www.fmkorea.com" + e.getElementsByAttribute("href").attr("href");
	        org.jsoup.Connection conn2 = Jsoup.connect(URL);
	        Document document = conn2.get();
	        
	    	//리스트에서 링크 파싱
	        System.out.println("https://www.fmkorea.com" + e.getElementsByAttribute("href").attr("href"));  //a 태그의 href 속성값 전부 print
	        
	        //해당 링크의 제목 파싱
			Element ele2 = document.select("span.np_18px_span").get(0);
			String title = ele2.html();	
			System.out.println(ele2.html());
	        
	        //파싱한 링크의 컨텐츠를 파싱
			Element ele3 = document.select("article").get(0);
			String contents = ele3.html();	
			System.out.println(ele3.html());
			
			//DB에 데이터를 넣음
			String sql = "INSERT INTO article (id, regDate, updateDate, memberId, boardId, title, body, hitCount, goodReactionPoint, badReactionPoint) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
            pstmt = conn.prepareStatement(sql);
            pstmt.setTimestamp(1, date);
            pstmt.setTimestamp(2, date);
            pstmt.setString(3, "1");
            pstmt.setString(4, "2");
            pstmt.setString(5, title);
            pstmt.setString(6, contents);
            pstmt.setString(7, "100");
            pstmt.setString(8, "100");
            pstmt.setString(9, "0");
            
            pstmt.executeUpdate();
            System.out.println(sql + "\n*******************************************************************************");
		    }
	    
		} catch (IndexOutOfBoundsException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
	    } catch(Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if(pstmt!=null) {pstmt.close();}            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        try {
	            if(conn!=null) {conn.close();}
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	    }
    }
}
