package com.sbs.exam.demo.shorts.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.exam.demo.service.ArticleService;
import com.sbs.exam.demo.service.BoardService;
import com.sbs.exam.demo.service.ReactionPointService;
import com.sbs.exam.demo.service.ReplyService;
import com.sbs.exam.demo.shorts.service.ShortsService;
import com.sbs.exam.demo.shorts.vo.Shorts;
import com.sbs.exam.demo.util.Ut;
import com.sbs.exam.demo.vo.Article;
import com.sbs.exam.demo.vo.Board;
import com.sbs.exam.demo.vo.Reply;
import com.sbs.exam.demo.vo.ResultData;
import com.sbs.exam.demo.vo.Rq;

@Controller
@RequestMapping("/usr/shorts")
public class ShortsController {
	    
	private ShortsService shortsService;
	private BoardService boardService;
	private ReactionPointService reactionPointService;
	private ReplyService replyService;
	private Rq rq;

	public ShortsController(ShortsService shortsService, BoardService boardService,
			ReactionPointService reactionPointService, ReplyService replyService, Rq rq) {
		this.shortsService = shortsService;
		this.boardService = boardService;
		this.replyService = replyService;
		this.reactionPointService = reactionPointService;
		this.rq = rq;
	}

	@RequestMapping("/shortsList")
	public String showList(Model model, @RequestParam(defaultValue = "1") int boardId,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {
		Board board = boardService.getBoardById(boardId);

		if (board == null) {
			return rq.historyBackJsOnView(Ut.f("%d번 게시판은 존재하지 않습니다.", boardId));
		}

		int articlesCount = shortsService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) articlesCount / itemsCountInAPage);
		List<Shorts> articles = shortsService.getForPrintArticles(rq.getLoginedMemberId(), boardId,
				searchKeywordTypeCode, searchKeyword, itemsCountInAPage, page);

		model.addAttribute("boardId", boardId);
		model.addAttribute("page", page);
		model.addAttribute("board", board);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("articles", articles);

		return "usr/shorts/shortsList";
	}

	@RequestMapping("/shortsDetail")
	public String showDetail(Model model, int id,
			@RequestParam(defaultValue = "5") int boardId,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {
		Shorts shorts = shortsService.getForPrintArticle(rq.getLoginedMemberId(), id);

		model.addAttribute("shorts", shorts);

		List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMember(), "shorts", id);
		int repliesCount = replies.size();

		model.addAttribute("replies", replies);

		ResultData actorCanMakeReactionPointRd = reactionPointService.actorCanMakeReactionPoint(rq.getLoginedMemberId(),
				"article", id);

		model.addAttribute("actorCanMakeReaction", actorCanMakeReactionPointRd.isSuccess());
		
		int articlesCount = shortsService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
		
		int itemsCountInAPage = 10;
		int pagesCount = (int) Math.ceil((double) articlesCount / itemsCountInAPage);
		List<Shorts> articles = shortsService.getForPrintArticles(rq.getLoginedMemberId(), boardId,
				searchKeywordTypeCode, searchKeyword, itemsCountInAPage, page);
		
		Integer previousArticleId = shortsService.previousArticleId(id);
		Integer nextArticleId = shortsService.nextArticleId(id);

		model.addAttribute("page", page);
		model.addAttribute("pagesCount", pagesCount);
		model.addAttribute("articlesCount", articlesCount);
		model.addAttribute("articles", articles);
		model.addAttribute("previousArticleId", previousArticleId);
		model.addAttribute("nextArticleId", nextArticleId);
		
		
		if (actorCanMakeReactionPointRd.getResultCode().equals("F-2")) {
			int sumReactionPointByMemberId = (int) actorCanMakeReactionPointRd.getData1();

			if (sumReactionPointByMemberId > 0) {
				model.addAttribute("actorCanCancelGoodReaction", true);
			} else {
				model.addAttribute("actorCanCancelBadReaction", true);
			}
		}

		return "usr/shorts/shortsDetail";
	}

	@RequestMapping("/doIncreaseHitCountRd")
	@ResponseBody
	public ResultData<Integer> doIncreaseHitCountRd(int id) {
		ResultData<Integer> increaseHitCountRd = shortsService.increaseHitCount(id);

		if (increaseHitCountRd.isFail()) {
			return increaseHitCountRd;
		}

		ResultData<Integer> rd = ResultData.newData(increaseHitCountRd, "hitCount",
				shortsService.getArticleHitCount(id));

		rd.setData2("id", id);

		return rd;
	}

	@RequestMapping("/getArticle")
	@ResponseBody
	public ResultData<Shorts> getArticle(int id) {
		Shorts shorts = shortsService.getForPrintArticle(rq.getLoginedMemberId(), id);

		if (shorts == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id), "shorts", shorts);
	}

	@RequestMapping("/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		Shorts shorts = shortsService.getForPrintArticle(rq.getLoginedMemberId(), id);

		if (shorts == null) {
			rq.jsHistoryBack(Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		if (shorts.getMemberId() != rq.getLoginedMemberId()) {
			return rq.jsHistoryBack("권한이 없습니다.");
		}

		shortsService.deleteArticle(id);

		return rq.jsReplace(Ut.f("%d번 게시물을 삭제하였습니다.", id), "../shorts/list");
	}

	@RequestMapping("/modify")
	public String showModify(Model model, int id) {
		Shorts shorts = shortsService.getForPrintArticle(rq.getLoginedMemberId(), id);

		if (shorts == null) {
			return rq.historyBackJsOnView(Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		ResultData actorCanModifyRd = shortsService.actorCanModify(rq.getLoginedMemberId(), shorts);

		if (actorCanModifyRd.isFail()) {
			return rq.historyBackJsOnView(actorCanModifyRd.getMsg());
		}

		model.addAttribute("shorts", shorts);

		return "usr/shorts/modify";
	}

	@RequestMapping("/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {
		Shorts shorts = shortsService.getForPrintArticle(rq.getLoginedMemberId(), id);

		if (shorts == null) {
			return rq.jsHistoryBack(Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		ResultData actorCanModifyRd = shortsService.actorCanModify(rq.getLoginedMemberId(), shorts);

		if (actorCanModifyRd.isFail()) {
			return rq.jsHistoryBack(actorCanModifyRd.getMsg());
		}

		shortsService.modifyArticle(id, title, body);

		return rq.jsReplace(Ut.f("%d번 글이 수정되었습니다.", id), Ut.f("../shorts/detail?id=%d", id));
	}

	@RequestMapping("/write")
	public String showWrite(HttpServletRequest req, Model model) {
		return "usr/shorts/write";
	}

	@RequestMapping("/doWrite")
	@ResponseBody
	public String doWrite(int boardId, String title, String body, String replaceUri) {
		if (Ut.empty(title)) {
			return rq.jsHistoryBack("title(을)를 입력해주세요.");
		}

		if (Ut.empty(body)) {
			return rq.jsHistoryBack("body(을)를 입력해주세요.");
		}

		ResultData<Integer> writeArticleRd = shortsService.writeArticle(rq.getLoginedMemberId(), boardId, title, body);
		int id = writeArticleRd.getData1();

		if (Ut.empty(replaceUri)) {
			replaceUri = Ut.f("../shorts/shortsDetail?id=%d", id);
		}

		return rq.jsReplace(Ut.f("%d번 글이 생성되었습니다.", id), replaceUri);
	}
	
	@RequestMapping("/doMemberBlind")
	@ResponseBody
	public String doMemberBlind(int memberId) {
		Shorts shorts = shortsService.getForPrintArticle(rq.getLoginedMemberId(), memberId);

		if (shorts == null) {
			rq.jsHistoryBack(Ut.f("%d번 게시물이 존재하지 않습니다.", memberId));
		}

		if (shorts.getMemberId() != rq.getLoginedMemberId()) {
			return rq.jsHistoryBack("권한이 없습니다.");
		}

		shortsService.blindMember(memberId);

		return rq.jsReplace(Ut.f("작성자를 차단하였습니다.", memberId), "../shorts/shortsList");
	}

}
