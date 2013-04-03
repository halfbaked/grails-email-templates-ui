<html>
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
          <header class="group"><h1 class="pull-left"><i class="icon-envelope"></i> ${emailTemplateData.name}</h1></header>
        </div>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <div class="content">                      
              <div class="group">
                <div class="btn-group pull-right">              
                  <g:link class="btn btn-primary" action="update" id="${emailTemplateData.id}">Edit</g:link>
                  <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="icon-chevron-down"></i></a>
                  <ul class="dropdown-menu">  
                    <li><g:link action="duplicate" id="${emailTemplateData.id}">Duplicate</g:link></li>
                  </ul>
                </div>
              </div>
              <ul class="attributes">
                <li class="group underline">
                  <label class="pull-left">Name</label>
                  <span class="pull-right">${emailTemplateData.name}</span>
                </li>
                <g:if test="${!emailTemplateData.defaultForCode}">
                <li class="group underline">
                  <label class="pull-left">Locale</label>
                  <span class="pull-right">${emailTemplateData.locale?.displayName}</span>
                </li>
                </g:if>
                <li class="group underline">  
                  <label class="pull-left">Subject</label>
                  <span class="pull-right">${emailTemplateData.subject}</span>
                </li>
                <li class="group underline">
                  <div><%= emailTemplateData.body %></div>
                </li>
              </ul>
          </div> <!-- end content -->
        </div> <!-- end span -->  
      </div> <!-- end row fluid -->
    </div> <!-- end block -->
  </body>
</html>

