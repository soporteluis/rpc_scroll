<cfcomponent>
	<cfset myKey = "AdfKL2545MEDCOM16luisS==" />
	<cffunction name="query" access="remote" output="true" returntype="Any" returnformat="JSON">
		<cfquery name="lista_datos">
			SELECT TOP 10 [storyID],[roID],[payloadscrollcat],[payloadscrollheadline],[payloadpubApproved],[payloadscrollcaption]
	  		FROM [RPC].[dbo].[stories]
	</cfquery>
	<cfreturn lista_datos>
	</cffunction>
	<cffunction name="menu" access="remote" output="true" returntype="Any" returnformat="JSON">
		<cfquery name="lista_menu" >
			SELECT * FROM [RPC].[dbo].[menu]
	</cfquery>
	<cfreturn lista_menu>
	<!---<cfdump var="#lista_menu#" >--->
	</cffunction>
	<cffunction name="login" access="remote" output="true" returntype="Any" returnformat="JSON" >
		<cfargument name="user" required="true" type="string" >
		<cfargument name="pass" required="true" type="string" >
		<cfhttp url="http://medcomapps.medcom.com.pa/login/index.cfm/login/#arguments.user#/#arguments.pass#" method="get" result="vl"/>
		<cfset datos=deserializeJSON(vl.filecontent)/>
		<!---<cfdump var="#deserializeJSON(vl.filecontent)#" >
		<cfdump var="#deserializeJSON(vl.filecontent)#" >
		<cfdump var="#datos[1].MAIL#" >
		<cfset salida = #datos[1].CN#>--->
		<!---<cfif salida eq true >
			<cfset session.Nombre = #datos[1].CN# >
			<cfreturn true>
		<cfelse>
			<cfreturn false>
		</cfif>--->
		<cfif datos[1].AUTH eq "true" >
			<cfset session.Nombre = #datos[1].NAME# >
			<cfset session.descripcion = #datos[1].DESCRIPTION# >
			<cfset session.mail = #datos[1].MAIL# >
			<cfset session.Nombre = #datos[1].CN# >		
		</cfif>
		
		
		<cfreturn datos[1].AUTH>
		
		
	</cffunction>
	
	
	
</cfcomponent>