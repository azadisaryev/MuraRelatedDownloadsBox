<cfprocessingdirective suppresswhitespace="yes">
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
*/
$ = application.serviceFactory.getBean('MuraScope').init(session.siteid);

if ( isjson($.event('params')) ) {
	params = deserializejson($.event('params'));
} else {
	params = {};
}

defaultParams = {
	boxWidth = '300',
	boxTitle = 'Related Downloads',
	boxSubtitle = '',
	boxPosition = 'right',
	sortBy = 'orderno',
	excludeFileExt = '',
	excludeFileSubtype = '',
	excludeFilesInNav = 0,
	showFileMeta = 1
};

for ( key in defaultParams ) {
	if ( !structkeyexists(params, key) ) params[key] = defaultParams[key];
}
</cfscript>
<cfoutput>
<div id="availableObjectParams"	data-object="plugin" data-name="MuraRelatedDownloadsBox" data-objectid="#$.event('objectID')#">
	<h4 class="mrdb-section">Box Options</h4>
	<dl class="singleColumn">
		<dt>
			<label for="boxWidth" class="blocklabel">Box width: </label>
			<input type="text" name="boxWidth" id="boxWidth" class="objectParam" size="4" value="#htmleditformat(params.boxWidth)#" /> pixels
		</dt>
		<dt>
			<label for="boxTitle" class="blocklabel">Box header/title: </label>
			<input type="text" name="boxTitle" id="boxTitle"class="objectParam" value="#htmleditformat(params.boxTitle)#" />
		</dt>
		<dt>
			<label for="boxSubtitle" class="blocklabel">Box subtitle: </label>
			<input type="text" name="boxSubtitle" id="boxSubtitle"class="objectParam" value="#htmleditformat(params.boxSubtitle)#" />
		</dt>
		<dt>
			<label for="boxPosition" class="blocklabel">Box alignment: </label>
			<select name="boxPosition" id="boxPosition" class="objectParam">
				<cfscript>
				opts = [['right','Float Right'],['left','Float Left'],['block','As Block']];
				for ( i=1; i lte arraylen(opts); i++ ) {
					writeoutput('<option value="' & lcase(opts[i][1]) & '"');
					if ( comparenocase(params.boxPosition, opts[i][1]) eq 0 ) {
						writeoutput(' selected="selected"');
					};
					writeoutput('>' & opts[i][2] & '</option>');
				};
				</cfscript>
			</select>
		</dt>
	</dl>
	<h4 class="mrdb-section">Files List Options</h4>
	<dl>
		<dt>
			<label for="sortBy" class="blocklabel">Order files by: </label>
			<select name="sortBy" id="sortBy" class="objectParam">
				<cfscript>
				opts = [['orderno','File order'],['title','Title'],['subtype','File sub-type'],['created','Date created'],['lastupdate','Date updated']];
				for ( i=1; i lte arraylen(opts); i++ ) {
					writeoutput('<option value="' & lcase(opts[i][1]) & '"');
					if ( comparenocase(params.sortBy, opts[i][1]) eq 0 ) {
						writeoutput(' selected="selected"');
					};
					writeoutput('>' & opts[i][2] & '</option>');
				};
				</cfscript>
			</select>
		</dt>
		<dt>
			<label class="blocklabel">Show file size/type in links?</label>
			<label><input type="radio" name="showFileMeta" class="objectParam" value="0"<cfif params.showFileMeta eq 0> checked="checked"</cfif> />No</label>
			<label><input type="radio" name="showFileMeta" class="objectParam" value="1"<cfif params.showFileMeta eq 1> checked="checked"</cfif> />Yes</label>
		</dt>
		<dt>
			<label class="blocklabel"><em>Exclude</em> files in navigation?</label>
			<label><input type="radio" name="excludeFilesInNav" class="objectParam" value="0"<cfif params.excludeFilesInNav eq 0> checked="checked"</cfif> />No</label>
			<label><input type="radio" name="excludeFilesInNav" class="objectParam" value="1"<cfif params.excludeFilesInNav eq 1> checked="checked"</cfif> />Yes</label>
			<div><em>NO = files already included in site navigation will <strong>NOT</strong> appear in the downloads list</em></div>
		</dt>
		<dt>
			<label for="excludeFileExt" class="blocklabel"><em>Exclude</em> file extensions: </label>
			<input type="text" name="excludeFileExt" id="excludeFileExt" class="objectParam" value="#htmleditformat(params.excludeFileExt)#" />
			<div><em>Comma-separated list of file extensions - e.g: doc,xls,pdf - which will <strong>NOT</strong> appear in the downloads list. Leave blank to include files with any extension.</em></div>
		</dt>
		<dt>
			<label for="excludeFileSubtype" class="blocklabel"><em>Exclude</em> file sub-types: </label>
			<input type="text" name="excludeFileSubtype" id="excludeFileSubtype" class="objectParam" value="#htmleditformat(params.excludeFileSubtype)#" />
			<div><em>Comma-separated list of file sub-types which will <strong>NOT</strong> appear in the downloads list. Leave blank to include files of all sub-types.</em></div>
		</dt>
	</dl>
	<input type="hidden" name="configuredDTS" class="objectParam" value="#now()#" />
	<input type="hidden" name="configuredBy" class="objectParam" value="#htmleditformat($.currentUser('LName'))#, #htmleditformat($.currentUser('FName'))#" />
</div>
</cfoutput>
</cfprocessingdirective>
