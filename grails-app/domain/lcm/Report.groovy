package lcm

class Report {
	
	String reportName
	Date publicationDate
	String fileName
	
	static belongsTo = [locationName : Location]
	
    static constraints = {
    }
	
	String toString() {
		"$reportName"
	}
	
}
