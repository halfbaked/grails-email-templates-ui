class EmailTemplatesUiGrailsPlugin {
  def version = "0.5"
  def grailsVersion = "2.0 > *"
  def dependsOn = [:]
  def pluginExcludes = [
      "grails-app/views/error.gsp",
      "grails-app/domain/org/grails/plugin/emailTemplates/test/*"
  ]

  def title = "Email Templates Ui Plugin" // Headline display name of the plugin
  def author = "Eamonn O'Connell"
  def authorEmail = "Twitter:@34m0"
  def description = '''
  UI for Email Templates plugin.
'''

  // URL to the plugin's documentation
  def documentation = "https://github.com/halfbaked/grails-email-templates-ui"

  def license = "APACHE"
  def developers = [ [ name: "Eamonn O'Connell", email: "eamonnoconnell@gmail.com" ]]
  def issueManagement = [ system: "GIT", url: "https://github.com/halfbaked/grails-email-templates-ui/issues" ]
  def scm = [ url: "https://github.com/halfbaked/grails-email-templates-ui" ]
}
