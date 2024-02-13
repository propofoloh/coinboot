package com.sbs.exam.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sbs.exam.demo.repository.ArticleRepository;
import com.sbs.exam.demo.repository.CoinRepository;
import com.sbs.exam.demo.util.Ut;
import com.sbs.exam.demo.vo.Coin;
import com.sbs.exam.demo.vo.Article;
import com.sbs.exam.demo.vo.ResultData;

@Service

public class CoinService {
	
	private CoinRepository coinRepository;

	public CoinService(CoinRepository coinRepository) {
		this.coinRepository = coinRepository;
	}

	public ResultData<Integer> writeArticle(int memberId, int boardId, String title, String body) {
		coinRepository.writeArticle(memberId, boardId, title, body);
		int id = coinRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 게시물이 생성되었습니다.", id), "id", id);
	}

	public List<Coin> getForPrintArticles(int actorId, int boardId, String searchKeywordTypeCode,
			String searchKeyword, int itemsCountInAPage, int page) {
		int limitStart = (page - 1) * itemsCountInAPage;
		int limitTake = itemsCountInAPage;

		List<Coin> articles = coinRepository.getForPrintArticles(boardId, searchKeywordTypeCode, searchKeyword,
				limitStart, limitTake);

		for (Coin coin : articles) {
			updateForPrintData(actorId, coin);
		}

		return articles;
	}

	public Coin getForPrintArticle(int actorId, int id) {
		Coin coin = coinRepository.getForPrintArticle(id);

		updateForPrintData(actorId, coin);

		return coin;
	}

	private void updateForPrintData(int actorId, Coin coin) {
		if (coin == null) {
			return;
		}

		ResultData actorCanDeleteRd = actorCanDelete(actorId, coin);
		coin.setExtra__actorCanDelete(actorCanDeleteRd.isSuccess());

		ResultData actorCanModifyRd = actorCanModify(actorId, coin);
		coin.setExtra__actorCanModify(actorCanModifyRd.isSuccess());
	}

	public void deleteArticle(int id) {
		coinRepository.deleteArticle(id);
	}

	public ResultData<Coin> modifyArticle(int id, String title, String body) {
		coinRepository.modifyArticle(id, title, body);

		Coin coin = getForPrintArticle(0, id);

		return ResultData.from("S-1", Ut.f("%d번 게시물이 수정되었습니다.", id), "coin", coin);
	}

	public ResultData actorCanModify(int actorId, Coin coin) {
		if (coin == null) {
			return ResultData.from("F-1", "게시물이 존재하지 않습니다.");
		}

		if (coin.getMemberId() != actorId) {
			return ResultData.from("F-2", "권한이 없습니다.");
		}

		return ResultData.from("S-1", "게시물 수정이 가능합니다.");
	}

	public ResultData actorCanDelete(int actorId, Coin coin) {
		if (coin == null) {
			return ResultData.from("F-1", "게시물이 존재하지 않습니다.");
		}

		if (coin.getMemberId() != actorId) {
			return ResultData.from("F-2", "권한이 없습니다.");
		}

		return ResultData.from("S-1", "게시물 삭제가 가능합니다.");
	}

	public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
		return coinRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
	}

	public ResultData<Integer> increaseHitCount(int id) {
		int affectedRowsCount = coinRepository.increaseHitCount(id);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "조회수가 증가되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public int getArticleHitCount(int id) {
		return coinRepository.getArticleHitCount(id);
	}

	public ResultData increaseGoodReactionPoint(int relId) {
		int affectedRowsCount = coinRepository.increaseGoodReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "좋아요 수가 증가되었습니다.", "affectedRowsCount", affectedRowsCount);
	}
	
	public ResultData increaseBadReactionPoint(int relId) {
		int affectedRowsCount = coinRepository.increaseBadReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "싫어요 수가 증가되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public ResultData decreaseGoodReactionPoint(int relId) {
		int affectedRowsCount = coinRepository.decreaseGoodReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "좋아요d 수가 감소되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public ResultData decreaseBadReactionPoint(int relId) {
		int affectedRowsCount = coinRepository.decreaseBadReactionPoint(relId);

		if (affectedRowsCount == 0) {
			return ResultData.from("F-1", "해당 게시물이 존재하지 않습니다.", "affectedRowsCount", affectedRowsCount);
		}

		return ResultData.from("S-1", "싫어요 수가 감소되었습니다.", "affectedRowsCount", affectedRowsCount);
	}

	public Coin getArticle(int id) {
		return coinRepository.getArticle(id);
	}
	
	public Integer previousArticleId(Integer id) {
		try{
			
		} catch (NullPointerException e) {
			System.out.println("이전 게시물이 없어서 null");
		}
		return coinRepository.previousArticleId(id);
	}

	public Integer nextArticleId(Integer id) {
		try{
			
		} catch (NullPointerException e) {
			System.out.println("다 게시물이 없어서 null");
		}
		return coinRepository.nextArticleId(id);
	}
	
	public void blindMember(int memberId) {
		coinRepository.blindMember(memberId);
	}
	
}

