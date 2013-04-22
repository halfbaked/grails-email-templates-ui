package org.grails.plugin.emailTemplates

class EmailTemplateLayoutsController {

  def list = {               
    //params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [emailTemplateLayoutList: EmailTemplateLayout.list(params)]          
  }

  def update = {
    try {
      def emailTemplateLayout = EmailTemplateLayout.get(new Long(params.id))
      if (!emailTemplateLayout){
        response.sendError(404)
      } else {     
        if (request.method == 'POST') { 
          emailTemplateLayout.properties = params
          if (!emailTemplateLayout.hasErrors() && emailTemplateLayout.save(flush:true)){
            redirect action:'show', id:emailTemplateLayout.id
          }
        }
        [emailTemplateLayout: emailTemplateLayout]
      } 
    } catch (NumberFormatException nfe) {
      response.sendError(404)
    }
  }

  def show = {
    try {
      def emailTemplateLayout = EmailTemplateLayout.get(new Long(params.id))
      if (!emailTemplateLayout){
        response.sendError(404)
      } else {     
        [emailTemplateLayout: emailTemplateLayout]
      } 
    // The try/catch for NumberFormatException relates to the attempt by the UI to look up images whose
    // src is a placeholder. Without this we would be seeing errors raised in logs and error emails sent.
    // I had to attempt the Long conversion earlier, as otherwise Grails seems to wrap the exception in a number
    // or other exceptions.
    } catch (NumberFormatException nfe) { 
      response.sendError(404)
    }
  }

  def add = {
    def emailTemplateLayout = new EmailTemplateLayout()
    if(request.method != 'GET') {
      emailTemplateLayout.properties = params
      if (!emailTemplateLayout.hasErrors() && emailTemplateLayout.save(flush:true)){
        redirect action:'list'
      }
    }
    [emailTemplateLayout: emailTemplateLayout]
  }

  def delete = {
    def emailTemplateLayout = EmailTemplateLayout.get(params.id)
    if (!emailTemplateLayout){
      response.sendError(404)
    } else {    
      if (emailTemplateLayout.defaultLayout) response.sendError(500)
      else {
        EmailTemplateData.findAllByLayout(emailTemplateLayout).each { 
          it.layout = null
          it.save()
        }
        emailTemplateLayout.delete(flush:true)
        redirect action: 'list'
      }
    } 
  }

}

