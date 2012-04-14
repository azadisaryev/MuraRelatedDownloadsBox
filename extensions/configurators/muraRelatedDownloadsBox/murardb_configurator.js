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
function initMRDB(data) {

	initConfigurator(
		data,
		{
			url: '../plugins/MuraRelatedDownloadsBox/extensions/configurators/muraRelatedDownloadsBox/murardb_configurator.cfm',
			pars: '',
			title: 'MuraRelatedDownloadsBox',
			init: function(){
				// load custom stylesheet for this plugin
				jQuery('<link rel="stylesheet" type="text/css" />')
					.attr({href:"../plugins/MuraRelatedDownloadsBox/extensions/configurators/muraRelatedDownloadsBox/murardb_configurator.css?v=20120413"})
					.appendTo(jQuery("head"));
			},
			destroy: function(){},
			validate: function(){
				var paramscontainer = jQuery("#availableObjectParams"),
						boxWidth = paramscontainer.find("input[name='boxWidth']"),
						showFileMeta = paramscontainer.find("input[name='showFileMeta']"),
						excludeFilesInNav = paramscontainer.find("input[name='excludeFilesInNav']");
				paramscontainer.find("input:text").each(function(){
					jQuery(this).val().replace(/(<([^>]+)>)/ig, ''); // strip html from all text inputs
				});
				if ( boxWidth.val().replace(/\s/g, '')=='' || isNaN(parseInt(boxWidth.val())) )		boxWidth.val(300);
				if ( showFileMeta.find(":checked").length==0 )		showFileMeta.find("[value=1]").attr({checked: 'checked'});
				if ( excludeFilesInNav.find(":checked").length==0 )		excludeFilesInNav.find("[value=0]").attr({checked: 'checked'});
				return true;
			}
		}
	);

	return true;

};