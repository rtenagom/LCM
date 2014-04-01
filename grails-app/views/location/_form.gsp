<%@ page import="lcm.Location" %>



<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'address', 'error')} ">
	<label for="address">
		<g:message code="location.address.label" default="Address" />
		
	</label>
	<g:textField name="address" value="${locationInstance?.address}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'companyName', 'error')} required">
	<label for="companyName">
		<g:message code="location.companyName.label" default="Company Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="companyName" name="companyName.id" from="${lcm.Company.list()}" optionKey="id" required="" value="${locationInstance?.companyName?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: locationInstance, field: 'locationName', 'error')} ">
	<label for="locationName">
		<g:message code="location.locationName.label" default="Location Name" />
		
	</label>
	<g:textField name="locationName" value="${locationInstance?.locationName}"/>
</div>

