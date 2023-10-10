package com.company.spring_annotation.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.instrument.classloading.jboss.JBossLoadTimeWeaver;

import com.company.spring_annotation.board.BoardDO;
import com.company.spring_annotation.common.JDBCUtil;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 게시글 목록 조회 메소드
	public List<BoardDO> getBoardList(String searchField, String searchText) {
		System.out.println("getBoardList() 메소드 처리");

		// 가변배열 생성
		List<BoardDO> boardList = new ArrayList<BoardDO>(); // 10개의 가변 배열 생성

		try {
			conn = JDBCUtil.getConnection();
			String where = "";
			if (searchField != null && searchText != null) { // 조건 검색 시
				where = " where " + searchField + " like '%" + searchText + "%'";
			}
			String BOARD_SELECT = "select * from board " + where + " order by seq desc";

			pstmt = conn.prepareStatement(BOARD_SELECT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDO board = new BoardDO();

				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));

				boardList.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}

		return boardList;
	}// end getBoardList()

	// 사용자가 특정'제목'을 클릭 시 해당 게시글 상세 검색
	public BoardDO getBoard(BoardDO boardDO) {
		System.out.println("===> getBoard() 처리");

		BoardDO board = null;
		try {
			conn = JDBCUtil.getConnection();

			String UPADTE_CNT = "update board set cnt=cnt+1 where seq=?";
			pstmt = conn.prepareStatement(UPADTE_CNT);
			pstmt.setInt(1, boardDO.getSeq());
			pstmt.executeUpdate();

			String BOARD_GET = "select * from board where seq=?";
			pstmt = conn.prepareStatement(BOARD_GET);
			pstmt.setInt(1, boardDO.getSeq());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardDO();
				board.setSeq(rs.getInt("SEQ"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriter(rs.getString("WRITER"));
				board.setContent(rs.getString("CONTENT"));
				board.setRegdate(rs.getDate("REGDATE"));
				board.setCnt(rs.getInt("CNT"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, pstmt, conn);
		}
		return board;
	}// end getBoard()

	public void updateBoard(BoardDO boardDO) {
		System.out.println("===> updateBoard() 처리");

		BoardDO board = null;
		try {
			conn = JDBCUtil.getConnection();

			String BOARD_UPDATE = "update board set title=?, content=? where seq=?";
			pstmt = conn.prepareStatement(BOARD_UPDATE);
			pstmt.setString(1, boardDO.getTitle());
			pstmt.setString(2, boardDO.getContent());
			pstmt.setInt(3, boardDO.getSeq());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}

	}// end updateBoard()

	// 게시글 삭제 메소드
	public void deleteBoard(BoardDO boardDO) {
		System.out.println("===> deleteBoard() 처리");

		BoardDO board = null;
		try {
			conn = JDBCUtil.getConnection();

			String BOARD_DELETE = "delete from board where seq=?";
			pstmt = conn.prepareStatement(BOARD_DELETE);
			pstmt.setInt(1, boardDO.getSeq());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}// end deleteBoard()

	public void insertBoard(BoardDO boardDO) {
		System.out.println("===> insertBoard() 처리");
		try {
			conn = JDBCUtil.getConnection();

			String BOARD_INSERT = "insert into board(seq, title, writer, content) values((select NVL(MAX(seq),0)+1 from board),?,?,?)";

			pstmt = conn.prepareStatement(BOARD_INSERT);
			pstmt.setString(1, boardDO.getTitle());
			pstmt.setString(2, boardDO.getWriter());
			pstmt.setString(3, boardDO.getContent());
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBoard" + e);
		} finally {
			JDBCUtil.close(pstmt, conn);
		}
	}// end insertBoard()
}