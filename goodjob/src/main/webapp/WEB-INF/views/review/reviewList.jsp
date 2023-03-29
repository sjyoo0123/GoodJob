<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<title>Good Job</title>
</head>
<body>
	<div class="container">
		<section>
			<article>
				<form name="search" action="memberSubmitList.do" method="get">
					<select name="category">
						<option value="newest" selected>최신순</option>
						<option value="reviewCount">리뷰 많은 순</option>
					</select> 
					<input type="text" name="reviewKeyword" size="30"> <input type="submit" value="검색">
					<input type="button" value="작성" onclick="location.href='reviewWrite.do'">
				</form>
			</article>
				

			<article>
				<div
					class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4 py-5">
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#bootstrap"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">회사이름</h3>
							<br> <span>키워드</span> <span>리뷰 count</span>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#cpu-fill"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#calendar3"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#home"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#speedometer2"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#toggles2"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#geo-fill"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
					<div class="col d-flex align-items-start">
						<svg class="bi text-muted flex-shrink-0 me-3" width="1.75em"
							height="1.75em">
							<use xlink:href="#tools"></use></svg>
						<div>
							<h3 class="fw-bold mb-0 fs-4">Featured title</h3>
							<p>Paragraph of text beneath the heading to explain the
								heading.</p>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>
</body>
</html>