<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<c:set var="path" value="${pageContext.request.contextPath}" />
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>자유게시판</title>
				<style>
					/* 전체 페이지에 대한 기본적인 세팅 */
					body {
						padding: 0px;
						margin: 0px;
						min-width: 1200px;
						font-family: 'Yoon 윤고딕', '돋움', dotum, sans-serif;
					}

					a {
						color: black;
						text-decoration: none;
					}

					ul,
					li {
						padding: 0px;
						margin: 0px;
					}
					
					table {
						border-collapse: collapse;
						border-spacing: 0
					}
					
					th,
					td {
						border: 1px solid black;
					}
					
					th {
						font-size: 20px;
					}

					/* 페이지의 header와 관련된 디자인 부분 */
					#header {
						background-color: #3d537d;
						position: fixed;
						top: 0px;
						min-width: 828px;
						width: 100%;
						height: 81px;
						border-bottom: 1px solid black;
						z-index: 2;
					}

					#nav_items_wrapper {
						float: right;
					}

					#header_nav {
						list-style: none;
						margin: 0px 10%;
					}

					.nav_items {
						position: relative;
						line-height: 80px;
						min-width: 80px;
						box-sizing: border-box;
						display: inline-block;
						margin: 0 10px;
						text-align: center;
						transition: border-color .5s;
						padding: 0 10px;
					}
					
					.nav_items>a {
						color: white;
					}

					#nav_logo {
						font-size: 28px;
						height: 80px;
						display: inline-block;
						float: left;
						width: 116px;
						line-height: 80px;
						position: relative;
					}
					
					#nav_logo>a {
						color: white;
					}

					#nav_button {
						line-height: 80px;
						border: none !important;
					}

					#nav_button>a {
						color: black;
						padding: 0 20px;
						background: #fede22;
						border: 1px solid #fede22;
						display: inline-block;
						line-height: 44px;
						font-size: 14px;
						border-radius: 22px;
						vertical-align: middle;
					}

					.nav_links {
						list-style: none;
					}

					.nav_subs {
						display: none;
						width: 100%;
						position: absolute;
						left: 0;
						right: 0;
						top: 81px;
						bottom: 100%;
						background-color: #fff;
						z-index: 2;
					}

					.nav_items:hover {
						border-bottom: 2px solid black;
						text-decoration: underline;
					}

					#nav_sub1 {
						display: none;
						background-color: white;
						height: 300px;
						grid-template-rows: 1fr;
						grid-template-columns: 1fr 1fr 1fr 1fr;
						grid-template-areas: "nav_sub1_item1 nav_sub1_item2 nav_sub1_item3 nav_sub1_item4";
						text-align: center;
						padding: 50px 0px;
					}

					#nav_sub2 {
						display: none;
						background-color: white;
						height: 300px;
						grid-template-rows: 1fr;
						grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
						grid-template-areas: "nav_sub2_item1 nav_sub2_item2 nav_sub2_item3 nav_sub2_item4 nav_sub2_item5";
						text-align: center;
						padding: 50px 0px;
					}

					#nav_sub3 {
						display: none;
						background-color: white;
						height: 400px;
						grid-template-rows: 1fr;
						grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
						grid-template-areas: "nav_sub3_item1 nav_sub3_item2 nav_sub3_item3 nav_sub3_item4 nav_sub3_item5";
						text-align: center;
						padding: 50px 0px;
					}

					#nav_sub4 {
						display: none;
						background-color: white;
						height: 450px;
						grid-template-rows: 1fr;
						grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
						grid-template-areas: "nav_sub4_item1 nav_sub4_item2 nav_sub4_item3 nav_sub4_item4 nav_sub4_item5";
						text-align: center;
						padding: 50px 0px;
					}

					#nav_sub1:hover {
						display: grid;
					}

					#nav_sub2:hover {
						display: grid;
					}

					#nav_sub3:hover {
						display: grid;
					}

					#nav_sub4:hover {
						display: grid;
					}

					.nav_sub_header {
						font-size: 20px;
						line-height: 50px;
					}

					.nav_link>a {
						color: gray;
						margin: 10px 0px;
						line-height: 50px;
					}

					.nav_sub_header:hover,
					.nav_link>a:hover {
						text-decoration: underline;
					}

					#nav_sub1_item1 {
						grid-area: nav_sub1_item1;
					}

					#nav_sub1_item2 {
						grid-area: nav_sub1_item2;
					}

					#nav_sub1_item3 {
						grid-area: nav_sub1_item3;
					}

					#nav_sub1_item4 {
						grid-area: nav_sub1_item4;
					}

					#nav_sub2_item1 {
						grid-area: nav_sub2_item1;
					}

					#nav_sub2_item2 {
						grid-area: nav_sub2_item2;
					}

					#nav_sub2_item3 {
						grid-area: nav_sub2_item3;
					}

					#nav_sub2_item4 {
						grid-area: nav_sub2_item4;
					}

					#nav_sub2_item5 {
						grid-area: nav_sub2_item4;
					}

					#nav_sub3_item1 {
						grid-area: nav_sub3_item1;
					}

					#nav_sub3_item2 {
						grid-area: nav_sub3_item2;
					}

					#nav_sub3_item3 {
						grid-area: nav_sub3_item3;
					}

					#nav_sub3_item4 {
						grid-area: nav_sub3_item4;
					}

					#nav_sub3_item5 {
						grid-area: nav_sub3_item5;
					}

					#nav_sub4_item1 {
						grid-area: nav_sub4_item1;
					}

					#nav_sub4_item2 {
						grid-area: nav_sub4_item2;
					}

					#nav_sub4_item3 {
						grid-area: nav_sub4_item3;
					}

					#nav_sub4_item4 {
						grid-area: nav_sub4_item4;
					}

					#nav_sub4_item5 {
						grid-area: nav_sub4_item5;
					}

					#nav_item1:hover~#nav_sub1 {
						display: grid;
					}

					#nav_item2:hover~#nav_sub2 {
						display: grid;
					}

					#nav_item3:hover~#nav_sub3 {
						display: grid;
					}

					#nav_item4:hover~#nav_sub4 {
						display: grid;
					}

					#section1 {
						position: relative;
						width: 100%;
						clear: both;
						background-color: #3d537d;
						padding-top: 200px;
					}
					
					#section1_text_content {
						color: white;
						text-align: center;
					}
					#section1_image {
						margin-top: 100px;
						text-align: center;
					}
					#request_list {
						padding: 200px 0px;
						text-align: center;
					}
					#request_button {
						line-height: 80px;
						border: none !important;
					}

					#request_button>a {
						color: black;
						padding: 0 20px;
						background: #fede22;
						border: 1px solid #fede22;
						display: inline-block;
						line-height: 44px;
						font-size: 14px;
						border-radius: 22px;
						vertical-align: middle;
					}
					#list {
						margin-left: auto;
						margin-right: auto;
					}
				</style>
				<script>
					function delete_ok(seq) {
						var a = confirm("정말로 삭제하겠습니까?");
						if (a) location.href = 'deleteok/' + seq;
					}
				</script>
			</head>

			<body>
				<div id="header">
					<div id="header_content_wrapper">
						<ul id="header_nav">
							<li id="nav_logo"><a href="/kakaoBank/">kakao<b>bank</b></a></li>
							<div id="nav_items_wrapper">
								<!-- 첫번째 항목 -->
								<li class="nav_items" id="nav_item1">
									<a href="#">은행소개</a>
								</li>
								<div class="nav_subs" id="nav_sub1">
									<div class="nav_sub_item" id="nav_sub1_item1">
										<a class="nav_sub_header" href="#">카카오뱅크</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">브랜드</a></li>
											<li class="nav_link"><a href="#">주주사 소개</a></li>
											<li class="nav_link"><a href="#">오시는 길</a></li>
											<li class="nav_link"><a href="#">제휴문의</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub1_item2">
										<a class="nav_sub_header" href="#">윤리경영</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">윤리강령</a></li>
											<li class="nav_link"><a href="#">임직원행동기준</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub1_item3">
										<a class="nav_sub_header" href="#">인재채용 ></a>
									</div>
									<div class="nav_sub_item" id="nav_sub1_item4">
										<a class="nav_sub_header" href="#">새소식</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">공지사항</a></li>
											<li class="nav_link"><a href="#">보도자료</a></li>
										</ul>
									</div>
								</div>
								<!-- 두번째 항목 -->
								<li class="nav_items" id="nav_item2">
									<a href="#">IR투자정보</a>
								</li>
								<div class="nav_subs" id="nav_sub2">
									<div class="nav_sub_item" id="nav_sub_item1">
										<a class="nav_sub_header" href="#">공시정보</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">경영공시</a></li>
											<li class="nav_link"><a href="#">바젤공시</a></li>
											<li class="nav_link"><a href="#">기타공시</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub_item2">
										<a class="nav_sub_header" href="#">재무정보</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">재무제표</a></li>
											<li class="nav_link"><a href="#">감사보고서</a></li>
											<li class="nav_link"><a href="#">영업보고서</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub_item3">
										<a class="nav_sub_header" href="#">IR자료실</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">실적발표</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub_item4">
										<a class="nav_sub_header" href="#">IR일정</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">IR행사</a></li>
											<li class="nav_link"><a href="#">IR미팅예약</a></li>
											<li class="nav_link"><a href="#">주주총회</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub_item5">
										<a class="nav_sub_header" href="#">공고</a>
									</div>
								</div>
								<!-- 세번째 항목 -->
								<li class="nav_items" id="nav_item3">
									<a href="#">상품안내</a>
								</li>
								<div class="nav_subs" id="nav_sub3">
									<div class="nav_sub_item" id="nav_sub3_item1">
										<a class="nav_sub_header" href="#">예적금</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">입출금통장</a></li>
											<li class="nav_link"><a href="#">모임통장</a></li>
											<li class="nav_link"><a href="#">세이프박스</a></li>
											<li class="nav_link"><a href="#">저금통</a></li>
											<li class="nav_link"><a href="#">정기예금</a></li>
											<li class="nav_link"><a href="#">자유적금</a></li>
											<li class="nav_link"><a href="#">26주적금</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub3_item2">
										<a class="nav_sub_header" href="#">대출</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">비상금대출</a></li>
											<li class="nav_link"><a href="#">마이너스 통장대출</a></li>
											<li class="nav_link"><a href="#">신용대출</a></li>
											<li class="nav_link"><a href="#">개인사업자 대출</a></li>
											<li class="nav_link"><a href="#">전월세보증금 대출</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub3_item3">
										<a class="nav_sub_header" href="#">서비스</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">내 신용정보</a></li>
											<li class="nav_link"><a href="#">해외송금 보내기</a></li>
											<li class="nav_link"><a href="#">해외송금 받기</a></li>
											<li class="nav_link"><a href="#">프렌즈 체크카드</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub3_item4">
										<a class="nav_sub_header" href="#">제휴서비스</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">증권사 주식계좌</a></li>
											<li class="nav_link"><a href="#">제휴신용카드</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub3_item5">
										<a class="nav_sub_header" href="#">mini</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">카카오뱅크 mini</a></li>
											<li class="nav_link"><a href="#">mini카드</a></li>
										</ul>
									</div>
								</div>
								<!-- 네번째 항목 -->
								<li class="nav_items" id="nav_item4">
									<a href="#">고객센터</a>
								</li>
								<div class="nav_subs" id="nav_sub4">
									<div class="nav_sub_item" id="nav_sub4_item1">
										<a class="nav_sub_header" href="#">이용안내</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">자주 묻는 질문</a></li>
											<li class="nav_link"><a href="#">이용시간 안내</a></li>
											<li class="nav_link"><a href="#">세이프박스</a></li>
											<li class="nav_link"><a href="#">ATM 이용안내</a></li>
											<li class="nav_link"><a href="#">금리안내</a></li>
											<li class="nav_link"><a href="#">수수료안내</a></li>
											<li class="nav_link"><a href="#">상담안내</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub4_item2">
										<a class="nav_sub_header" href="#">상담하기</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">고객의 소리</a></li>
											<li class="nav_link"><a href="#">1:1 문의</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub4_item3">
										<a class="nav_sub_header" href="#">소비자보호</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">소비자보호체계</a></li>
											<li class="nav_link"><a href="#">소비자보호 우수사례</a></li>
											<li class="nav_link"><a href="#">전자민원</a></li>
											<li class="nav_link"><a href="#">소비자보호공시</a></li>
											<li class="nav_link"><a href="#">민원사무편람</a></li>
											<li class="nav_link"><a href="#">금융정보</a></li>
											<li class="nav_link"><a href="#">금융사기 관련공시</a></li>
											<li class="nav_link"><a href="#">보안취약점 신고안내</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub4_item4">
										<a class="nav_sub_header" href="#">증명서</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">나의 증명서 발급내역</a></li>
											<li class="nav_link"><a href="#">증명서 진위 확인</a></li>
										</ul>
									</div>
									<div class="nav_sub_item" id="nav_sub4_item5">
										<a class="nav_sub_header" href="#">약관 ・ 서식</a>
										<ul class="nav_links">
											<li class="nav_link"><a href="#">약관</a></li>
											<li class="nav_link"><a href="#">서식</a></li>
											<li class="nav_link"><a href="#">상품설명서</a></li>
											<li class="nav_link"><a href="#">상품공시</a></li>
										</ul>
									</div>
								</div>
								<!-- 다섯번째 항목 -->
								<li class="nav_items" id="nav_item5"><a href="#">이벤트</a></li>
								<!-- 서류 제출하기 버튼 -->
								<li class="nav_items" id="nav_button"><a href="/kakaoBank/cardRequest/list">체크카드
										신청하기</a></li>
							</div>
						</ul>
					</div>
				</div>

				<div id="section1">
					<div id="section1_text_content">
						<h3>카카오프렌즈와 함께하는</h3>
						<h1>프렌즈 체크카드</h1>
						<p>실적, 한도 제한없이 쓸 때마다 캐시백을 적립하여 매월 현금으로 돌려드립니다.</p>
					</div>
					<div id="section1_image">
						<img src="../image/cardRequest_background.png" style="width: 700px;">
					</div>
				</div>

				<div id="request_list">
					<table id="list" width=90%>
						<tr>
							<th>Request_id</th>
							<th>(kor) 성</th>
							<th>(kor) 이름</th>
							<th>(eng) first name</th>
							<th>(eng) last name</th>
							<th>생년월일</th>
							<th>전화번호</th>
							<th>주소</th>
							<th>신청일</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>

						<c:forEach items="${list}" var="u">
							<tr>
								<td>${u.req_id}</td>
								<td>${u.kor_first_name}</td>
								<td>${u.kor_last_name}</td>
								<td>${u.eng_first_name}</td>
								<td>${u.eng_last_name}</td>
								<td>${u.birth_date}</td>
								<td>${u.phone}</td>
								<td>${u.address}</td>
								<td>${u.requestAt}</td>
								<td><a href="editform/${u.req_id}">글 수정</a></td>
								<td><a href="javascript:delete_ok('${u.req_id}')">글 삭제</a></td>
							</tr>
						</c:forEach>
					</table>
					<br />
					<div id="request_button">
						<a href="add">체크카드 신청하기</a>
					</div>
				</div>
			</body>

			</html>