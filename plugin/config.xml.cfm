<!--

  This file is part of MuraRelatedDownloadsBox TM
	(c) Azadi Saryev | https://plus.google.com/108538698676550512948
 
  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License along
  with this program; if not, write to the Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

-->
<cfoutput>
<plugin>
	<name>MuraRelatedDownloadsBox</name>
	<package>MuraRelatedDownloadsBox</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>0.5.20120415</version>
	<provider>Azadi Saryev</provider>
	<providerURL>https://github.com/azadisaryev/MuraRelatedDownloadsBox</providerURL>
	<category>Utility</category>
	<ormCFCLocation></ormCFCLocation>
	<customTagPaths></customTagPaths>
	<autoDeploy>false</autoDeploy>
	<settings></settings>
	
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="extensions.eventHandler" persist="false" />
	</eventHandlers>

	<displayobjects location="global">
		<displayobject
			name="MuraRelatedDownloadsBox"  
			displaymethod="dspConfiguredMuraRelatedDownloadsBox"
			component="extensions.eventHandler"
			configuratorJS="extensions/configurators/muraRelatedDownloadsBox/murardb_configurator.js"
			configuratorInit="initMRDB"
			persist="false" />
	</displayobjects>

</plugin>
</cfoutput>