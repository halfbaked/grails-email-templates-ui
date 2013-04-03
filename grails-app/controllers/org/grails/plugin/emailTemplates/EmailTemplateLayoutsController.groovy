package org.grails.plugin.emailTemplates

class EmailTemplateLayoutsController {

  def list = {               
    //params.max = Math.min(params.max ? params.int('max') : 10, 100)
    [emailTemplateLayoutList: EmailTemplateLayout.list(params)]          
  }

  def update = {
    def emailTemplateLayout = EmailTemplateLayout.get(params.id)
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
  }

  def show = {
    def emailTemplateLayout = EmailTemplateLayout.get(params.id)
    if (!emailTemplateLayout){
      response.sendError(404)
    } else {     
      [emailTemplateLayout: emailTemplateLayout]
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

