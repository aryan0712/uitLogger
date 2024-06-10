public class CBTN_Utility {
    Public Static void LogException(ID recId , Exception ex,String className){
        
        Custom_Exception__c ce = new Custom_Exception__c();
        ce.ClassName__c = classname ;
        ce.Exception_Message__c = ex.getMessage() + ' : ' + ex.getCause();
        ce.Line_Number__c = String.valueOf(ex.getLineNumber());
       // ce.MethodName__c = ex.getStackTraceString();
       // ce.Exception_Type__c = ex.getTypeName();
       // ce.StackTrace__c = ex.getStackTraceString();
        //ce.User__c = UserInfo.getUserId();
        ce.Error_RecordId__c = String.valueOf(recId) ;
        ce.Type__c = 'Error';
        if(recId != null && String.valueOf(recId).startsWith('006')){
            
            ce.OpportunityId__c = recId;
            Opportunity opp = [select Id,AccountId from Opportunity Where Id =: recid];
            ce.Account__c = opp.AccountId;
            
        }
       else if(recId != null && String.valueOf(recId).startsWith('0Q0')){
            
            ce.Quote__c = recId;
            Quote qRec = [select Id,AccountId,opportunityId from Quote Where Id =: recid];
           	ce.OpportunityId__c = qRec.opportunityId;
            ce.Account__c = qRec.AccountId;
            
        }
        
        
        insert ce;
            
    }
     Public Static void LogException(ID recId , Exception ex){
        
        Custom_Exception__c ce = new Custom_Exception__c();
        ce.Exception_Message__c = ex.getMessage() + ' : ' + ex.getCause();
        ce.Line_Number__c = String.valueOf(ex.getLineNumber());
       // ce.MethodName__c = ex.getStackTraceString();
       // ce.Exception_Type__c = ex.getTypeName();
       // ce.StackTrace__c = ex.getStackTraceString();
        //ce.User__c = UserInfo.getUserId();
        ce.Error_RecordId__c = String.valueOf(recId) ;
        ce.Type__c = 'Error';
        if(recId != null && String.valueOf(recId).startsWith('006')){
            
            ce.OpportunityId__c = recId;
            Opportunity opp = [select Id,AccountId from Opportunity Where Id =: recid];
            ce.Account__c = opp.AccountId;
            
        }
       else if(recId != null && String.valueOf(recId).startsWith('0Q0')){
            
            ce.Quote__c = recId;
            Quote qRec = [select Id,AccountId,opportunityId from Quote Where Id =: recid];
           	ce.OpportunityId__c = qRec.opportunityId;
            ce.Account__c = qRec.AccountId;
            
        }
        
        
        insert ce;
            
    }
    Public static void LogRequestAndResponse(Id recId ,Integer StatusCode,String JsonReq,string JsonRes){
        
        Custom_Exception__c ce = new Custom_Exception__c();
         ce.Error_RecordId__c =String.valueOf(recId); 
          ce.Type__c = 'Callout';
          ce.Status_Code__c = StatusCode;
        if(recId != null && String.valueOf(recId).startsWith('006')){
            ce.OpportunityId__c = recId;
        }
         if(recId != null && String.valueOf(recId).startsWith('001')){
            ce.Account__c = recId;
        }
        
         if(recId != null && String.valueOf(recId).startsWith('0Q0')){
            ce.Quote__c = recId;
        }
         ce.Request_Json__c= JsonReq;
         ce.Response_Json__c= JsonRes;

        insert ce;
    }
    
    
    Public static void LogRequestAndResponse(list<Id> recIds,Integer StatusCode,String JsonReq,string JsonRes){
        
        Custom_Exception__c ce = new Custom_Exception__c();
         ce.Error_RecordId__c =String.valueOf(recIds[0]); 
          ce.Type__c = 'Callout';
          ce.Status_Code__c = StatusCode;

        for(ID id : recIds){
            
            if(id != null && String.valueOf(id).startsWith('006')){
            
            ce.OpportunityId__c =id;
      	  }
            
            if(id != null && String.valueOf(id).startsWith('001')){
            
            ce.Account__c = id;
      	  }
            
            if(id != null && String.valueOf(id).startsWith('0Q0')){
            
            ce.Quote__c =id ;
      	  }
            
            
        }
        
        
        
         ce.Request_Json__c= JsonReq;
         ce.Response_Json__c= JsonRes;

        insert ce;
    }
    
    Public static void LogRequestAndResponse(Id recId ,String JsonReq,string JsonRes){
        
        Custom_Exception__c ce = new Custom_Exception__c();
         ce.Error_RecordId__c =String.valueOf(recId); 
         ce.Type__c = 'Callout';
        if(recId != null && String.valueOf(recId).startsWith('006')){
            
            ce.OpportunityId__c = recId;
        }
         ce.Request_Json__c= JsonReq;
         ce.Response_Json__c= JsonRes;

        insert ce;
    }
}