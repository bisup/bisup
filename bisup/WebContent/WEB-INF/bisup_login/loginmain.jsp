<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>어서오세요 BisUp 입니다</title>
    <meta name="description" content="This is a free Bootstrap landing page theme created for BootstrapZero. Feature video background and one page design." />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
    <link href="//cdnjs.cloudflare.com/ajax/libs/animate.css/3.1.1/animate.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
    <link rel="stylesheet" href="/bisup/css/styles.css" />

  </head>
  <body>
    <nav id="topNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#first"><i class="ion-ios-analytics-outline"></i> BIZUP</a>
            </div>
            <div class="navbar-collapse collapse" id="bs-navbar">
                <ul class="nav navbar-nav">
                    <li>
                        <a class="page-scroll" href="#one">Intro</a>
                    </li>
                    <li>
                        <a class="page-scroll" data-toggle="modal" title="Login페이지입니다" href="#LoginModal">Login</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#four">Sing up</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#last">ID/PW찾기</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <header id="first">
        <div class="header-content">
            <div class="inner">
                <h1 class="cursive">Bisup,  Business Consultant</h1>
                <h4>클릭하세요</h4>
                <hr>
                <a href="sign.do" id="sign" data-toggle="collapse" class="btn btn-primary btn-xl">Sign up</a> &nbsp; <a href="#one" class="btn btn-primary btn-xl page-scroll">Introduce Business</a>
            </div>
        </div>
        <video autoplay="" loop="" class="fillWidth fadeIn wow collapse in" data-wow-delay="0.5s" poster="https://s3-us-west-2.amazonaws.com/coverr/poster/Traffic-blurred2.jpg" id="video-background">
            <source src="https://s3-us-west-2.amazonaws.com/coverr/mp4/Traffic-blurred2.mp4" type="video/mp4">Your browser does not support the video tag. I suggest you upgrade your browser.
        </video>
    </header>
    <section class="bg-primary" id="one">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-lg-offset-3 col-md-8 col-md-offset-2 text-center">
                    <h2 class="margin-top-0 text-primary">Bisup, Introduce Business</h2>
                    <br>
                    <p class="text-faded">
                       생계를 위해, 노후를 위해, 혹은 큰 꿈을 찾아 창업을 준비하는 분, 새로운 도약을 위해 하루 24시간이 부족한 분, 계속되는 불황으로 폐업을 고민하는 분까지…
서울시에는 매일을 바쁘게 살아가는 65만명의 소상공인이 계십니다.
그래서 비즈업은 창업을 준비하시는 모든 분을 위한 사이트를 생각했습니다.
<!--  
‘넘치는 정보들을 검색하고, 다양한 지원기관을 방문해야하는 번거로움 없이
소상공인이 필요로 하는 것들을 한 곳에서 제공하자!’
 
창업준비를 위한 상권분석, 사업계획 수립 등을 지원하는 창업교육,컨설팅
혼자서는 엄두가 나지 않던 기계설비 이용 정보 정보 제공 등 -->
 
창업 준비자 및 자영업자를 도와주는 사이트 비즈업
                    </p>
                    <a href="#two" class="btn btn-default btn-xl page-scroll">Learn More</a>
                </div>
            </div>
        </div>
    </section>
    <section id="two">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="margin-top-0 text-primary">Bisup Image</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 text-center">
                    <div class="feature">
                        <img src="/bisup/resources/img/map.png" width="120px">
                        <h3>상권정보제공</h3>
                        <p class="text-muted">상권에 대한 정보를 분석하여 제공</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 text-center">
                    <div class="feature">
                        <img src="/bisup/resources/img/grap.png" width="120px">
                        <h3>매출 트렌드 제공</h3>
                        <p class="text-muted">상권매출을 기본으로 한 분석을 통한 트렌트정보 제공</p>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 text-center">
                    <div class="feature">
                           <img src="/bisup/resources/img/view.png" width="120px">
                        <h3>창업컨설팅/점포관리</h3>
                        <p class="text-muted">상권분석과 매출분석을 통한 창업컨설팅 및 점포관리 기능 제공</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div id="galleryModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
        	<div class="modal-body">
        		<img src="//placehold.it/1200x700/222?text=..." id="galleryImage" class="img-responsive" />
        		<p>
        		    <br/>
        		    <button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">Close <i class="ion-android-close"></i></button>
        		</p>
        	</div>
        </div>
        </div>
    </div>
<div id="LoginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true"><!-- loginmodal  -->
        <div class="modal-dialog" >
        <div class="modal-content">
        	<div class="modal-body">
<div class="container">
<form:form class="form-signin" commandName="login" onsubmit="return logincheck(this)"><!--커멘드 객체로 보냄  -->
		<h1 class="form-signin-heading text-muted">Login</h1>
		<form:input path="id" class="form-control" placeholder="id를 입력하세요" required="" autofocus=""/>
		<form:input path="pw" class="form-control" id="pw"  placeholder="Password를 입력하세요" required=""/>	
		<button class="btn btn-lg btn-primary2 btn-block" type="submit">
			Sign In
		</button>
	</form:form>
</div>
 </div>
 </div>
 </div>
 </div>
    <!--scripts loaded here from cdn for performance -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.js"></script>
    <script src="/bisup/js/scripts.js"></script>
  </body>
</html>