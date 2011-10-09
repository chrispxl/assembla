<cfif StructKeyExists( session, "assembla") && StructKeyExists( url, "space") >
	<cfif !StructKeyExists(session, "spaceDetailsXml") || !Len(session.spaceDetailsXml)>
		<cfset variables.spaceDetails = session.assembla.getSpaceTickets( url.space ) >
		<cfif StructKeyExists( variables, "spaceDetails" ) && Len( variables.spaceDetails ) >
			<cfset session.spaceDetailsXml = XMLParse( variables.spaceDetails )>
		</cfif>
		<cfset variables.spaceDetails = ""> <!--- reset variable --->
	</cfif>
	
	<cfif StructKeyExists( session.spaceDetailsXml, "tickets" ) && StructKeyExists( session.spaceDetailsXml.tickets, "ticket" )>
		<cfset variables.ticketCount = ArrayLen( session.spaceDetailsXml.tickets.ticket ) >
		<cfoutput>spacesCount: #variables.ticketCount#</cfoutput>
		
		<cfif Len(variables.ticketCount)>
			<cfloop from="1" to="#variables.ticketCount#" index="i">
				<cfset variables.currentTicket = session.spaceDetailsXml.tickets.ticket[i]>
				<cfif StructKeyExists(variables.currentTicket, "summary") && StructKeyExists(variables.currentTicket, "id") >
					<cfoutput><p>#variables.currentTicket.id.xmltext#: #variables.currentTicket.summary.xmltext#</p></cfoutput>
				</cfif>
		    </cfloop>
		</cfif>
	</cfif>
	
</cfif>