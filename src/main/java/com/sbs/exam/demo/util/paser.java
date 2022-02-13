package com.sbs.exam.demo.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class paser {
	
	public static void main(String[] args) {

		String url = "jdbc:mysql://localhost:3306/sb_c_2021_2nd_t";
		String user = "sb";
		String password = "1234";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("드라이버 로딩 성공");
			
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("연결 성공");
			
			for(long i=1129717L; i<=1129717L; i ++) {
			String URL = "https://www.jjang0u.com/board/view/fun/15249406/1"  ;
			org.jsoup.Connection conn2 = Jsoup.connect(URL);
			
			System.out.println(URL); // URL 출력
			
			Document document = conn2.get();
			
			// System.out.println(document.text()); //페이지 전체 출
			
			
			//제목
			Element ele = document.select("h2#view_title").get(0);
			String title = ele.text();	
			System.out.println(ele.text());    
			
			//제목
			Element ele2 = document.select("section#post_content").get(0);
			String contents = ele2.html();	
			System.out.println(ele2.html());    

			String sql = "INSERT INTO TESTTABLE (BODY, CONTENTS) VALUES (?, ?)";
			
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, contents);
            
            pstmt.executeUpdate();
            System.out.println(sql);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
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