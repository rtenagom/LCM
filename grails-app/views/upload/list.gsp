<%@ page import="lcm.Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
		<div class="container-narrow">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<!-- <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				
				 -->
			</ul>
			</div>
		</div>
		
		<div class="container-narrow">
		<div id="list-report" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1><br>
			
			<!-- Posible error messages-->
			<p class="text-center"><span class="label label-important"><g:message code="${flash.message}" /></span></p>
			
			
			<g:if test="${reportInstanceList.size() == 0}">
				<h3 class="text-center">There are no currently reports available</h3>
			</g:if>
			<g:else>
			
				<table>
					<thead>
						<tr>
							
							<th><g:message code="report.reportName.label" default="Report Name" /></th>
							
							<th><g:message code="report.fileName.label" default="File Name" /></th>
							
							<th><g:message code="report.locationName.label" default="Location Name" /></th>
							
							<th><g:message code="report.publicationDate.label" default="Publication Date" /></th>
							
							<th>Download PDF</th>
							
							<th>Delete PDF</th>
							
						</tr>
					</thead>
			
					<tbody>
					<g:each in="${reportInstanceList}" status="i" var="reportInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
								<td><strong>${fieldValue(bean: reportInstance, field: "reportName")}</strong></td>
								
								<td>${fieldValue(bean: reportInstance, field: "fileName")}</td>
							
								<td>${fieldValue(bean: reportInstance, field: "locationName")}</td>
							
								<td><g:formatDate date="${reportInstance.publicationDate}" /></td>
							
								<td class="text-center"><g:link class="btn btn-success" action="download" id="${reportInstance.fileName}">Download</g:link></td>
								
								<td class="text-center"><g:link class="btn btn-danger" action="delete" id="${reportInstance.id}">Delete</g:link></td>
													
							</tr>
					</g:each>
					</tbody>
				</table>
				
			<div class="pagination">
				<g:paginate total="${reportInstanceTotal}" />
			</div>
			</g:else>
		</div>
		</div>
	</body>
</html>
