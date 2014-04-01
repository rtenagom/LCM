package lcm

class Location {

	String locationName
	String address
	
	static belongsTo = [companyName : Company]
	
    static constraints = {
    }
	
	String toString() {
		"$locationName"
	}
	
}
