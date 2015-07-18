<cfcomponent>
	<cfprocessingdirective pageencoding="utf-8" >
	<cfset this.datasource="scroll_RPC">
	<cfset this.name ="RPC_SCROLL">
	<cfset this.serialization.preservecaseforstructkey = true >
   	<cfset this.serialization.serializeQueryAs = "struct">
	<cfset this.sessionManagement = true />
	
	 
	
<!---<cfif isdefined("session.nombre")>
     <cflocation url="index.cfm" addtoken="false">
</cfif>
	
	
	<cfset this.sessionTimeout = createtimespan(0,0,0,2)>--->
	<!---<cfoutput>#myCipherText#</cfoutput>--->
   
  <!--- <cfset this.sessionManagement = true />
   <cffunction
        name="onRequestStart"
        access="public"
        returntype="boolean"
        output="false"
        hint="I initialize the page request.">
        
        
        <cfargument name="TargetPage" type="string" required="true">
     <cfif structKeyExists( url, "killSession" )>
     	<cfif isdefined("session.nombre")>
     		<!---<cfset onSessionEnd(session)>--->
    	 	<cfset structDelete(session,"nombre")>
     	</cfif>
     		
    	 </cfif>
  <!---  <cfif ListLast(arguments.TargetPage, "/") EQ "index.cfm">
    	<cfset session.auth.page = ListLast(arguments.TargetPage, "/")>
    	<cfif not isdefined("session.auth.ENC2")>		
    	<cfset session.auth.ENC2 = generateSecretKey("AES")>
    	</cfif>
    </cfif>
    	--->
    	
        
          <cfreturn true />
    </cffunction>
    
    
        <cffunction
        name="onSessionEnd"
        access="public"
        returntype="void"
        output="false"
        hint="I handle any end-of-session logic.">
 
        <!--- Define arguments. --->
        <cfargument
            name="sessionScope"
            type="any"
            required="true"
            hint="I am the session scope that is ending."
            />
 
        <cfargument
            name="applicationScope"
            type="any"
            required="false"
            hint="I am the application scope parent to the given session."
            />--->
 
        <!--- Output the CFID and CFTOKEN values to the log. --->
       
      <!--- <cfmail from="ramonsosadiaz@gmail.com" subject="prueba de correo" to="ramonsosadiaz@gmail.com" type="html">
 			<html>
 				Prueba de correo.
 				<!---#arguments.sessionScope.hora# <br>
 				#arguments.sessionScope.cfid# <br>--->
 				#arguments.sessionScope.sessionid# <br>
 				<!---#arguments.sessionScope.name# <br>--->
 				#now()#
 			</html>
 		</cfmail>--->
       
      <!---  <cffile
            action="append"
            file="#getDirectoryFromPath( getCurrentTemplatePath() )#log.cfm"
            output="ENDED: #arguments.sessionScope.cfid#<br />"
            />--->
            
          
            
        <!---<cfset data = structNew()>
		<cfset data.userid = arguments.sessionScope.auth.EMAIL>
		<cfset data.sesion = arguments.sessionScope.sessionid>
		<cfset data.action = "sesion">--->
	
	<!---<cfscript>
	  WSPublish('logout',serializeJSON(data));
	</cfscript>--->
          
    <!---<cfset structDelete(session,"auth")>
        Return out. 
        <cfreturn />
    </cffunction>--->
   
</cfcomponent>