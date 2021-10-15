<%@page import="tbh.articlesix.market.service.MarketService"%>
<%@page import="tbh.articlesix.market.vo.Market"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<Market> searchMkList = (ArrayList<Market>) request.getAttribute("searchMkList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/marketMain.css" />
</head>
<body>
	<%@ include file="./Header.jsp"%>

	<section class="body">
		<div class="searchBox">
			<form method="GET" action="searchMarket" id=frm1>
				<input type="text" id="search" name="searchTitle" placeholder="찾고 싶은 상품을 입력해주세요" />
				 <input type="submit" id="searchBtn" value="확인" />
			</form>
			<div>
				<a href="<%=request.getContextPath()%>/marketAdd"><button
						id="searchBtn">추가</button></a>
			</div>
		</div>
		<%
			if (searchMkList != null) {
				for (Market mk : searchMkList) {
		%>
		<div class="listBox">
			<ul class="listContent">
				<a href="marketDetail?no=<%=mk.getBmN()%>&title=<%=mk.getBmTitle()%>">
					<li><img src="<%=mk.getImgScr()%>" alt="img" />
						<div>
							<p><%=mk.getBmTitle()%></p>
							<p>가격</p>
						</div>
						<p><%=mk.getBmContent()%></p></li>
				</a>
			</ul>
		</div>
		<%
			}
			}
		%>
	</section>
	<%@ include file="./Footer.jsp"%>


	<script src="js/marketMain.js"></script>
	<script src="js/header.js"></script>
</body>
</html>