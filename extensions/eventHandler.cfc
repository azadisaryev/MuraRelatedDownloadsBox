<cfscript>
/**
* 
* This file is part of MuraRelatedDownloadsBox TM
* (c) Azadi Saryev | https://plus.google.com/108538698676550512948
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*
* @$ mura scope
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {
	
	/**
	* onApplicationLoad()
	* @output false
	* @$ mura scope
	*/
	public any function onApplicationLoad(required struct $) {
		variables.pluginConfig.addEventHandler(this);
	};
	
	/**
	* onSiteRequestStart()
	* @output false
	* @$ mura scope
	*/
	public any function onSiteRequestStart(required struct $) {
		var local = {};
		local.contentRenderer = new contentRenderer($);
		$.setCustomMuraScopeKey('muraRelatedDownloadsBox', local.contentRenderer);
	};

	/* 
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */
	
	/**
	* dspConfiguredMuraRelatedDownloadsBox()
	* @output false
	* @$ mura scope
	*/
	public any function dspConfiguredMuraRelatedDownloadsBox(required struct $) {
		var local = {};
		local.params = $.event('objectParams');
		local.defaultParams = {
			boxWidth = '300',
			boxTitle = 'Related Downloads',
			boxSubtitle = '',
			boxPosition = 'right',
			sortBy = 'orderno',
			excludeFileExt = '',
			excludeFileSubtype = '',
			excludeFilesInNav = 0,
			showFileMeta = 1,
			$ = arguments.$,
			contentid = $.content('contentid')
		};
		for ( local.key in local.defaultParams ) {
			if ( !structkeyexists(local.params, local.key) ) local.params[local.key] = local.defaultParams[local.key];
		}
		local.str = $.muraRelatedDownloadsBox.dspDownloadsBox(argumentCollection=local.params);
		return local.str;
	};
}
</cfscript>