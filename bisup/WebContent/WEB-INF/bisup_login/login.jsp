<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인 페이지 입니다</title>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="/bisup/css/login.css" />
    <script>
    function check_values() {
        if ($("#username").val().length != 0 && $("#password").val().length != 0) {
            $("#button1").removeClass("hidden").animate({ left: '250px' });;
            $("#lock1").addClass("hidden").animate({ left: '250px' });;
        }
    }

    
    </script>
</head>

<div class="container">
    <div class="row colored">
        <div id="contentdiv" class="contcustom">
          <span><img alt="" src="/bisup/resources/img/logo.png" width="200px"></span>
            <h2>Login</h2>
            <div>
                <input id="username" type="text" placeholder="username" onkeypress="check_values();">
                <input id="password" type="password" placeholder="password" onkeypress="check_values();">
                <input type="submit" id="button1" class="btn btn-default wide hidden"/><span class="fa fa-check med"></span>
                <span id="lock1" class="fa fa-lock medhidden redborder"></span>
            </div>
            <div>
                <br>
                <p>
                    <a class="btn btn-link" class="text-muted" href="">비번찾기</a>
                </p>
            </div>
        </div>
    </div>
</div>