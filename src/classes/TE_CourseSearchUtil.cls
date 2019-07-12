/**
* @author SFDO Detroit Sprint
* @date 2019
* @description Util class to interact with Transfer Equivalency searches
*/
public class TE_CourseSearchUtil {
    
    /**
    * @description Model class to represent a course search
    */
    public class CourseTransfer{
        /**
        * @description External course taken by student
        */
        Id courseId;

        /**
        * @description Date when external course got taken
        */
        Date dateTaken;
    }
    
    /**
    * @description Get List of institutions that are available for course transfers
    * @return List of accounts where TE_Available_for_Course_Transfers__c = TRUE
    */
    public static List<Account> getInstitutions(){
        List<Account> institutions = [SELECT Id, Name FROM Account WHERE TE_Available_for_Course_Transfers__c = TRUE];
        return institutions;
    }


    /**
    * @description Get List of courses available for an institution
    * @param accountId Institution
    * @return List of external courses for institution passed as parameter
    */
    public static List<hed__Course__c> getInstitutionCourses(Id accountId){
        List<hed__Course__c> courses = [SELECT Id, Name, hed__Course_ID__c 
                                        FROM hed__Course__c 
                                        WHERE hed__Account__c = :accountId 
                                        AND hed__Account__r.TE_Available_for_Course_Transfers__c = TRUE];
        return courses;
    }

    /**
    * @description Based on list of courses, get course transfers
    * @param courseIds list of external courses to get matches to
    * @return map of courses
    */
    public static List<Course_Transfer__c> getMatches(List<CourseTransfer> courses){
        Map<Id, CourseTransfer> courseMap = groupByCourse(courses);
        List<Course_Transfer__c> matches = queryCourses(courseMap.keyset());
        return filterMatches(matches, courseMap);
    }
    
    private static List<Course_Transfer__c> queryCourses(Set<Id> courseIds){
        List<Course_Transfer__c> matches = [SELECT External_Course__c,
                                                    External_Course__r.Name,
                                                    Course__c, 
                                                    Course__r.Name,
                                                    Plan_Requirement__c,
                                                    Plan_Requirement__r.Name, 
                                                    Credits__c, 
                                                    Grade_Requirement__c,
                                                    Start_Date__c,
                                                    End_Date__c
                                                FROM Course_Transfer__c
                                                WHERE Status__c = 'Active'
                                                AND External_Course__c IN :courseIds];
        return matches;
    }
    
    private static List<Course_Transfer__c> filterMatches(List<Course_Transfer__c> matches, Map<Id, CourseTransfer> courseMap){
        List<Course_Transfer__c> filteredMatches = new List<Course_Transfer__c>();
        for(Course_Transfer__c match : matches){
            Date dateTaken = courseMap.get(match.External_Course__c).dateTaken;
            if(match.Start_Date__c <= dateTaken && match.End_Date__c >= dateTaken){
                filteredMatches.add(match);
            }
        }
        return filteredMatches;
    }

    private static Map<Id, CourseTransfer> groupByCourse(List<CourseTransfer> courseTransfers){
        Map<Id, CourseTransfer> courseMap = new Map<Id, CourseTransfer>();
        for(CourseTransfer course : courseTransfers){
            courseMap.put(course.courseId, course);
        }
        return courseMap;
    }

}
