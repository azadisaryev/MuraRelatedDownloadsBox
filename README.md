#MuraRelatedDownloadsBox&trade; Plugin

MuraRelatedDownloadsBox plugin for [Mura CMS](http://getmura.com/) enables you to add a 'box' to you page which displays a list of child files of the page as clickable links. Which files are included in the MuraRelatedDownloadsBox can be controlled through plugin options - see **Configuration Options** section below.
The MuraRelatedDownloadsBox will not be displayed unless the page has _visible_ child files (i.e. files with _Display_ option set to 'Yes' or 'Per start/stop date'). This allows you to include the plugin in your layout templates if necessary _(see 'Usage' section below for more info)_.

##Usage
+ You can use the following [mura] tag to insert MuraRelatedDownloadsBox inline with your content via the Content Editor:

> [mura]$.MuraRelatedDownloadsBox.dspDownloadsBox()[/mura]

+ You can also just insert the following code into any layout template where you want the downloads box to appear:

> #$.MuraRelatedDownloadsBox.dspDownloadsBox()#

See _'Configurable Options'_ section below for list of parameters for dspDownloadsBox() function and their default values.

You can also insert the MuraRelatedDownloadsBox into a display region of your page as a configurable plugin display object using the [Content Objects] tab in Content Editor. Select _Plugins->MuraRelatedDownloadsBox_ under 'Available Content Objects' and add _MuraRelatedDownloadsBox_ object to one of available display regions. Plugin's configurator will pop up allowing you to edit default setting for this plugin instance (see 'Configurable Options' section below for more info). You will also be able to edit the plugin instance settings in the front-end. _**Note:** added this way the downloads box will appear **below** any other content in selected display region. To add the box inline with your content, use the [mura] tag option above._
	
##Configurable Options
The following options can be configured for the MuraRelatedDownloadsBox:
+ **boxWidth** - width of the box container, in pixels. Default = 300.
+ **boxTitle** - title of the box displayed in the header. Default = 'Related Downloads'. Empty string = no header.
+ **boxSubtitle** - subtitle of the box, displayed inside the box above the files list. Default = '' (no subtitle).
+ **boxPosition** - box alignment on page. Possible values: 'right' = inline, floated to the right; 'left' = inline, floated left; 'block' = as a block-level element. Default = 'right'.
+ **sortBy** - file object attribute to sort file list by. Possible values: 'orderno'=order the files are atteched to the page in; 'title'=file title; 'subtype'=subtype of the file content type; 'lastupdate'=date of last update; 'created'=date created. Default = 'orderno'.
+ **excludeFileExt** - list (comma-delimited) of file extensions to HIDE. Default = '' (show all file extensions).
+ **excludeFileSubtype** - list of subtypes of file content type (comma-delimited) to HIDE. Default = '' (show all file sudtypes).
+ **excludeFilesInNav** - show/hide files which are displayed in site navigation. 1=do not list files in site navigation; 0=show all files. only files NOT. Default = 0.
+ **showFileMeta** - show/hide file metadata (file size in MB and file extension) in the link text. 1=show; 0=hide. Default = 1.
	
##Styling MuraRelatedDownloadsBox
The default look of MuraRelatedDownloadsBox styled in {mura-install-dir}/plugins/MuraRelatedDownloadsBox/assets/murarelateddownloadsbox.css file. **DO NOT** edit this file - it will be over-writen when you update the plugin, and all your changes in it will be lost!
To customize the look of MuraRelatedDownloadsBox, add a _murardb.css_ file into your site theme's /css folder. The plugin checks for existence of murardb.css file and includes it into the page's `<head>` thus over-riding the default styles. You can copy the above murarelateddownloadsbox.css file into your site theme's /css folder, rename it to murardb.css and edit as necessary. This way your changes to plugin's css will be preserved over updates.

##Tested With
+ Mura CMS Core Version **5.6.4859**
+ Railo **3.3.1**

##Issues / Questions / Feature Requests and Code Contributions
Please post your issues, questions and feature requests on the [Issues page](https://github.com/azadisaryev/MuraRelatedDownloadsBox/issues).
Code contributions (fixes/features/etc) are always welcome :) All pull requests should be sent to the repo's _develop_ branch only. The _master_ branch will always be the current stable release.

##License
MuraRelatedDownloadsBox&trade; Plugin is licensed under GNU General Public License version 2 (or later). [View license](https://github.com/azadisaryev/MuraRelatedDownloadsBox/blob/master/plugin/license.txt)