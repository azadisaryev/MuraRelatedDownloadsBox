<cfprocessingdirective suppresswhitespace="yes">
<cfoutput>
<link rel="stylesheet" type="text/css" href="#$.globalConfig('assetPath')#/plugins/MuraRelatedDownloadsBox/assets/murarelateddownloadsbox.css" />
<cfif fileexists(expandpath($.siteConfig('themeAssetPath')) & '/css/murarelateddownloadsbox.css')><link rel="stylesheet" type="text/css" href="#$.siteConfig('themeAssetPath')#/css/murarelateddownloadsbox.css" /></cfif>
<!--[if lt IE 8]>
<link rel="stylesheet" type="text/css" href="#$.globalConfig('assetPath')#/plugins/MuraRelatedDownloadsBox/assets/murarelateddownloadsbox-ie.css" />
<![endif]-->
</cfoutput>
</cfprocessingdirective>