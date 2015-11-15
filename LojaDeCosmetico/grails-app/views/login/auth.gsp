<html>
<head>
    <title><g:message code="springSecurity.login.title"/></title>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="login.css"/>
    <asset:javascript src="application.js"/>
    <r:require modules="bootstrap"/>
    <r:layoutResources/>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class='login-panel panel panel-default'>            
                    <div class='panel-heading'><h3 class="panel-title"><g:message code="springSecurity.login.header"/></h3></div>

                    <div class="panel-body">
                        <g:if test='${flash.message}'>
                            <div class='alert alert-success'>${flash.message}</div>
                        </g:if>

                        <form class="testando" action='${postUrl}' method='POST' autocomplete='on'>
                            <fieldset>
                                <div class="form-group has-feedback">
                                    <input type='text' class='form-control' name='j_username' id='username' placeholder="${message(code: 'springSecurity.login.username.label')}" autofocus/>
                                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                                </div>
                            
                                <div class="form-group has-feedback">
                                    <input type='password' class='form-control' name='j_password' id='password' placeholder="${message(code: 'springSecurity.login.password.label')}" />
                                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                </div>

                                <div class="form-group">
                                    <div class="checkbox">
                                        <label for='remember_me'>
                                        <input type='checkbox' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
                                        <g:message code="springSecurity.login.remember.me.label"/></label>
                                    </div>
                                </div>
                            
                                <div class="form-group">
                                    <button type='submit' class="btn btn-success btn-block btn-lg">${message(code: "springSecurity.login.button")}</button>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </div>
<script type='text/javascript'>
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
})();
</script>
</body>
</html>
