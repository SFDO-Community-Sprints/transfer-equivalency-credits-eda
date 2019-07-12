/**
* @author SFDO Detroit Sprint
* @date 2019
* @description Util class to interact with Transfer Equivalency searches
*/

@IsTest
private class TE_CourseSearchUtil_Test {

    @TestSetup
    private static void testSetup() {
        Id edaAccountRecTypeId = getRecordTypeId('Account', 'Educational_Institution');

        List<Account> testAccounts = new List<Account>();

        testAccounts.add(createTestAccount('University One', edaAccountRecTypeId, true));
        testAccounts.add(createTestAccount('University Two', edaAccountRecTypeId, true));
        testAccounts.add(createTestAccount('Unsearchable Department', edaAccountRecTypeId, false));
        insert testAccounts;

        List<hed__Course__c> testCourses = new List<hed__Course__c>();

        // create some test courses for each account that is searchable
        for (Account testAccount : testAccounts) {
            if (testAccount.TE_Available_for_Course_Transfers__c) {
                testCourses.add(createCourse('English 101', 'ENG101', testAccount.Id));
                testCourses.add(createCourse('Math 101', 'MTH101', testAccount.Id));
                testCourses.add(createCourse('Spanish 201', 'ESP201', testAccount.Id));
            }
        }
        insert testCourses;
    }

    @IsTest
    private static void testGetSearchableInstitutions() {
        List<Account> searchableAccounts = TE_CourseSearchUtil.getInstitutions();

        System.assertEquals(2, searchableAccounts.size(), 'Only accounts flagged for searching should be returned');
    }

    @IsTest
    private static void testGetCoursesForInstitution() {
        Account universityOne = [SELECT Id, Name FROM Account WHERE Name = 'University One'];

        List<hed__Course__c> relatedCourses = TE_CourseSearchUtil.getInstitutionCourses(universityOne.Id);

        System.assertEquals(3, relatedCourses.size(),
                'Only courses related to the passed university should be returned');
    }

    @IsTest
    private static void testCourseGroupings() {
        // TODO: create this test
    }

    @IsTest
    private static void testFilterMatches() {
        // TODO: create this test
    }

    @IsTest
    private static void testGetCourseMatches() {
        // TODO: create this test
    }

    /**
     * @description create a test account
     *
     * @param name name of account
     * @param recordTypeName developer name of record type to assign to account
     * @param isCourseSearchable whether or not the account should appear in course search results
     *
     * @return new account sobject
     */
    private static Account createTestAccount(String name, Id recordTypeId, Boolean isCourseSearchable) {
        Account a = new Account(
                Name = name,
                TE_Available_for_Course_Transfers__c = isCourseSearchable
        );
        return a;
    }

    /**
     * create a test eda course record
     *
     * @param name text form of course name (e.g., 'English 101')
     * @param courseId abbreviated course id (e.g., 'ENG101')
     * @param accountId related account
     *
     * @return new hed__Course__c sobject
     */
    private static hed__Course__c createCourse(String name, String courseId, Id accountId) {
        hed__Course__c course = new hed__Course__c(
                Name = name,
                hed__Course_ID__c = courseId,
                hed__Account__c = accountId
        );
        return course;
    }

    /**
     * @description get the record type id for a given object and developer name
     *
     * @param objectName
     * @param developerName
     *
     * @return id of the record type
     */
    private static Id getRecordTypeId(String objectName, String developerName) {
        RecordType recordType = [
                SELECT Id, DeveloperName, SobjectType
                FROM RecordType
                WHERE SobjectType = :objectName
                AND DeveloperName = :developerName
        ];
        return recordType.Id;
    }

    /**
     * @description create a course transfer record for a course
     *
     * @param courseId course id on the transfer record
     * @param startDate course transfer record start date
     * @param endDate course transfer record end date
     *
     * @return new course transfer record
     */
    private static Course_Transfer__c createMatchingCourseTransfer(Id courseId, Date startDate, Date endDate, String Status) {
        Course_Transfer__c courseTransfer = new Course_Transfer__c(
                Course__c = courseId,
                Start_Date__c = startDate,
                End_Date__c = endDate
        );
        return courseTransfer;
    }
}
