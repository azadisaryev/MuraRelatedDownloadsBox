#MuraRelatedDownloadsBox&trade; Plugin

MuraRelatedDownloadsBox plugin for [Mura CMS](http://getmura.com/) enables you to add a 'related downloads box' to you page which displays a list of child files of the page as clickable links. Which files are included in the MuraRelatedDownloadsBox can be controlled through plugin options - see _'Configuration Options'_ section below for details.

##Usage
**Important:** The MuraRelatedDownloadsBox will **not** be displayed unless the page has _visible_ child files (i.e. files with _Display_ option set to 'Yes' or 'Per start/stop date'). 

+	You can use the following [mura] tag to insert MuraRelatedDownloadsBox inline with your content via the Content Editor:

````
[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox()[/mura]
````

+	You can also just insert the following code into any layout template where you want the downloads box to appear:

````
#$.MuraRelatedDownloadsBox.dspDownloadsBox()#
````

Since the downloads box is not displayed if the page has no visible child files, you can include the above code in your standard theme layout templates - there is no need to create a special template for pages with the downloads box.

See _'Configurable Options'_ section below for list of parameters you can pass to dspDownloadsBox() function and their default values.

+	You can also insert the MuraRelatedDownloadsBox into a display region of your page as a Plugin display object on the [Content Objects] tab in Content Editor. Select _Plugins->MuraRelatedDownloadsBox_ under 'Available Content Objects' and add _MuraRelatedDownloadsBox_ object to one of page's display regions. Plugin's configurator will pop up allowing you to edit settings for this plugin instance if necessary (see 'Configurable Options' section below for more info). 

Please keep in mind that, when added as plugin to your _main_ display region (page body), the downloads box will appear **below** the page body content. If you need the downloads box to appear _in-line_ with your page body content, use the [mura] tag option above._
	
##Configurable Options
The following parameters can be configured for the MuraRelatedDownloadsBox:

*	**boxWidth** - width of the box container, in pixels. _Default=300_
*	**boxTitle** - title of the box displayed in the header. Empty string = no header. _Default='Related Downloads'_
*	**boxSubtitle** - subtitle of the box, displayed inside the box above the files list. Empty string = no subtitle. _Default=''_
*	**boxPosition** - box alignment on page. Possible values: 'right' = inline, floated to the right; 'left' = inline, floated left; 'block' = as a block-level element. _Default='right'_
*	**sortBy** - file object attribute to sort file list by. Possible values: 'orderno'=order the files are atteched to the page in; 'title'=file title; 'subtype'=subtype of the file content type; 'lastupdate'=date of last update; 'created'=date created. _Default='orderno'_
*	**excludeFilesInNav** - show/hide files which are displayed in site navigation. 1=do not list files in site navigation; 0=show all files. _Default=0_
*	**excludeFileExt** - list (comma-delimited) of file extensions to HIDE. _Default = '' (show all file extensions)_
*	**excludeFileSubtype** - list of subtypes of file content type (comma-delimited) to HIDE. _Default='' (show all file sudtypes)_
*	**showFileMeta** - show/hide file metadata (file size in MB and file extension) in the links text. 1=show; 0=hide. _Default=1_

If you want to over-ride any of the default parameters values, you can pass them to the dspDownloadsBox() function when inserting MuraRelatedDownloadsBox using the [mura] tag. Some Examples:

````
<!-- set box width to 400px -->
[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox(boxWidth=400)[/mura]
<!-- remove header and add sub-title -->
[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox(boxTitle='', boxSubtitle='Click on the links below to view/download files')[/mura]
<!-- do not include .doc and .xls files in the downloads list -->
[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox(excludeFileExt='doc,xls')[/mura]
<!-- do not include any files already included in site navigation -->
[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox(excludeFilesInNav=1)[/mura]
<!-- display files sorted by creation date -->
[mura]$.MuraRelatedDownloadsBox.dspDownloadsBox(sortBy='created')[/mura]
````
	
##Custom Styling
The default look of MuraRelatedDownloadsBox is styled in _{MuraInstallDir}/plugins/MuraRelatedDownloadsBox/assets/murarelateddownloadsbox.css_ file.
**DO NOT edit this file** - it will be over-writen when the plugin is updated, and all your changes will be lost!

Instead, to customize the look of MuraRelatedDownloadsBox, add a _murarelateddownloadsbox.css_ file into your site theme's /css folder - the plugin checks for existence of this file and includes it into the page's `<head>` section, over-riding default styles. You can copy the plugin's murarelateddownloadsbox.css file into your site theme's /css folder and edit it as necessary. This way your styling changes will be preserved over updates.

##Tested With
+	Mura CMS Core Version **5.6.4859**
+	Railo **3.3.1**

##Issues / Questions / Feature Requests and Code Contributions
Please post your issues, questions and feature requests on the [Issues page](https://github.com/azadisaryev/MuraRelatedDownloadsBox/issues).
Code contributions (fixes/features/etc) are always welcome. All pull requests should be sent to the repo's _develop_ branch only. The _master_ branch will always be the current stable release.

##License
MuraRelatedDownloadsBox&trade; Plugin is licensed under GNU General Public License version 2 (or later).