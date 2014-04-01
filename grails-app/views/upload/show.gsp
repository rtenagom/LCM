<%@page import="lcm.Location" %>
<head>
<title>Upload a PDF file</title>
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
	<div class="row-fluid">
	<div class="container-mini">
		<fieldset id="customfieldset"><legend class="text-center" id="customlegend">Upload a Report</legend>
			<p class="text-center"><span class="label label-important"><g:message code="${flash.message}" /></span></p>
			<g:uploadForm class="form-horizontal" action="upload">
				<div class="control-group">
					<label class="control-label" for="reportName">Report name: </label>
					<div class="controls"><input type="text" name="reportName" id="reportName"></div>
				</div>
				<div class="control-group">
					<label class="control-label" for="uploaded_file">Choose PDF: </label>
					<div class="controls"><input type="file" name="uploaded_file" id="uploaded_file"></div>
				</div>
				<div class="control-group">
					<label class="control-label" for="location">Choose a location: </label>
					<div class="controls"><g:select name="location" id="location" from="${Location.list()}"/></div>
				</div>
				<div class="control-group">
					<label class="control-label" for="submit"></label>
					<div class="controls"><input class="btn btn-success" type="submit" id="submit" /></div>
				</div>
			</g:uploadForm>
		</fieldset>
	</div></div></div>
</body>