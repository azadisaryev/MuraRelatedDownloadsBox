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
component accessors=true extends='mura.cfobject' output=false {
	
	property name='$';
	
	/**
	* Constructor
	* @output false
	*/
	public any function init(required struct $) {
		set$($);
		return this;
	};

	/**
	* Main display object generator
	* @output false
	*/
	public string function dspDownloadsBox(
		boxWidth = '300',
		boxTitle = 'Related Downloads',
		boxSubtitle = '',
		boxPosition = 'right',
		sortBy = 'orderno',
		excludeFileExt = '',
		excludeFileSubtype = '',
		excludeFilesInNav = 0,
		showFileMeta = 1,
		$ = get$(),
		contentid = $.content('contentid')
	) {
		var local = {};
		
		local.sortOptions = "orderno,title,subtype,lastupdate,created";
		if ( !listfindnocase(local.sortOptions, arguments.sortBy) ) arguments.sortBy = "orderno";
		
		local.rs = $.getBean('contentGateway').getNest($.content('contentid'), $.content('siteid'), arguments.sortBy); // get a query of all child objects of current page
		
		if (local.rs.recordcount) {
			local.iterator = $.getBean("contentIterator").setQuery(local.rs);
			local.arrFiles = [];
			while (local.iterator.hasNext()) {
				local.curKid = local.iterator.next();
				if ( 
					local.curKid.getValue('type') eq 'File' // only display 'File' type objects ...
					and ( !listfindnocase(trim(arguments.excludeFileExt), local.curKid.getValue('FileExt'), ',') ) // ... EXCLUDING specific file extensions (if supplied) ...
					and ( !listfindnocase(trim(arguments.excludeFileSubtype), local.curKid.getValue('subtype'), ',') ) // ... EXCLUDING specific content sub-types (if supplied) ...
					and ( 
						arguments.excludeFilesInNav eq 0 or ( arguments.excludeFilesInNav eq 1 and local.curKid.getValue('isnav') eq 0 ) // ... EXCLUDING files shown in navigation if excludeFilesInNav = true ...
					) 
					and ( 
						local.curKid.getValue('Display') eq 1 // ... with Display = yes ...
						or (
							local.curKid.getValue('Display') eq 2 // ... OR Display = per stop/start dates ...
							and 
							local.curKid.getValue('DisplayStart') lte now() // ... with now() between start/stop dates range
							and 
							local.curKid.getValue('DisplayStop') gte now()
						)
					)
				) {
					arrayappend(
						local.arrFiles, 
						{
							link = $.addlink('File', local.curKid.getValue('filename'), local.curKid.getValue('title'), local.curKid.getValue('target'), local.curKid.getValue('targetparams'), local.curKid.getValue('contentID'), local.curKid.getValue('siteID')), 
							fileSizeMB = numberformat(local.curKid.getValue('fileSize')/1024/1024, ',^.0'), 
							fileExt = ucase(local.curKid.getValue('fileExt'))
						}
					);
				}
			}
		}
		
		if ( !arraylen(local.arrFiles) ) {
			return ''; // return empty string if no files to display
		}
		
		$.addToHTMLHeadQueue($.globalConfig('assetPath') & '/plugins/MuraRelatedDownloadsBox/extensions/murardb.htmlhead.cfm'); // load plugin stylesheet
		
		savecontent variable='local.box' {
			writeoutput('<div class="muraRDB muraRDB-' & htmleditformat(arguments.boxPosition) & '" style="width:' & val(arguments.boxWidth) & 'px;">');
			if ( len(trim(arguments.boxTitle)) ) writeoutput('<h3>' & htmleditformat(arguments.boxTitle) & '</h3>');
			if ( len(trim(arguments.boxSubtitle)) ) writeoutput('<p>' & htmleditformat(arguments.boxSubtitle) & '</p>');
			writeoutput('<ul>');
			if ( arguments.showFileMeta ) {
				$.each(Collection: local.arrFiles, Action: writeMrdbLinks); 
			} else {
				$.each(Collection: local.arrFiles, Action: writeMrdbLinksNoMeta); 
			}
			writeoutput('</ul></div>');
			
			/* DEBUG */
			//writedump(local.rs);
		}
		
		return local.box;
	};

	/**
	* Metadata property inspector
	* @output false
	*/
	public struct function getProperties() {
		var local = {};
		local.properties = {};
		local.data = getmetadata(this).properties;
		for ( local.i=1; local.i lte ArrayLen(local.data); local.i++ ) {
			local.properties[local.data[local.i].name] = evaluate('get#local.data[local.i].name#()');
		};
		return local.properties;
	};
	
	private function writeMrdbLinks(item, $) {
		writeoutput('<li>' & item.link & ' <small> ' & item.fileSizeMB & 'MB&nbsp;' & item.fileExt & '</small></li>');
	}
	
	private function writeMrdbLinksNoMeta(item, $) {
		writeoutput('<li>' & item.link & '</li>');
	}

}
</cfscript>