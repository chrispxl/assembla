<cfif StructKeyExists(Session, "assembla")>
	<!--- only call data, when not existing in session scope --->
	<cfif !StructKeyExists( session, "mySpacesXml" )>
		<cfset Variables.mySpaces = Session.assembla.getSpaces() >
		<cfif StructKeyExists(Variables, "mySpaces") && Len(Variables.mySpaces) >
			<cfset session.mySpacesXml = XMLParse( variables.mySpaces )>
		</cfif>
		<cfset Variables.mySpaces = ""> <!--- reset variable --->
	</cfif>
	
	<cfif StructKeyExists( session.mySpacesXml, "spaces" ) && StructKeyExists( session.mySpacesXml.spaces, "space" )>
		<cfset variables.spacesCount = ArrayLen( session.mySpacesXml.spaces.space ) >
		<cfoutput>spacesCount: #variables.spacesCount#</cfoutput>
		
		<cfif Len(variables.spacesCount)>
			<cfloop from="1" to="#variables.spacesCount#" index="i">
				<cfif StructKeyExists(session.mySpacesXml.spaces.space[i], "name") && StructKeyExists(session.mySpacesXml.spaces.space[i], "id") >
					<!---<cfoutput><p><a href="assembla/html/test/getSpaces.cfm?space=#session.mySpacesXml.spaces.space[i].id#">Space: #session.mySpacesXml.spaces.space[i].name#</a></p></cfoutput>--->
					<cfoutput><p><a href="http://localhost:8888/assembla/html/test/getSpaceDetails.cfm?space=#session.mySpacesXml.spaces.space[i].id.xmltext#">Space: #session.mySpacesXml.spaces.space[i].name.xmltext#</a></p></cfoutput>
				</cfif>
		    </cfloop>
		</cfif>
	</cfif>
</cfif>