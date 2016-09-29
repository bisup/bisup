<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<style>

.stepwizard-step p {
    margin-top: 10px;    
}

.stepwizard-row {
    display: table-row;
}

.stepwizard {
    display: table;     
    width: 100%;
    position: relative;
}

.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}

.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-order: 0;
    
}

.stepwizard-step {    
    display: table-cell;
    text-align: center;
    position: relative;
}

.btn-circle {
  width: 30px;
  height: 30px;
  text-align: center;
  padding: 6px 0;
  font-size: 12px;
  line-height: 1.428571429;
  border-radius: 15px;
}
.stepwizard-content{
 border:none !important;
 float: left !important;
 margin-top: 0 !important;
 padding: 15px !important;
 width: 100% !important;
 
}
</style>
<script type="text/javascript">
function stepnext(n){

    if(n != 0){
		//$(".stepwizard-row a").switchClass('btn-primary','btn-default');
        $(".stepwizard-row a").removeClass('btn-primary');
        $(".stepwizard-row a").addClass('btn-default');
		$('.stepwizard a[href="#step-'+n+'"]').tab('show');
		//$('.stepwizard-row a[href="#step-'+n+'"]').switchClass('btn-default','btn-primary');
        $('.stepwizard-row a[href="#step-'+n+'"]').removeClass('btn-default');
        $('.stepwizard-row a[href="#step-'+n+'"]').addClass('btn-primary');
    }
}
stepnext(1);
</script>
<body>
<div class="container">
	<div class="row">
	
    
    
        	<div class="stepwizard">
    <div class="stepwizard-row">
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle active-step" href="#step-1" data-toggle="tab" onclick="stepnext(1)" >1</a>
            <p>약관동의</p>
        </div>
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle" disabled="disabled" href="#step-2" data-toggle="tab">2</a>
            <p>회원 정보 입력</p>
        </div>
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle" disabled="disabled" href="#step-3" data-toggle="tab">3</a>
            <p>가입 완료</p>
        </div> 
    </div>
    
		<div class="rate-updates">
				
				<div class="tab-content margintop0" style="border:none !important;">
								
								<div class="tab-pane fade active in padding20" id="step-1" >
										<div class="row"> step -1 </div>
								
								<button class="btn btn-xs btn-success" onclick="stepnext(2);" type="button"><i class="icon-next"></i> Next</button>
								</div>
								
								<div class="tab-pane fade padding20 " id="step-2">
										<div class="row"> step -2 </div>
										<button class="btn btn-xs btn-success" onclick="stepnext(1);" type="button"><i class="icon-next"></i> Previous</button>
										<button class="btn btn-xs btn-success" onclick="stepnext(3);" type="button"><i class="icon-next"></i> Next</button>
								</div>
								
								<div class="tab-pane fade padding20 " id="step-3" >
									       <div class="row"> step -3 </div>
										<button class="btn btn-xs btn-success" onclick="stepnext(2);" type="button"><i class="icon-next"></i> Previous</button>
										<button class="btn btn-xs btn-success" onclick="stepnext(0);" type="button"><i class="icon-next"></i> Finish</button>
								</div>
				</div>
		</div>
		
</div>
    
	</div>
</div>
</body>
</html>