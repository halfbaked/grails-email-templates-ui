<!DOCTYPE html>
<html>
  <head>
    <title>Emails</title>
  </head>
  <body>
    <div class="block">
      <div class="row-fluid">
        <div class="span12">
          <header class="group">
            <h1 class="pull-left"><i class="icon-envelope"></i> Email Templates (${emailTemplateDataList.size()})</h1>           
          </header>
        </div>
      </div>
      <div class="row-fluid">
        <div class="filters span1">
        </div> 
        <div class="span10">
          <ezb:addOrDownload />
          <table class="results table table-bordered">
            <thead>
              <tr>
                <th>Name</th>
                <th>Locale</th>
                <th>Layout</th>
              </tr>
            </thead>
            <tbody>
            <g:each in="${emailTemplateDataList}" var="emailTemplateData">
            <tr>
              <td>
                <g:link action="show" id="${emailTemplateData.id}">
                  ${emailTemplateData.name}
                  <g:if test="${!emailTemplateData.enabled}">(Disabled)</g:if>
                </g:link>
              </td>
              <td>
                <g:if test="${emailTemplateData.defaultForCode}">
                  DEFAULT
                </g:if>
                <g:else>
                  ${emailTemplateData.locale?.displayName}                
                </g:else>
              </td>             
              <td>
                <g:if test="${!emailTemplateData.layout}">
                  DEFAULT
                </g:if>
                <g:else>
                  ${emailTemplateData.layout.name}                
                </g:else>
              </td>             
            </tr>
            </g:each>
            </tbody>
          </table>
        </div> <!-- end span -->
      </div> <!-- end fluid row -->
    </div> <!-- end block -->
  </body>
</html>
