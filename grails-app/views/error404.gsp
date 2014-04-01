<!DOCTYPE html>
<html>
	<head>
		<title>Error 404</title>
		<meta name="layout" content="main">
	</head>
	<body>
	<div class="nav" role="navigation">
	<div class="container-narrow">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
		</ul>
		</div>
	</div>
	<div class="container-narrow">
	<div class="text-center">
		<h1>HTTP Status 404</h1>
		<p><span class="label label-warning">The page you were looking for could not be found</span></p><br />
		<span>Sorry...</span>
		<p><img src="${resource(dir: 'images', file: 'Sad_Smiley.png')}" width="200px" height="200px" alt="LCM"/></p>
	</div>
	</div>
	</body>
</html>

