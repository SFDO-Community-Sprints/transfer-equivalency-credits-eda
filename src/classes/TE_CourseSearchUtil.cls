/**
* @author SFDO Detroit Sprint
* @date 2019
* @description Util class to interact with Transfer Equivalency searches
*/
public class TE_CourseSearchUtil {
    
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
                                        AND TE_Available_for_Course_Transfers__c = TRUE];
        return courses;
    }

}
