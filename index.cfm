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
*/

$ = application.serviceFactory.getBean('muraScope');

if ( structkeyexists(session, 'siteid') ) {
	$.init(session.siteid);
} else {
	$.init('default');
};

// restrict to Super Users
if ( (not structkeyexists(session, 'siteID')) or (not $.currentUser().isLoggedIn()) or (not $.currentUser().isSuperUser()) ) location(application.configBean.getContext() & '/admin/', false);
</cfscript>
<style type="text/css">
#bodyWrap h3{padding-top:1em;}
#bodyWrap ul{padding:0 0.75em;margin:0 0.75em;}
</style>
<cfsavecontent variable="body">
<div id="bodyWrap">
	<h2>MuraRelatedDownloadsBox&trade;</h2>
	<p>MuraRelatedDownloadsBox plugin enables you to add a 'box' to you page which displays a list of child files of the page as clickable links. The box is not displayed if the page has no visible (i.e. <em>Display</em> option set to 'Yes' or 'Per start/stop date') child file objects.</p>

	<h3>Usage</h3>
	<p>You can use the following [mura] tag to insert a related downloads box inline with your content via the Content Editor:</p>
	<pre class="notice">[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox()[/mura]</pre>
	<p>Developers/designers can also just insert the following code into any layout templates where you want the downloads box to appear:</p>
	<pre class="notice">#$.MuraRelatedDownloadsBox.dspDownloadsBox()#</pre>
	<p>See <strong>'Configurable Options'</strong> section below for list of parameters you can pass to the dspDownloadsBox() function and their default values</p>
	<p>You can also insert the MuraRelatedDownloadsBox into a display region of your template as a configurable plugin display object using the [Content Objects] tab in Content Editor. Select <em>Plugins-&gt;MuraRelatedDownloadsBox</em> under 'Available Content Objects' and add <em>MuraRelatedDownloadsBox</em> object to one of display regions. You can then edit the plugin instance settings directly in the front-end if necessary. <em><strong>Note:</strong> added this way the downloads box will appear <u>below</u> any other content in selected display region. To add the box inline with your content, use the [mura] tag option above.</em></p>
	
	<h3>Configurable Options</h3>
	<p>The following options can be configured for the box:</p>
	<ul>
		<li><strong>boxWidth</strong> - width of the box container, in pixels. Default = 300.</li>
		<li><strong>boxTitle</strong> - title of the box displayed in the header. Default = 'Related Downloads'. Empty string = no header.</li>
		<li><strong>boxSubtitle</strong> - subtitle of the box, displayed inside the box above the files list. Default = '' (no subtitle).</li>
		<li><strong>boxPosition</strong> - box alignment on page. Possible values: 'right' = inline, floated to the right; 'left' = inline, floated left; 'block' = as a block-level element. Default = 'right'.</li>
		<li><strong>sortBy</strong> - file object attribute to sort file list by. Possible values: 'orderno'=order the files are atteched to the page in; 'title'=file title; 'subtype'=subtype of the file content type; 'lastupdate'=date of last update; 'created'=date created. Default = 'orderno'.</li>
		<li><strong>excludeFileExt</strong> - list (comma-delimited) of file extensions to HIDE. Default = '' (show all file extensions).</li>
		<li><strong>excludeFileSubtype</strong> - list of subtypes of file content type (comma-delimited) to HIDE. Default = '' (show all file sudtypes).</li>
		<li><strong>excludeFilesInNav</strong> - show/hide files which are displayed in site navigation. 1=do not list files in site navigation; 0=show all files. only files NOT. Default = 0.</li>
		<li><strong>showFileMeta</strong> - show/hide file metadata (file size in MB and file extension) in the link text. 1=show; 0=hide. Default = 1.</li>
	</ul>
	
	<h3>Box Styling</h3>
	<p></p>
	
	<h3>Tested With</h3>
	<ul>
		<li>Mura CMS Core Version <strong>5.6.4859</strong></li>
		<li>Railo <strong>3.3.1</strong></li>
	</ul>
	
	<h3>Issues / Questions?</h3>
	<p>Visit the project at <a href="https://github.com/azadisaryev/MuraRelatedDownloadsBox" target="_blank">https://github.com/azadisaryev/MuraRelatedDownloadsBox</a></p>
</div>

</cfsavecontent><cfoutput>#$.getBean('pluginManager').renderAdminTemplate(body = body, pageTitle = '')#</cfoutput>