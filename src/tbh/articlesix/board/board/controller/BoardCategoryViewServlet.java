package tbh.articlesix.board.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tbh.articlesix.board.board.service.BoardService;
import tbh.articlesix.board.board.vo.Board;

/**
 * Servlet implementation class BoardCategoryViewServlet
 */
@WebServlet("/boardCategory")
public class BoardCategoryViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCategoryViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		final int PAGE_SIZE = 10; // 한 페이지 당 글수
		final int PAGE_BLOCK = 3; // 한 화면에 나타날 페이지 링크 수
		int bCount = 0; // 총 글수
		int pageCount = 0; // 총 페이지수
		int startPage = 1; // 화면에 나타날 시작페이지
		int endPage = 1; // 화면에 나타날 마지막페이지
		int currentPage = 1;
		int startRnum = 1; // 화면에 글
		int endRnum = 1; // 화면에 글
		int category = 0;
		String categoryNum = request.getParameter("categorynum");
		category = Integer.parseInt(categoryNum);
		
		String pageNum = request.getParameter("pagenum");
		if (pageNum != null) { // 눌려진 페이지가 있음.
			currentPage = Integer.parseInt(pageNum); // 눌려진 페이지
//					currentPage = Integer.valueOf( request.getParameter("page") );
		}
		// 총 글수
		bCount = new BoardService().getBoardCountC(category);
		// 총 페이지수 = (총글개수 / 페이지당글수) + (총글개수에서 페이지당글수로 나눈 나머지가 0이 아니라면 페이지개수를 1 증가)

		pageCount = (bCount / PAGE_SIZE) + (bCount % PAGE_SIZE == 0 ? 0 : 1);
		// rownum 조건 계산
		startRnum = (currentPage - 1) * PAGE_SIZE + 1;
		endRnum = startRnum + PAGE_SIZE - 1;
		if (endRnum > bCount)
			endRnum = bCount;

		if (currentPage % PAGE_BLOCK == 0) {
			startPage = (currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1;
		} else {
			startPage = (currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1;
		}
		endPage = startPage + PAGE_BLOCK - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		ArrayList<Board> volist = new BoardService().selectBoardListC(category, startRnum, endRnum);
		
		System.out.println(volist);
		request.setAttribute("boardvolist", volist);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("currentPage", currentPage);
		if (category == 2) {
			request.getRequestDispatcher("/WEB-INF/BoardHello.jsp").forward(request, response);
		} else if (category == 3) {
			request.getRequestDispatcher("/WEB-INF/BoardEvent.jsp").forward(request, response);
		} else if (category == 4) {
			request.getRequestDispatcher("/WEB-INF/BoardChat.jsp").forward(request, response);
		} else if (category == 5) {
			request.getRequestDispatcher("/WEB-INF/BoardTip.jsp").forward(request, response);
		} else if (category == 6) {
			request.getRequestDispatcher("/WEB-INF/BoardMeet.jsp").forward(request, response);
		} else {
			response.sendRedirect("boardlist");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
