<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

              <div style="text-align:center; background-color: gray;">
              추천
                <span class="badge badge-primary">${article.goodReactionPoint}</span>
                <span>&nbsp;</span>

                <c:if test="${actorCanMakeReaction}">
                  <a
                    href="/usr/reactionPoint/doGoodReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
                    class="btn btn-xs btn-primary btn-outline"> 좋아요 👍 </a>
                  <span>&nbsp;</span>
                  <a
                    href="/usr/reactionPoint/doBadReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
                    class="btn btn-xs btn-secondary btn-outline"> 싫어요 👎 </a>
                </c:if>

                <c:if test="${actorCanCancelGoodReaction}">
                  <a
                    href="/usr/reactionPoint/doCancelGoodReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
                    class="btn btn-xs btn-primary"> 좋아요 👍 </a>
                  <span>&nbsp;</span>
                  <a onclick="alert(this.title); return false;" title="먼저 좋아요를 취소해주세요." href="#"
                    class="btn btn-xs btn-secondary btn-outline"> 싫어요 👎 </a>
                </c:if>

                <c:if test="${actorCanCancelBadReaction}">
                  <a onclick="alert(this.title); return false;" title="먼저 싫어요를 취소해주세요." href="#"
                    class="btn btn-xs btn-primary btn-outline"> 좋아요 👍 </a>
                  <span>&nbsp;</span>
                  <a
                    href="/usr/reactionPoint/doCancelBadReaction?relTypeCode=article&relId=${param.id}&replaceUri=${rq.encodedCurrentUri}"
                    class="btn btn-xs btn-secondary"> 싫어요 👎 </a>
                </c:if>
              </div>