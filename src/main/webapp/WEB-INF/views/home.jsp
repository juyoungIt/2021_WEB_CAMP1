<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>카카오뱅크</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<style>
		/* 전체 페이지에 대한 기본적인 세팅 */
		body {
			/* 별도로 배경색상 지정해주는 css 코드가 필요함 */
			padding: 0px;
			margin: 0px;
			min-width: 1200px;
			font-family: 'Yoon 윤고딕','돋움',dotum,sans-serif;
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

		/* 페이지의 header와 관련된 디자인 부분 */
		#header {
			background-color: white;
			position: fixed;
			top: 0px;
			min-width: 828px;
			width: 100%;
			height: 81px;
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

		#nav_logo {
			font-size: 28px;
			height: 80px;
			display: inline-block;
			float: left;
			width: 116px;
			line-height: 80px;
			position: relative;
		}

		#nav_button {
			line-height: 80px;
			border: none !important;
		}

		#nav_button>a {
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

		/* section1의 디자인과 관련된 코드 부분 */
		#section1 {
			height: 884px;
			background-image: url("./image/section1_background.png");
			background-color: transparent;
			background-size: contain;
			background-repeat: no-repeat;
			background-position: center;
		}

		#background_line {
			width: 100%;
			position: absolute;
			height: 720px;
			background-color: #fdef6b;
			z-index: -1;
		}

		#section1_title {
			position: absolute;
			top: 175px;
			left: 90px;
			font-size: 49px;
			line-height: 1.4;
			color: black;
			padding-left: 10%;
			padding-right: 10%;
			padding-top: 30px;
		}

		#section1_paragraph {
			position: absolute;
			top: 330px;
			left: 92px;
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
			padding-left: 10%;
			padding-right: 10%;
			padding-top: 30px;
		}

		#section1_goBrand {
			position: absolute;
			top: 410px;
			left: 92px;
			font-size: 16px;
			color: black;
			font-weight: bold;
			text-decoration: underline;
			padding-left: 10%;
			padding-right: 10%;
			padding-top: 30px;
			margin-top: 20px;
		}

		#section1_store_list {
			overflow: hidden;
			position: absolute;
			top: 490px;
			margin-left: 85px;
			list-style: none;
			padding-left: 10%;
			padding-right: 10%;
			padding-top: 30px;
		}

		#section1_playStore {
			float: left;
			width: 178px;
			height: 60px;
			padding: 0 6px;
		}

		#section1_playStore>a {
			display: block;
			width: 178px;
			height: 56px;
			border: 1px solid rgba(255, 255, 255, .3);
			border-radius: 12px;
			font-size: 16.2px;
			font-weight: bold;
			line-height: 56px;
			color: #333;
			background: #fff;
			text-align: center;
			text-decoration: none;
		}

		#section1_appStore {
			float: left;
			width: 178px;
			height: 60px;
			padding: 0 6px;
		}

		#section1_appStore>a {
			display: block;
			width: 178px;
			height: 56px;
			border: 1px solid rgba(255, 255, 255, .3);
			border-radius: 12px;
			font-size: 16.2px;
			font-weight: bold;
			line-height: 56px;
			color: #333;
			background: #fff;
			text-align: center;
			text-decoration: none;
		}

		.section1_icons {
			width: 20px;
			height: 20px;
		}

		/* section2의 디자인과 관련된 코드 부분 */
		#section2 {
			display: grid;
			height: 750px;
			position: relative;
			background-color: #fff;
			color: #111;
			grid-template-rows: 1fr;
			grid-template-columns: 1fr 1fr;
			grid-template-areas: "section2_image section2_text_content";
			margin: 0px 15%;
			place-items: center;
		}

		#section2_image {
			grid-area: section2_image;
		}

		#section2_text_content {
			grid-area: section2_text_content;
		}

		#section2_title {
			font-size: 49px;
			line-height: 1.4;
			color: black;
		}

		#section2_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
		}

		#section2_button {
			width: 200px;
			padding: 25px;
			background-color: rgb(244, 244, 244);
			border-radius: 10px;
			text-align: center;
		}

		#section2_button:hover {
			text-decoration: underline;
		}

		/* section3의 디자인과 관련된 코드 부분 */
		#section3 {
			background-color: white;
		}

		#section3_content_wrapper {
			display: grid;
			padding: 30px 0px;
			grid-template-rows: 1fr;
			grid-template-columns: 1fr 1fr;
			grid-template-areas: "section3_text_content section3_image";
			margin: 0px 18%;
			place-items: center;
		}

		#section3_title {
			font-size: 49px;
			line-height: 1.4;
			color: black;
		}

		#section3_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
		}

		.section3_buttons {
			display: inline-block;
			width: 108px;
			padding: 25px;
			background-color: rgb(244, 244, 244);
			border-radius: 10px;
			text-align: center;
			margin-top: 10px;
			margin-bottom: 50px;
		}

		#section3_text_content {
			grid-area: section3_text_content;
		}

		#section3_image {
			grid-area: section3_image;
		}

		#section3_button1:hover,
		#section3_button2:hover {
			text-decoration: underline;
			cursor: pointer;
		}


		/* section4의 디자인과 관련된 코드 부분 */
		#section4 {
			background-color: white;
		}

		#section4_content_wrapper {
			display: grid;
			padding: 100px 0px;
			grid-template-rows: 1fr;
			grid-template-columns: 1fr 1fr;
			grid-template-areas: "section4_image section4_text_content";
			margin: 0px 15%;
			place-items: center;
		}

		#section4_text_content {
			grid-area: section4_text_content;
		}

		#section4_image {
			grid-area: section4_image;
		}

		#section4_title {
			padding-top: 0px;
			margin-top: 0px;
			font-size: 40px;
			line-height: 1.4;
			color: black;
		}

		#section4_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
		}

		#section4_button {
			width: 200px;
			padding: 25px;
			background-color: rgb(244, 244, 244);
			border-radius: 10px;
			text-align: center;
		}

		#section4_button:hover {
			text-decoration: underline;
			cursor: pointer;
		}

		/* section5의 디자인과 관련된 코드 부분 */
		#section5 {
			background-color: white;
			padding: 150px 0px;
		}

		#section5_content_wrapper {
			display: grid;
			grid-template-rows: 1fr;
			grid-template-columns: 1fr 1fr;
			grid-template-areas: "section5_text_content section5_image";
			place-items: center;
			margin: 0px 20%;
		}

		#section5_text_content {
			grid-area: section5_text_content;
		}

		#section5_image {
			grid-area: section5_image;
		}

		#section5_title {
			font-size: 49px;
			line-height: 1.4;
			color: black;
		}

		#section5_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
		}

		#section5_button {
			width: 200px;
			padding: 25px;
			background-color: rgb(244, 244, 244);
			border-radius: 10px;
			text-align: center;
		}

		#section5_button:hover {
			text-decoration: underline;
			cursor: pointer;
		}

		/* section6의 디자인과 관련된 코드 부분 */
		#section6 {
			padding: 100px 0px;
			background-color: white;
			background-image: url("./image/section6_background.png");
			background-size: 600px;
			background-position-x: left;
			background-position-y: center;
			background-repeat: no-repeat;
		}

		#section6_content_wrapper {
			display: grid;
			grid-template-rows: 1fr;
			grid-template-columns: 1fr 1fr;
			grid-template-areas: "section6_image section6_text_content";
			place-items: center;
			margin: 0px 15%;
		}

		#section6_text_content {
			grid-area: section6_text_content;
		}

		#section6_image {
			grid-area: section6_image;
		}

		#section6_title {
			font-size: 49px;
			line-height: 1.4;
			color: black;
		}

		#section6_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
		}

		#section6_button {
			width: 200px;
			padding: 25px;
			background-color: rgb(244, 244, 244);
			border-radius: 10px;
			text-align: center;
		}

		#section6_button:hover {
			text-decoration: underline;
			cursor: pointer;
		}


		/* section7의 디자인과 관련된 코드 부분 - 스크롤에 따라 배경이미지 변경 */
		#section7 {
			padding-top: 100px;
			background-color: #333b58;
		}

		#section7_content_wrapper {
			margin: 0px 10%;
			padding: 0px;
			place-items: center;
			text-align: center;
		}

		#section7_text {
			grid-area: section7_text;
		}

		#section7_buttons {
			grid-area: section7_buttons;
		}

		#section7_image {
			grid-area: section7_area;
		}

		#section7_title {
			font-size: 49px;
			line-height: 1.4;
			color: white;
		}

		#section7_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: white;
		}

		#section7_buttons {
			margin-top: 40px;
			margin-bottom: 50px;
		}

		.section7_button {
			display: inline-block;
			width: 166px;
			height: 52px;
			border-radius: 10px;
			background-color: rgba(255, 255, 255, 0.09);
			margin-left: 6px;
			font-size: 16px;
			line-height: 51px;
			color: #fff;
			text-align: center;
		}

		.section7_button:hover {
			text-decoration: underline;
		}

		/* section8의 디자인과 관련된 코드 부분  - 제품카드 이미지 슬라이더 */
		#section8 {
			padding-top: 100px;
			background-color: white;
		}

		#image_slider_wrapper {
			position: relative;
			width: 270px;
			height: 400px;
			margin: auto;
			padding-bottom: 30px;
			overflow-x: hidden;
		}

		#image_slider {
			width: 100%;
			margin: auto;
		}

		.slider_image {
			display: table;
			float: left;
			width: 270px;
			height: 400px;
		}

		.slider_image>img {
			width: 270px;
			height: 400px;
		}

		#text_wrapper {
			text-align: center;
			margin: 50px 0px;
		}

		#text_header>h1 {
			font-size: 45px;
			font-weight: 500;
		}

		#paragraph>p {
			color: rgb(86, 86, 86);
		}

		.slider_image {
			transition-duration: 500ms;
		}

		#button {
			width: 200px;
			padding: 25px;
			background-color: rgb(244, 244, 244);
			border-radius: 10px;
			margin-left: auto;
			margin-right: auto;
		}

		#button>a {
			color: rgb(38, 38, 38);
			text-decoration: none;
		}

		#button>a:hover {
			text-decoration: underline;
		}

		#left {
			position: relative;
			left: 20%;
			bottom: 250px;
			font-size: 70px;
			cursor: pointer;
			color: grey;
		}

		#right {
			position: relative;
			left: 70%;
			bottom: 250px;
			font-size: 70px;
			cursor: pointer;
			color: grey;
		}

		/* section9의 디자인과 관련된 코드 부분 */
		#section9 {
			padding: 150px 0px;
			background-color: #fafafa;
			text-align: center;
		}

		#section9_title {
			font-size: 49px;
			line-height: 1.4;
			color: black;
		}

		#section9_paragraph {
			font-size: 16px;
			line-height: 1.95;
			color: black;
			opacity: .7;
		}

		#section9_image {
			grid-area: section9_image;
			padding-bottom: 50px;
		}

		#section9_image>img {
			width: 1020px;
		}

		#section9_sub_text {
			display: grid;
			list-style: none;
			overflow: hidden;
			width: 1020px;
			grid-template-rows: 1fr;
			grid-template-columns: 1fr 1fr 1fr 1fr;
			grid-template-areas:
				"section9_image section9_image section9_image section9_image"
				"section9_li1 section9_li2 section9_li3 section9_li4";
			margin: auto;
			padding: 0px;
			place-items: center;
		}

		.section9_li>strong {
			font-size: 22px;
		}

		.section9_li>p {
			font-size: 16px;
			color: black;
			opacity: .5;
		}

		#section9_li1 {
			grid-area: section9_li1;
		}

		#section9_li2 {
			grid-area: section9_li2;
		}

		#section9_li3 {
			grid-area: section9_li3;
		}

		#section9_li4 {
			grid-area: section9_li4;
		}

		/* footer를 위한 디자인 */
		#footer {
			min-width: 1120px;
			background-color: #f0f0f0;
			text-align: center;
		}

		#footer_content_wrapper {
			display: grid;
			grid-template-rows: 1fr 1fr 1fr;
			grid-template-columns: 1fr;
			grid-template-areas:
				"footer_information"
				"copyright_information"
				"footer_bottom";
			padding: 25px 10%;
			place-items: center;
		}

		#copyright_information {
			grid-area: copyright_information;
			font-size: 13px;
		}

		.footer_link {
			font-size: 13px;
			margin-right: 10px;
		}

		.footer_link_divider {
			color: lightgray;
			margin-right: 10px;
		}

		#footer_information {
			grid-area: footer_information;
		}

		#footer_bottom {
			grid-area: footer_bottom;
		}

		/* divider를 위한 디자인 */
		.divider {
			width: 100%;
			height: 32px;
			background-color: #fafafa;
		}
	</style>
</head>

<body>
	<div id="content_wrapper">
		<!-- 화면 상단에 위치하는 header & navigation bar 부분 -->
		<div id="header">
			<div id="header_content_wrapper">
				<ul id="header_nav">
					<li id="nav_logo">kakao<b>bank</b></li>
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
						<li class="nav_items" id="nav_button"><a href="/kakaoBank/cardRequest/list">체크카드 신청하기</a></li>
					</div>
				</ul>
			</div>
		</div>

		<!-- Section1에 대한 html 코드 부분 -->
		<div id="section1">
			<div id="background_line"></div>
			<h1 id="section1_title">이미 모두의 은행<br>지금은 카카오뱅크</h1>
			<p id="section1_paragraph">한 사람, 한 사람을 위해 시작한 은행이<br>더 많은 사람들이 찾는 모두의 은행이 되었습니다.</p>
			<a id="section1_goBrand" href="#">브랜드 캠페인 보러가기</a>
			<ul id="section1_store_list">
				<li id="section1_playStore"><a class="link_store" href=""><img class="section1_icons"
							src="./image/google-play.png">Google Play</a></li>
				<li id="section1_appStore"><a class="link_store" href=""><img class="section1_icons" src="./image/apple.png">App
						Store</a></li>
			</ul>
		</div>

		<!-- Section2에 대한 html 코드 부분 -->
		<div id="section2">
			<div id="section2_image">
				<img src="./image/section2_image.png" style="width:473px">
			</div>
			<div id="section2_text_content">
				<div id="section2_text">
					<h1 id="section2_title">모바일로 더 손쉬운<br>계좌개설, 간편한 이체</h1>
					<p id="section2_paragraph">인증서, OTP 없이 계좌 개설이 간편합니다.<br>여러 건의 이체도 몇 번의 터치로 손쉽게 보낼 수 있습니다.</p>
				</div>
				<div id="section2_button">
					<a href="#">카카오뱅크 입출금통장 ></a>
				</div>
			</div>
		</div>

		<!-- 가독성을 위한 devider -->
		<div class="divider"></div>

		<div id="section3">
			<div id="section3_content_wrapper">
				<div id="section3_text_content">
					<div id="section3_text">
						<h1 id="section3_title">우대조건 없이<br>합리적인 예금과 적금</h1>
						<p id="section3_paragraph">기대했던 금리와 다르게 복잡한 우대조건에 실망한 적이 있었나요?<br>카카오뱅크의 예금, 적금은 숨겨진 우대조건 없이
							누구에게나
							편리하고
							합리적입니다.</p>
					</div>
					<div id="section3_button">
						<div class="section3_buttons" id="section3_button1"><a href="#">정기예금 ></a></div>
						<div class="section3_buttons" id="section3_button2"><a href="#">자유적금 ></a></div>
					</div>
					<img src="./image/section3_image1.png" style="width: 440px;">
				</div>
				<div id="section3_image1">
					<img src="./image/section3_image2.png" style="width: 400px;">
				</div>
			</div>
		</div>

		<!-- divider -->
		<div class="divider"></div>

		<div id="section4">
			<div id="section4_content_wrapper">
				<div id="section4_image">
					<img src="./image/section4_image.png" style="width: 459px">
				</div>
				<div id="section4_text_content">
					<div id="section4_text">
						<h1 id="section4_title">함께 쓰고 같이 보는<br>모임통장</h1>
						<p id="section4_paragraph">카카오톡 친구를 바로 모임통장으로 초대하고<br>친구들과 함께 잔액과 입출금 현황을 확인할 수 있습니다.<br>재미있는
							메시지
							카드로
							회비입금 요청도 해보세요.</p>
					</div>
					<div id="section4_button">
						<a href="#">
							모임통장 >
						</a>
					</div>
				</div>
			</div>
		</div>

		<!-- divider -->
		<div class="divider"></div>

		<div id="section5">
			<div id="section5_content_wrapper">
				<div id="section5_text_content">
					<div id="section5_text">
						<h1 id="section5_title">함께 도전해서<br>재미있는 26주적금</h1>
						<p id="section5_paragraph">26주동안 변화하는 재미에 빠져있는 사이<br>어느덧 만기 달성 경험을 맛보게 됩니다.</p>
					</div>
					<div id="section5_button">
						<a href="#">
							26주적금 >
						</a>
					</div>
				</div>
				<div id="section5_image">
					<img src="./image/section5_image.png" style="width: 400px;">
				</div>
			</div>
		</div>

		<!-- divider -->
		<div class="divider"></div>

		<div id="section6">
			<div id="section6_content_wrapper">
				<div id="section6_image">
					<img src="./image/section6_image.png" style="width: 400px;">
				</div>
				<div id="section6_text_content">
					<div id="section6_text">
						<h1 id="section6_title">해외계좌송금과<br>WU빠른해외송금을<br>더 쉽고, 저렴하게</h1>
						<p id="section6_paragraph">해외계좌송금이 가능한 22개국을 포함하여<br>전세계 200여국으로<br>WU빠른해외송금이 가능합니다.</p>
					</div>
					<div id="section6_button">
						<a href="#">해외송금 ></a>
					</div>
				</div>
			</div>
		</div>

		<!-- 사용자 스크롤에 따라 배경이 변경되는 파트 -->
		<div id="section7">
			<div id="section7_content_wrapper">
				<div id="section7_text">
					<h1 id="section7_title">복잡한 서류 제출을 간편하게, 내가 원하는 시간에</h1>
					<p id="section7_paragraph">이사 날짜가 주말이나 공휴일이어도 전월세보증금 대출을 신청할 수 있습니다.</p>
				</div>
				<div id="section7_buttons">
					<a class="section7_button" href="#">마이너스 통장대출 ></a>
					<a class="section7_button" href="#">신용대출 ></a>
					<a class="section7_button" href="#">개인사업자 대출 ></a>
					<a class="section7_button" href="#">전월세보증금 대출 ></a>
				</div>
				<div id="section7_image">
					<img src="./image/section7_image.png" style="width: 450px;">
				</div>
			</div>
		</div>

		<!-- 슬라이더 형태로 카카오뱅크 카드를 소개하는 부분 -->
		<div id="section8">
			<div id="content_wrapper">
				<!-- Text Content Area -->
				<div id="text_wrapper">
					<div id="text_header">
						<h1>프렌즈 체크카드,<br>내가 고르는 선택의 즐거움</h1>
					</div>
					<div id="paragraph">
						<p>프렌즈 디자인부터 멋스러운 블랙 컬러 카드까지 원하는 디자인과 기능을 선택할 수 있습니다.</p>
					</div>
					<div id="button"><a href="https://www.kakaobank.com/products/checkcard">카카오뱅크 프렌즈 체크카드</a><i
							class="bi bi-chevron-right" id="icon"></i></div>
				</div>
				<!-- Image Slider Area -->
				<div id="image_slider_wrapper">
					<div id="image_slider">
						<div id="image0" class="slider_image"><img src="./image/card-1.png"></div>
						<div id="image1" class="slider_image"><img src="./image/card-2.png"></div>
						<div id="image2" class="slider_image"><img src="./image/card-3.png"></div>
						<div id="image3" class="slider_image"><img src="./image/card-4.png"></div>
						<div id="image4" class="slider_image"><img src="./image/card-5.png"></div>
					</div>
				</div>
				<!-- Slider Box Area -->
				<div class="slide_btn_box">
					<i class="bi bi-chevron-left" id="left"></i>
					<i class="bi bi-chevron-right" id="right"></i>
				</div>
			</div>
			<script>
				const slideList = document.querySelector('#image_slider'); // Slide parent dom
				const slideContents = document.querySelectorAll('.slider_image'); // each slide dom
				const slideBtnNext = document.querySelector('#right'); // next button
				const slideBtnPrev = document.querySelector('#left'); // prev button
				const slideLen = slideContents.length; // slide length
				const slideWidth = 270; // slide width
				const slideSpeed = 300; // slide speed
				const startNum = 0; // initial slide index (0 ~ 4)
				slideList.style.width = slideWidth * (slideLen + 2) + "px";
				// Copy first and last slide
				let firstChild = slideList.firstElementChild;
				let lastChild = slideList.lastElementChild;
				let clonedFirst = firstChild.cloneNode(true);
				let clonedLast = lastChild.cloneNode(true);
				// Add copied Slides
				slideList.appendChild(clonedFirst);
				slideList.insertBefore(clonedLast, slideList.firstElementChild);
				slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 100px)";
				let curIndex = startNum; // current slide index (except copied slide)
				let curSlide = slideContents[curIndex]; // current slide dom
				curSlide.classList.add('slide_active');
				/** Next Button Event */
				slideBtnNext.addEventListener('click', function () {
					if (curIndex <= slideLen - 1) {
						slideList.style.transition = slideSpeed + "ms";
						slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
					}
					if (curIndex == slideLen - 1) {
						setTimeout(function () {
							slideList.style.transition = "0ms";
							slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
						}, slideSpeed);
						curIndex = -1;
					}
					curSlide.classList.remove('slide_active');
					curSlide = slideContents[++curIndex];
					curSlide.classList.add('slide_active');
				});
				/** Prev Button Event */
				slideBtnPrev.addEventListener('click', function () {
					if (curIndex >= 0) {
						slideList.style.transition = slideSpeed + "ms";
						slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
					}
					if (curIndex == 0) {
						setTimeout(function () {
							slideList.style.transition = "0ms";
							slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
						}, slideSpeed);
						curIndex = slideLen;
					}
					curSlide.classList.remove('slide_active');
					curSlide = slideContents[--curIndex];
					curSlide.classList.add('slide_active');
				});
			</script>
		</div>

		<div id="section9">
			<div id="section9_text">
				<h1 id="section9_title">IT 기술로 카카오뱅크를<br>만들어 갑니다.</h1>
			</div>
			<div id="section9_bar" style="margin-top: 50px; margin-bottom: 200px;">
				<hr width="120px" color="black" size="2">
			</div>
			<ul id="section9_sub_text">
				<div id="section9_image">
					<img src="./image/section9_image.png">
				</div>
				<li class="section9_li" id="section9_li1">
					<strong>간결하고, 유려하게</strong>
					<p>작은 모바일 화면에 적합하도록<br>복잡함을 덜어낸<br>유려하고 친화적인 UX</p>
				</li>
				<li class="section9_li" id="section9_li2">
					<strong>간편한 인증, 철저한 보안</strong>
					<p>지문, 비밀번호로 간편한 인증<br>IT 기술의 강력한 보안 검증과<br>데이터 암호화</p>
				</li>
				<li class="section9_li" id="section9_li3">
					<!-- for empty space -->
				</li>
				<li class="section9_li" id="section9_li4">
					<strong>Mobile First, One App</strong>
					<p>모바일에서 뱅킹이 더 쉽고 편리하게<br>여러 앱을 설치할 필요없이<br>하나의 앱으로</p>
				</li>
			</ul>
		</div>

		<div id="footer">
			<div id="footer_content_wrapper">
				<div id="footer_information">
					<a class="footer_link" href="#">모바일뱅킹 서비스 이용약관</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">전자금융거래 기본약관</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">위치기반 서비스 이용약관</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">개인정보처리방침</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">전자민원접수</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">보호금융상품등록부</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">상품공시실</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">경영공시</a>
					<span class="footer_link_divider">|</span>
					<a class="footer_link" href="#">공지사항</a>
				</div>
				<div id="copyright_information">
					대표전화 1599-3333
					<span id="footer_tel" style="color:gray">(해외 +82-2-6420-3333)</span>
					<small id="footer_text" style="color:gray">Copyright © KakaoBank Corp. All rights
						reserved.</small>
				</div>
				<div id="footer_bottom">
					<div style="width:180px;">
						<a href="#">
							<img src="./image/footer_logo.png" style="width: 48px;">
							<span style="font-size: 13px;">웹 접근성 품질인증</span>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>