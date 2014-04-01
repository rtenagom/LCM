package lcm

import grails.plugins.springsecurity.Secured
import groovy.time.TimeCategory

import org.springframework.dao.DataIntegrityViolationException

class UploadController {

	def springSecurityService
	
	/*
	 * I have redirected the index to show to be able to get to this part just clicking
	 * on the upload controller link in the index page.
	 */
	
	@Secured(['ROLE_ADMIN'])
	def index() {
		render (view: "show")
	}
	
	@Secured(['ROLE_ADMIN'])
	def show() {}
	
	@Secured(['ROLE_ADMIN'])
	def upload() {

		def file = request.getFile('uploaded_file')
		def file2 = new File ("./PDF_reports/$file.originalFilename")
		
	    if (params.reportName == '') {
			flash.message = 'Report name cannot be empty'
			render(view: 'show')
			return
	    } else if (file.empty) {
	        flash.message = 'File cannot be empty'
	        render(view: 'show')
	        return
		} else if (file2.exists()) {
			flash.message = 'This file already exists'
			render(view: 'show')
			return
		} else if (params.location == null) {
	        flash.message = 'Location cannot be empty'
	        render(view: 'show')
	        return
		} else {
			params.fileName = file.originalFilename
			params.locationName = Location.find { locationName == params.location }
			params.publicationDate = new Date()
			
			file.transferTo(new File("./PDF_reports/$file.originalFilename"))
			def newReport = new Report(params).save(flush: true)
			
			redirect(action: "list")
		
	    }
	}
	
	// Copied from ReportController
	@Secured(['ROLE_ADMIN','ROLE_REGULAR_USER'])
	def list(Integer max) {
		def now
		def lastYear
		use(TimeCategory) {
			now = new Date()
			lastYear = now - 12.months
		}
		params.max = Math.min(max ?: 10, 100)
		
		def reportList = Report.list(params)
		
		def companyUser = springSecurityService.currentUser.company
		def locationCompany = Location.findAll {companyName == companyUser}
		
		def finalReportList = []
		
		for (location in locationCompany) {
			for (report in reportList) {
				if ((location.locationName == report.locationName.toString()) && (report.publicationDate >= lastYear)) {
					finalReportList.add(report)
				}
			}
		}
		
		// Sort by publication date. To make newest first, I have to reverse the order
		finalReportList.sort {
			it.publicationDate
			
			finalReportList.groupBy {
				it.locationName
			}
			
		}.reverse(true)
		
		
		[reportInstanceList: finalReportList, reportInstanceTotal: Report.count()]
	}
	
	// This generates the pdf file
	@Secured(['ROLE_ADMIN','ROLE_REGULAR_USER'])
	def download(String id) {
		
		//Looked it up at Stackoverflow.com
		def file = new File("./PDF_reports/" + id)
		response.setContentType("application/pdf")
		response.setHeader("Content-Disposition", "attachment;filename=${file.getName()}")
		response.getOutputStream() << new ByteArrayInputStream(file.getBytes())
	}
	
	
	// This is an optional method I have decided to add
	// Deletes the Report domain object and the PDF file
	@Secured(['ROLE_ADMIN'])
	def delete (String id) {
		// Copied from Report controller
		// Get the report object
		def reportInstance = Report.get(id)
		// get the report pdf
		def file = new File("./PDF_reports/" + reportInstance.fileName)
		
		if (!reportInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), ''])
			redirect(action: "list")
			return
		}

		try {
			reportInstance.delete(flush: true)
			
			// This line is to actually delete the PDF file
			file.delete()
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'report.label', default: 'Report'), ''])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'report.label', default: 'Report'), ''])
			redirect(action: "list")
		}
		
	} 
	
	
}
