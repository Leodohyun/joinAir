package com.company.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

import com.company.spring_annotation.board.BoardDO;
import com.company.spring_annotation.board.BoardDAO;

/*
 * [중요] board 테이블의 CRUD 컨트롤러 클래스 5개를 하나로 통합한 클래스
 */

@Controller
public class BoardController {	//POJO 클래스로 구현하자!!
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardDO boardDO, BoardDAO boardDAO, 
							   Model model, String searchCondition, String searchKeyword) {
		
		System.out.println("searchCondition: " + searchCondition);  
		System.out.println("searchKeyword: " + searchKeyword);
		model.addAttribute("boardList", boardDAO.getBoardList(searchCondition, searchKeyword));
		return "getBoardList.jsp";
		
	}
	//해당 게시글 상세 검색
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardDO boardDO, BoardDAO boardDAO, Model model) {
		
		model.addAttribute("board", boardDAO.getBoard(boardDO));
		return "getBoard.jsp";
	}
	
	//게시글 수정
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.updateBoard(boardDO);
		return "getBoardList.do";
	}
	//게시글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardDO boardDO, BoardDAO boardDAO) {
		boardDAO.deleteBoard(boardDO);
		return "getBoardList.do";
	}
	//게시글 등록
		@RequestMapping("/insertBoard.do")
		public String insertBoard(BoardDO boardDO, BoardDAO boardDAO) {
			boardDAO.insertBoard(boardDO);
			return "getBoardList.do";
		}
}
