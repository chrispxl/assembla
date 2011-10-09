Assembla Admin
<br/>
<cfif StructKeyExists(Url, "logout")>
	<cfset loggedOut() >
<cfelse>
	<cfif StructKeyExists(Form, "btnSubmit")>
		<!--- Actionarea --->
		<cfset session.username = Form.txtUserName >
		<cfset session.userPass = Form.txtUserPass >
		<cfoutput>Hello #session.username#.</cfoutput>
	
		<cfobject component="cfcs.AssemblaService" name="session.assembla">
		<cfset session.assembla.setUp( session.username, session.userPass )>
		
		<br/>
		<cfset loggedIn()>
	
	<cfelse>
		<cfif StructKeyExists(session, "username") && Len(session.username) && StructKeyExists( session, "userpass") && Len(session.userpass) >
			<cfset loggedIn()>
		<cfelse>
			<!--- Form Area --->
			<cfform action="" method="post">
				<cfinput name="txtUserName" type="text" value="">
				<cfinput name="txtUserPass" type="password" value="">
				<cfinput name="btnSubmit" type="submit" value="Login..">
			</cfform>
		</cfif>
	</cfif>
</cfif>

<cffunction name="loggedIn" output="true">
	<cfoutput>
	<p>
		Testunit:<br/>
		<a href="html/test/getSpaces.cfm" target="_blank">getSpaces</a>
	</p>
	<p>
		<a href="?logout">logout</a>
	</p>
	</cfoutput>
</cffunction>

<cffunction name="loggedOut" output="true">
	<cfset session.username = "" >
	<cfset session.userPass = "" >
	<cfoutput><a href="?login">You are logged out. Please reload.</a></cfoutput>
</cffunction>
