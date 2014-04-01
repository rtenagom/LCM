<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="LCM"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
		<!--I have not deleted "main.css" and "mobile.css" from the css default folder in case I need them later-->
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
	
	<div id="headerdesign">
	<div class="container-narrow">
	<div class="container-fluid">
	<div class="row-fluid">
		<div class="span4" id="lcmlogo">
			<img src="${resource(dir: 'images', file: 'LCM_logo2.png')}" alt="LCM"/>
		</div>
		<div class="span8 text-right">
			<h2>Lambert Condition Monitoring Ltd</h2><br>
			<sec:ifLoggedIn>
			<p class="loglayout text-right" >Welcome, <strong><sec:loggedInUserInfo field="username" /></strong> &nbsp <a class="btn btn-primary" href="<g:createLink controller="Logout" action="index" />"><i class="icon-off icon-white"></i> &nbspLogout</a></p>
			</sec:ifLoggedIn>
			<sec:ifNotLoggedIn>
			<p class="loglayout text-right">Please login here &nbsp <a class="btn btn-primary" href="<g:createLink controller="Login" action="auth" />"><i class="icon-ok icon-white"></i> &nbspLogin</a></p>
			</sec:ifNotLoggedIn>
		</div>
	</div>
	</div>
	</div>
	<br>
	</div>
	
	
		<g:layoutBody/>
		<br /><div class="footerlayout"><footer class="text-center muted">Rafael Tena | A20314078 | rtenagom@hawk.iit.edu </footer></div>
		
		<br />
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
		<r:layoutResources />
		
	</body>
</html>
