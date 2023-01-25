package com.sbs.exam.demo.shorts.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sbs.exam.demo.repository.ArticleRepository;
import com.sbs.exam.demo.shorts.repository.ShortsRepository;
import com.sbs.exam.demo.util.Ut;
import com.sbs.exam.demo.shorts.vo.Shorts;
import com.sbs.exam.demo.vo.Article;
import com.sbs.exam.demo.vo.ResultData;

@Service

public class ShortsService {
	
	private ShortsRepository shortsRepository;

	public ShortsService(ShortsRepository shortsRepository) {
		this.shortsRepository = shortsRepository;
	}

	public ResultData<Integer> writeArticle(int memberId, int boardId, String title, String body) {
		shortsRepository.writeArticle(memberId, boardId, title, body);
		int id = shortsRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 게시물이 생성되었습니다.", id), "id", id);
	}

	public List<Shorts> getForPrintArticles(int actorId, int boardId, String searchKeywordTypeCode,
			String searchKeyword, int itemsCountInAPage, int page) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;

		List<Shorts> articles = shortsRepository.getForPrintArticles(boardId, searchKeywordTypeCode, searchKeyword,
				limitStart, limitTake);

		for (Shorts shorts : articles) {
			updateForPrintData(actorId, shorts);
		}

		return articles;
	}

	public Shorts getForPrintArticle(int actorId, int id) {
		Shorts shorts = shortsRepository.getForPrintArticle(id);

		updateForPrintData(actorId, shorts);

		return shorts;
	}

	private void updateForPrintData(int actorId, Shorts shorts) {
		if (shorts == null) {
			return;
		}

		ResultData actorCanDeleteRd = actorCanDelete(actorId, shorts);
		shorts.setExtra__actorCanDelete(actorCanDeleteRd.isSuccess());

		ResultData actorCanModifyRd = actorCanModify(actorId, shorts);
		shorts.setExtra__actorCanModify(actorCanModifyRd.isSuccess());
	}

	public void deleteArticle(int id) {
		shortsRepository.deleteArticle(id);
	}

	public ResultData<Shorts> modifyArticle(int id, String title, String body) {
		shortsRepository.modifyArticle(id, title, body);

		Shorts shorts = getForPrintArticle(0, id);

		return ResultData.from("S-1", Ut.f("%d번 게시물이 수정되었습니다.", id), "shorts", shorts);
	}

	public ResultData actorCanModify(int actorId, Shorts shorts) {
		if (shorts == null) {
			return ResultData.from("F-1", "게시물이 존재하지 않습니다.");
		}

		if (shorts.getMemberId() != actorId) {
			return ResultData.from("F-2", "권한이 없습니다.");
		}

		return ResultData.from("S-1", "게시물 수정이 가능합니다.");
	}

	public ResultData actorCanDelete(int actorId, Shorts shorts) {
		if (shorts == null) {
			return ResultData.from("F-1", "게시물이 존재하지 않습니다.");
		}

		if (shorts.getMemberId() != actorId) {
			return ResultData.from("F-2", "권한이 없습니다.");
		}

		return ResultData.from("S-1", "게시물 삭제가 가능합니다.");
	}

	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return shortsRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}

	public ResultData<Integer> increaseHitCount(int id) {
		int affectedRowsCount = shortsRepository.increaseHitCount(id);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "조회수가 증가되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public int getArticleHitCount(int id) {
		return shortsRepository.getArticleHitCount(id);
	}

	public ResultData increaseGoodReactionPoint(int relId) {
		int affectedRowsCount = shortsRepository.increaseGoodReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "좋아요 수가 증가되었습니다.", "affectedRowsCount", affectedRowsCount);
	}
	
	public ResultData increaseBadReactionPoint(int relId) {
		int affectedRowsCount = shortsRepository.increaseBadReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "싫어요 수가 증가되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public ResultData decreaseGoodReactionPoint(int relId) {
		int affectedRowsCount = shortsRepository.decreaseGoodReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "좋아요d 수가 감소되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public ResultData decreaseBadReactionPoint(int relId) {
		int affectedRowsCount = shortsRepository.decreaseBadReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "싫어요 수가 감소되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public Shorts getArticle(int id) {
		return shortsRepository.getArticle(id);
	}
	
	public Integer previousArticleId(Integer id) {
		try{
			
		} catch (NullPointerException e) {
			System.out.println("이전 게시물이 없어서 null");
		}
		return shortsRepository.previousArticleId(id);
	}

	public Integer nextArticleId(Integer id) {
		try{
			
		} catch (NullPointerException e) {
			System.out.println("다 게시물이 없어서 null");
		}
		return shortsRepository.nextArticleId(id);
	}
	
	public void blindMember(int memberId) {
		shortsRepository.blindMember(memberId);
	}
	
}

