<cfcomponent>
	<cffunction name="datos" access="remote" returnformat="JSON" returntype="Any" output="true" >
		<cfargument name="data" type="any">
		<cfset texto="#deserializeJSON(data)#" >
		<cfset id="id">
		<cfset n=0>
		<cfquery name="verfify">
			TRUNCATE TABLE [RPC].[dbo].[stories]
		</cfquery>
		<cfset err = arraynew(1)>
		<cfloop array="#texto#" index="i">
			<cfset n++>
		<cftry>
			<cfquery>
				INSERT INTO [RPC].[dbo].[stories](storyID,payloadscrollcat,payloadscrollheadline,payloadpubApproved) VALUES(<CFQUEryparam cfsqltype="cf_sql_varchar" value="#id##n#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="#i.categoria#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="#i.valor#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="1">)
			</cfquery>
			<cfcatch>
				<cfset arrayappend(err,cfcatch.detail)>
			</cfcatch>
		</cftry>	
	
		</cfloop>
		<!---<cfreturn arraylen(err)>--->
		<cfif arraylen(err) gt 0 >
			<cfreturn false>
		<cfelse>
			<cfreturn true >
			
		</cfif>
		<!---<cfif arraylen(err) gt 0>
			<cfset texto[1].error = err>
			<cfset texto[1].si = arraylen(err)>
			<cfreturn false >	
		<cfelse>
			<cfreturn true >
		</cfif>--->
			
		
	</cffunction>
	<cffunction name="bitacora" access="remote" returnformat="JSON" returntype="Any" output="true" >
		<cfargument name="datoslog" type="any">
		<cfset texto="#deserializeJSON(datoslog)#" >
		<!---<cfset data = "#(texto[1].data)#">
		<cfreturn texto[1].usuario>--->
		<cfset err = arraynew(1)>
		<cftry>
			<cfquery>
				INSERT INTO [RPC].[dbo].[log](usuario,accion,fecha) VALUES(<CFQUEryparam cfsqltype="cf_sql_varchar" value="#texto[1].usuario#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="#texto[1].accion#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="#texto[1].fecha#">)
			</cfquery>
			<cfcatch>
				<cfset arrayappend(err,cfcatch.detail)>
			</cfcatch>
		</cftry>
		
		<!---<cfset id="id">
		<cfset n=0>
		<cfset err = arraynew(1)>
		<cfloop array="#texto#" index="i">
			<cfset n++>
		<cftry>
			<cfquery>
				INSERT INTO [RPC].[dbo].[log](usuario,accion,data) VALUES(<CFQUEryparam cfsqltype="cf_sql_varchar" value="#i.usuario#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="#i.accion#">,<CFQUEryparam cfsqltype="cf_sql_varchar" value="#i.data#">)
			</cfquery>
			<cfcatch>
				<cfset arrayappend(err,cfcatch.detail)>
			</cfcatch>
		</cftry>	
	
		</cfloop>
		<!---<cfreturn arraylen(err)>--->
		<cfif arraylen(err) gt 0 >
			<cfreturn false>
		<cfelse>
			<cfreturn true >
			
		</cfif>--->
		<!---<cfif arraylen(err) gt 0>
			<cfset texto[1].error = err>
			<cfset texto[1].si = arraylen(err)>
			<cfreturn false >	
		<cfelse>
			<cfreturn true >
		</cfif>--->
			
		
	</cffunction>
	
</cfcomponent>