Email Templates UI Plugin
=========================

A Grails plugin that provides a UI for the Email Templates plugin.

The plugin currently comes with an EmailTemplates controller, _update.groovy_ and _list.groovy_ gsp views, and a few tag libs that are used in _update.groovy_. You can use this UI directly in your own application. I did so by specifying a layout called EmailTemplates.groovy which was automatically applied due to Grails naming conventions. I have considered using the platform-core-ui plugin to define the UI, but currently don't have the bandwidth to implement it. Even if you don't use the UI provided by the plugin, it is a good example of where to start when implementing your own. 

Installation
------------

Include the dependency in your application via BuildConfig.groovy

    runtime ":email-templates-ui:0.1"

Merge Tag List
--------------

Where the merge tag refers to a list of data the only change you have to make is in the dataKeys() method of your emailTemplate, to place the merge tag within a list like so:

invoice_items: [ InvoiceItem.dataKeys() ]


