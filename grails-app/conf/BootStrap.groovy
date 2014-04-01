import lcm.Role
import lcm.User
import lcm.UserRole
import lcm.Company
import lcm.Location

class BootStrap {
	
    def init = { servletContext ->
		
		// Create two companies
		def company1 = new Company(companyName: 'LCM').save(flush: true)
		def company2 = new Company(companyName: 'testCompany').save(flush: true)
		
		// Create two roles
		def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
		def regularUserRole = new Role(authority: 'ROLE_REGULAR_USER').save(flush: true)
				
		// Create a user
		def admin = new User(username: 'admin', password: 'admin', company: company1, enabled:true)
		admin.save(flush: true)
		def sampleUser = new User(username: 'sampleUser', password: 'password', company: company2, enabled:true)
		sampleUser.save(flush: true)
		
		UserRole.create admin, adminRole, true
		UserRole.create sampleUser, regularUserRole, true
		
    }
    def destroy = {
    }
}
