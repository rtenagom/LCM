<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Welcome to LCM</title>
	
	</head>
	<body>

	<div class="nav" role="navigation">
		<div class="container-narrow">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			<sec:ifLoggedIn>
			<li><a  href="<g:createLink controller="Upload" action="list" />">List of reports</a></li>
			<sec:ifAllGranted roles="ROLE_ADMIN">
			<li><a  href="<g:createLink controller="Upload" action="show" />">Upload a report</a></li>
			<li><a  href="<g:createLink controller="Location" action="index" />">Edit locations</a></li>
			<li><a  href="<g:createLink controller="Company" action="index" />">Edit companies</a></li>
			</sec:ifAllGranted>
			</sec:ifLoggedIn>
			<sec:ifNotLoggedIn><li id="notloggedin">(Log in to access more features)</li></sec:ifNotLoggedIn>
		</ul>
		</div>
	</div>
		<div class="container-narrow">
		<div class="maincontent">
			<h2>Company Overview</h2>
			<p>Lambert Condition Monitoring Ltd.’s experience spans over 21 years in the industrial sector of the East Coast of both islands, 
			covering horticultural, agricultural and manufacturing industries such as timber processing companies, cool storage companies, apple packing 
			facilities and meat processing factories. We have found that the technology is invaluable for maintaining production and protecting client’s 
			safety and assets. These programs can greatly minimize repair and labour costs, reduce inventory of parts, and avoid product variation and production loss.</p>
			<br>
			<p class="text-center">
			<img class="img-polaroid" src="${resource(dir: 'images', file: 'lcm1.png')}" alt="LCM1"/> 
			<img class="img-polaroid" src="${resource(dir: 'images', file: 'lcm2.png')}" alt="LCM2"/>
			</p>
			<br>
			<h2>Mission Statement</h2>
			<p>Lambert Condition Monitoring Ltd.’s goal is to offer the latest world technologies in predictive maintenance to aid industry to reduce production 
			losses and assist in their productivity, quality, safety and profitability.</p>
			<br>
			<h2>Thermography</h2>
			<p>Thermal imaging has emerged as an effective predictive maintenance technology by identifying variations that can lead to equipment failure.</p>
			<p>By using a different spectrum of light, problems that are invisible to the naked eye become clear with an image of a thermal nature. With regular inspection, 
			issues can be highlighted before damage occurs, saving production losses and damage to plant and equipment, leaving the machinery operating in a safe condition.</p>
		</div>
		</div>
	</body>
</html>
