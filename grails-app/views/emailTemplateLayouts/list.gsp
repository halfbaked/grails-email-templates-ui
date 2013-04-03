<!DOCTYPE html>
<html>
  <body>
    <div class="block">
      <div class="row-fluid">
        <div class="span12">
          <header class="group">
            <h1 class="pull-left"><i class="icon-envelope"></i> Email Template Layouts (${emailTemplateLayoutList.size()})</h1>           
          </header>
        </div>
      </div>
      <div class="row-fluid">
        <div class="filters span1">
        </div> 
        <div class="span10">
          <ezb:addOrDownload action="add" title="Add" />
          <table class="results table table-bordered">
            <thead>
              <tr>
                <th>Name</th>
              </tr>
            </thead>
            <tbody>
            <g:each in="${emailTemplateLayoutList}" var="emailTemplateLayout">
            <tr>
              <td><g:link action="show" id="${emailTemplateLayout.id}">${emailTemplateLayout.name}</g:link></td>
            </tr>
            </g:each>
            </tbody>
          </table>
        </div> <!-- end span -->
      </div> <!-- end fluid row -->
    </div> <!-- end block -->
  </body>
</html>
