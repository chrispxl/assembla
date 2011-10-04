<cfcomponent displayname="user" hint="Userproperties" output="false">

	<cfproperty name="username" type="string" />
	<cfproperty name="userpass" type="string" />

	<cffunction name="getUsername" access="public" output="false" returntype="string">
		<cfreturn this.username />
	</cffunction>

	<cffunction name="setUsername" access="public" output="false" returntype="void">
		<cfargument name="username" type="string" required="true" />
		<cfset this.username = arguments.username />
		<cfreturn />
	</cffunction>

	<cffunction name="getUserpass" access="public" output="false" returntype="string">
		<cfreturn this.userpass />
	</cffunction>

	<cffunction name="setUserpass" access="public" output="false" returntype="void">
		<cfargument name="userpass" type="string" required="true" />
		<cfset this.userpass = arguments.userpass />
		<cfreturn />
	</cffunction>

	<cffunction name="getCredentials" access="public" output="false" returntype="String">
		<!--- TODO: Implement Method --->
		<cfreturn />
	</cffunction>
</cfcomponent>