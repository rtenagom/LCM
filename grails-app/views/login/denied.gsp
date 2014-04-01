<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.denied.title" /></title>
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
<div class='body'>
	<div class="text-center">
		<img src="${resource(dir: 'images', file: 'access_denied.png')}" alt="denied" />
		<h3 class="text-center">Access denied</h3>
		<div class='errors'><p><g:message code="springSecurity.denied.message" /></p></div>
	</div>
</div></div>
</body>
