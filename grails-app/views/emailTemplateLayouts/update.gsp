<!DOCTYPE html>
<html>
  <body>
    <div class="row-fluid">
      <div class="span12">
        <ul class="breadcrumb">
          <li><g:link action="list">Email Template Layouts</g:link> <span class="divider">/</span></li>
          <li class="active">${emailTemplateLayout.name}</li>
        </ul>
      </div>
    </div>
    <div class="block">
      <div class="row-fluid">
        <div class="span12">
          <header class="group" style="background:none;background-color:#333;color:#eee;"><h1 class="pull-left"><i class="icon-envelope"></i> ${emailTemplateLayout.name}</h1></header>
        </div>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <g:form name="emailTemplateLayout" action="update" id="${emailTemplateLayout.id}">
            <div class="form-content">
              <input value="${emailTemplateLayout.id}" name="id" type="hidden" />
              <g:hasErrors bean="${emailTemplateLayout}">
                <div class="errors"><g:renderErrors bean="${emailTemplateLayout}" as="list" /></div>
              </g:hasErrors>
              <g:if test="${!emailTemplateLayout.defaultLayout}">
              <div>
                <label>Name</label>
                <input class="span3" type="text" name="bccEmails" value="${emailTemplateLayout?.name}" />
              </div>
              </g:if>                           
              <textarea name="body" height="400px" width="98%" class="wysiwyg"><%= emailTemplateLayout?.body %></textarea>
            </div>
            <div class="form-actions">
              <div class="pull-left">
                <g:submitButton name="submit" value="Save Changes" class="btn btn-primary"></g:submitButton>
                <g:link action="show" id="${emailTemplateLayout.id}" class="btn">Cancel</g:link>
              </div>
              <div class="pull-right">
                <emailTemplates:emailTemplateLayoutMergeTagsHelp scopes="${emailTemplateLayout.mergeTags()}" />
              </div>
            </div>
          </g:form>
        </div> <!-- end span -->  
      </div> <!-- end row fluid -->
    </div> <!-- end block -->
  </body>
</html>

