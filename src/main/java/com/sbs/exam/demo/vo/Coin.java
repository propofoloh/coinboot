package com.sbs.exam.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coin {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String title;
	private String body;
	private int hitCount;
	private int goodReactionPoint;
	private int badReactionPoint;
	private Integer previousArticleId;
	private Integer nextArticleId;
	
	
	private String extra__writerName;
	private boolean extra__actorCanModify;
	private boolean extra__actorCanDelete;
	
	public String getForPrintType1RegDate() {
		return regDate;
	}
	
	public String getForPrintType1UpdateDate() {
		return updateDate;
	}
	
	public String getForPrintType2RegDate() {
		return regDate;
	}
	
	public String getForPrintType2UpdateDate() {
		return regDate;
	}
	
	public String getForPrintBody() {
		return body;
	}
}