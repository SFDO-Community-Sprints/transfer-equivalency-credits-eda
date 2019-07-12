public without sharing class TE_TransferCreditSearchController {
    
    @AuraEnabled
    public static List<PicklistOption> getInstitutionOptions(){
        try {
            List<PicklistOption> options = new List<PicklistOption>();
            
            for (Account institution : TE_CourseSearchUtil.getInstitutions()) {
                options.add(new PicklistOption(institution.Id, institution.Name));
            }
            return options;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    @AuraEnabled
    public static List<PicklistOption> getCourseOptions(String institutionId){
        try {
            List<PicklistOption> options = new List<PicklistOption>();
            
            for (hed__Course__c course : TE_CourseSearchUtil.getInstitutionCourses(institutionId)) {
                options.add(new PicklistOption(course.Id, course.Name));
            }
            return options;
        } catch (Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }

    public class PicklistOption {
        @AuraEnabled
        public String value;
        @AuraEnabled
        public String label;

        public PicklistOption(String picklistValue, String picklistLabel) {
            value = picklistValue;
            label = picklistLabel;
        }
    }
}