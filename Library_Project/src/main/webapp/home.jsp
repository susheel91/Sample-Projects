<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Library | HOME</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<!-- verifyinf user -->
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");		//HTTP 1.1
	response.setHeader("Pragma", "no-cache");		//HTTP 1.0
	response.setHeader("Expires", "0");		//Proxy
	
	if(session.getAttribute("username")==null)
		response.sendRedirect("index.jsp");
	%>


	<div class="container-fluid p-0 m-0">
		<%@include file="navbar_full.jsp"%>
	</div>
	<div class="container-fluid p-5 m-2">
		<h2 class="text-center">
			<u><b>About</b></u>
		</h2>
		<br>
		<p>A library is a place where books and sources of information are
			stored. They make it easier for people to get access to them for
			various purposes. Libraries are very helpful and economical too. They
			include books, magazines, newspapers, DVDs, manuscripts and more. In
			other words, they are an all-encompassing source of information.</p>
		<p>A public library is open to everyone for fulfilling the need
			for information. They are run by the government, schools, colleges,
			and universities. The members of the society or community can visit
			these libraries to enhance their knowledge and complete their
			research.</p>
		<p>Libraries play a vital role in providing people with reliable
			content. They encourage and promote the process of learning and
			grasping knowledge. The book worms can get loads of books to read
			from and enhance their knowledge. Moreover, the variety is so
			wide-ranging that one mostly gets what they are looking for.

			Furthermore, they help the people to get their hands on great
			educational material which they might not find otherwise in the
			market. When we read more, our social skills and academic performance
			improves. Most importantly, libraries are a great platform for making
			progress. When we get homework in class, the libraries help us with
			the reference material. This, in turn, progresses our learning
			capabilities and knowledge. It is also helpful in our overall
			development.</p>
		<p>A library is a very useful platform that brings together people
			willing to learn. It helps us in learning and expanding our
			knowledge. We develop our reading habits from a library and satisfy
			our thirst and curiosity for knowledge. This helps in the personal
			growth of a person and development. Similarly, libraries provide
			authentic and reliable sources of information for researchers. They
			are able to complete their papers and carry out their studies using
			the material present in a library. Furthermore, libraries are a great
			place for studying alone or even in groups, without any disturbance.

			Moreover, libraries also help in increasing our concentration levels.
			As it is a place that requires pin drop silence, a person can study
			or read in silence. It makes us focus on our studies more
			efficiently. Libraries also broaden our thinking and make us more
			open to modern thinking. Most importantly, libraries are very
			economical. The people who cannot afford to buy new books and can
			simply borrow books from a library. This helps them in saving a lot
			of money and getting information for free. In short, libraries are a
			great place to gain knowledge. They serve each person differently.
			They are a great source of learning and promoting the progress of
			knowledge. One can enjoy their free time in libraries by reading and
			researching. As the world has become digitized, it is now easier to
			browse through a library and get what you are looking for. Libraries
			also provide employment opportunities to people with fair pay and
			incredible working conditions. Thus, libraries help all, the ones
			visiting it and the ones employed there. We must not give up on
			libraries due to the digital age. Nothing can ever replace the
			authenticity and reliability one gets from a library.</p>


	</div>
</body>
</html>
