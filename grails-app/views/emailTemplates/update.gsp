<!DOCTYPE html>
<html>
  <head>
    <ckeditor:resources/>
  </head>
  <body>
    <div class="row-fluid">
      <div class="span12">
        <ul class="breadcrumb">
          <li><g:link action="list">Email Templates</g:link> <span class="divider">/</span></li>
          <li class="active">${emailTemplateData.name}</li>
        </ul>
      </div>
    </div>

    <div class="block">
      <div class="row-fluid">
        <div class="span12">
          <header class="group" style="background:none;background-color:#333;color:#eee;"><h1 class="pull-left"><i class="icon-envelope"></i> ${emailTemplateData.name}</h1></header>
        </div>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <g:form name="emailTemplateData" action="update" id="${emailTemplateData.id}">
            <div class="form-content">
              <input value="${emailTemplateData.id}" name="id" type="hidden" />
              <g:hasErrors bean="${emailTemplateData}">
                <div class="errors"><g:renderErrors bean="${emailTemplateData}" as="list" /></div>
              </g:hasErrors>
              <emailTemplates:emailTemplateLayoutSelect name="layout.id" value="${emailTemplateData.layout}" />
              <g:if test="${!emailTemplateData.defaultForCode}">
                <div>
                   <label>Locale</label>
                   <g:localeSelect name="locale" value="${emailTemplateData.locale}" />
                </div>
              </g:if>
              <div>
                 <label>Bcc Emails</label>
                 <input class="span3" type="text" name="bccEmails" value="${emailTemplateData?.bccEmails}" />
              </div>
              <div>
                 <label>Subject</label>
                 <input class="span6" type="text" name="subject" value="${emailTemplateData?.subject}" style="margin:0;font-weight:bold;width:100%;"/>
              </div>
              <hr />
              <ckeditor:config var="toolbar_EmailTemplates">
              [
                { name: 'basic', items: [ 'Source' ] },
                { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
               { name: 'links', items: [ 'Image', 'Link', 'Unlink' ] },
               { name: 'paragraph', items: [ 'NumberedList', 'BulletedList', 'Table', 'HorizontalRule'] },
               { name: 'styles', items: [ 'Styles', 'Format', 'TextColor' ] },
              ]
              </ckeditor:config>              
              <ckeditor:editor name="body" height="400px" width="98%" toolbar="EmailTemplates" enterMode="CKEDITOR.ENTER_BR">
                <%= emailTemplateData?.body %>
              </ckeditor:editor>
            </div>
            <div class="form-actions">
              <div class="pull-left">
                <g:submitButton name="submit" value="Save Changes" class="btn btn-primary"></g:submitButton>
                <g:link action="show" id="${emailTemplateData.id}" class="btn">Cancel</g:link>
              </div>
              <div class="pull-right">
                <emailTemplates:sendTestBtn />
                <emailTemplates:emailParametersHelp scopes="${emailTemplateData?.email?.dataKeys()}" />
              </div>
            </div>
          </g:form>
          <emailTemplates:sendTestModal />
        </div> <!-- end span -->  
      </div> <!-- end row fluid -->
    </div> <!-- end block -->
  </body>
</html>

