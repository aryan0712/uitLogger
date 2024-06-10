@IsTest
public class CBTN_UtilityTest {
    
    
    @IsTest
    static void testLogException() {
       // Create a test Opportunity record
    	
      Account accRec = TestDataFactory.CreateAccount();
    insert accRec;
			
        // Create a test record ID using the Opportunity's Id


        // Wrap the LogException call in a try-catch block to capture the exception
        try {
            // This code will throw an exception for testing purposes
            Integer i = 1 / 0;
        } catch (Exception ex) {
            // Call the LogException method with the caught exception
            Test.startTest();
            CBTN_Utility.LogException(accRec.Id, ex,'CBTN_UTilityTest');
            Test.stopTest();
        }

        // Perform assertions
        Custom_Exception__c[] ceList = [SELECT Id FROM Custom_Exception__c];
        System.assertEquals(1, ceList.size(), 'Custom_Exception__c record should be inserted');
    }
    @IsTest
    static void testLogRequest() {
         // Create a test Opportunity record
 /*   Opportunity testOpportunity = new Opportunity(
        Name = 'Test Opportunity1',
        StageName = 'Prospecting',
        CloseDate = Date.today()
    );
    insert testOpportunity;
*/
    // Create a test record ID using the Opportunity's Id
   // Id testRecId = testOpportunity.Id;
	Account accRec = TestDataFactory.CreateAccount();
    insert accRec;
			
    // Define a test JSON request
    String testJsonReq = '{"key": "value"}';

    // Call the LogRequest method
    Test.startTest();
    CBTN_Utility.LogRequestAndResponse(accRec.Id, testJsonReq,testJsonReq);
    Test.stopTest();

    // Perform assertions
  //  Custom_Exception__c[] ceList = [SELECT Id FROM Custom_Exception__c];
 //   System.assertEquals(1, ceList.size(), 'Custom_Exception__c record should be inserted');
    }
    @IsTest
    static void testLogRequestAndResponse() {
         // Create a test Opportunity record
 /*   Opportunity testOpportunity = new Opportunity(
        Name = 'Test Opportunity1',
        StageName = 'Prospecting',
        CloseDate = Date.today()
    );
    insert testOpportunity;
	
*/
        Account accRec = TestDataFactory.CreateAccount();
    insert accRec;
			
    // Create a test record ID using the Opportunity's Id
   // Id testRecId = testOpportunity.Id;

    // Define a test JSON request
    String testJsonReq = '{"key": "value"}';
	List<ID>  testId = new List<ID>(); 
        testId.add(accRec.Id);
       
    // Call the LogRequest method
    Test.startTest();
    CBTN_Utility.LogRequestAndResponse(testId,200, testJsonReq,testJsonReq);
    Test.stopTest();

    // Perform assertions
  //  Custom_Exception__c[] ceList = [SELECT Id FROM Custom_Exception__c];
 //   System.assertEquals(1, ceList.size(), 'Custom_Exception__c record should be inserted');
    }
     @IsTest
    static void testLogRequestAndResponse1() {
         // Create a test Opportunity record
 /*   Opportunity testOpportunity = new Opportunity(
        Name = 'Test Opportunity1',
        StageName = 'Prospecting',
        CloseDate = Date.today()
    );
    insert testOpportunity;
*/
        Account accRec = TestDataFactory.CreateAccount();
    insert accRec;
			
    // Create a test record ID using the Opportunity's Id
   // Id testRecId = testOpportunity.Id;

    // Define a test JSON request
    String testJsonReq = '{"key": "value"}';
	   
    // Call the LogRequest method
    Test.startTest();
    CBTN_Utility.LogRequestAndResponse(accRec.Id,200, testJsonReq,testJsonReq);
    Test.stopTest();

    // Perform assertions
  //  Custom_Exception__c[] ceList = [SELECT Id FROM Custom_Exception__c];
 //   System.assertEquals(1, ceList.size(), 'Custom_Exception__c record should be inserted');
    }
    
}