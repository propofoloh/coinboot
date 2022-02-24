package a;

import java.io.IOException;
import java.net.URL;
 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;


public class dd {
	
    public static void main(final String[] args) throws IOException{
        Document doc = Jsoup.connect("https://www.jjang0u.com/board/list/fun").get();//html 가져오기
    	//System.out.println(doc.toString()); //전체 html 출력

    Elements els = doc.select(".title a"); // class dv_input인 a 태그 전부 찾음
    	//Element els = doc.select(".dv_input a").get(0); //get(i)를통해 몇번째 요소 가져올수 있음

    for(Element e : els){ 
        System.out.println("https://www.jjang0u.com" + e.getElementsByAttribute("href").attr("href"));  //a 태그의 href 속성값 전부 print
        System.out.println(e.getElementsByAttribute("title").attr("title"));  //a 태그의 href 속성값 전부 print
        System.out.println(e.getElementsByAttribute("post_content").attr("post_content"));  //a 태그의 href 속성값 전부 print
    }
  }
}
