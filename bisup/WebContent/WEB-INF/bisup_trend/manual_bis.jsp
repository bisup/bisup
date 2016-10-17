<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<head>
<style>
@import "//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css";
@import "http://fonts.googleapis.com/css?family=Quicksand:700,400";

.box > .icon { text-align: center; position: relative; }
/* width: 88px; height: 88px; */
.box > .icon > .image { position: relative; width: 160px; height: 160px;z-index: 2; margin: auto;  border: 8px solid white; line-height: 88px; border-radius: 50%; background: rgb(170,196,196); vertical-align: middle; }
.box > .icon:hover > .image { background: #6CB4C4; }
/* .box > .icon > .image > i { font-size: 36px !important; color: #fff !important; }
.box > .icon:hover > .image > i { color: white !important; } */
.box > .icon > .info { margin-top: -24px; background: rgba(0, 0, 0, 0.04); border: 1px solid #e0e0e0; padding: 15px 0 10px 0; }
.box > .icon:hover > .info { background: rgba(0, 0, 0, 0.04); border-color: #e0e0e0; color: white; }
.box > .icon > .info > h3.title { font-family: "Quicksand",sans-serif !important; font-size: 28px; color: #222; font-weight: 500; }
.box > .icon > .info > p { font-family: "Quicksand",sans-serif !important; font-size: 15px; color: #666; line-height: 1.5em; margin: 20px;}
.box > .icon > .info > .more a { font-family: "Quicksand",sans-serif !important; font-size: 12px; color: #222; line-height: 12px; text-transform: uppercase; text-decoration: none; }
.box > .icon:hover > .info > .more > a { color: #fff; padding: 6px 8px; background-color: #63B76C; }
.box .space { height: 2px; background-color: #6CB4C4;}

/* 박싱 */



</style>
<title>Insert title here</title>
</head>
<script>
/* $(document).ready(function(){
 	$('#image1').hover(function a(){
		document.getElementById('infochang').style.display = '';
}); 

 	$('#image1').mouseout(function b(){
 		
		document.getElementById('infochang').style.display = 'none';
}); 
 	



}); */

$(document).ready(function(){
    $('#image1').hover(function(){
    	document.getElementById('infochang1').style.display = '';
    });
    $('#image1').mouseleave(function(){
    	
    	document.getElementById('infochang1').style.display = 'none';
    });
    
    $('#image2').hover(function(){
    	document.getElementById('infochang2').style.display = '';
    });
    $('#image2').mouseleave(function(){
    	document.getElementById('infochang2').style.display = 'none';
    });
    
    $('#image3').hover(function(){
    	document.getElementById('infochang3').style.display = '';
    });
    $('#image3').mouseleave(function(){
    	document.getElementById('infochang3').style.display = 'none';
    });
    
    $('#image4').hover(function(){
    	document.getElementById('infochang4').style.display = '';
    });
    $('#image4').mouseleave(function(){
    	document.getElementById('infochang4').style.display = 'none';
    });
    
    $('#image5').hover(function(){
    	document.getElementById('infochang5').style.display = '';
    });
    $('#image5').mouseleave(function(){
    	document.getElementById('infochang5').style.display = 'none';
    });
    
    $('#image6').hover(function(){
    	document.getElementById('infochang6').style.display = '';
    });
    $('#image6').mouseleave(function(){
    	document.getElementById('infochang6').style.display = 'none';
    });
});
</script>
<body>

<div class="container">
	<div class="row">
       
        <!-- Boxes de Acoes -->
    	<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
					<div class="icon">
					
					<div class="image" id="image1" >
					<h2>1 STEP</h2>
					<h3>창업예비분석</h3>
					</div>
					
					<div id="infochang1" style="display:none">
					<div class="info">
						<h3 class="title">창업예비분석</h3>
						<p>
							창업희망자는 먼저 자신의 자질 및 적성 등 을 파악하여 창업이 바람직한 것인가를 확인해야한다. 나아가 자신이 가지고 있는 자원이 창업하기에 충분한지 또 창업 시기는 적당한지에 대해서도 미리 검토해야 한다.
						</p>
					</div>
				<div class="space"></div>
				</div>
				
				</div>
			</div> 
		</div>
		
		
		
		<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
				<div class="icon">
					
					<div class="image" id="image2">
					<h2>2 STEP</h2>
					<h3>사업목적의 정의</h3>
					</div>
					
					<div id="infochang2" style="display:none">
					<div class="info">
						<h3 class="title">사업목적의 정의</h3>
						<p>
							창업의 기본적 이유와 사업 운영방향에 대해 명확히 해 두어야 한다.
사업의 목적은 이윤 추구와 같은 경제적 목적 뿐만 아니라 자아실현과 같은 개인의 사회적 삶의 목적도 포함되는 것이 바람직하다.

사업 목적은 창업자의 창업이념으로 업종 선택이나 기업 활동을 선택하는데 영향을 미치게 된다.
						</p>
					</div>
				
				<div class="space"></div>
				</div>
				
			</div> 
		</div>
		</div>
		
		<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
				<div class="icon">
					
					<div class="image" id="image3">
					<h2>STEP 3</h2>
					<h3>사업분야의 결정 아이디어 모색</h3>
					</div>
					
					<div id="infochang3" style="display:none">
					<div class="info">
						<h3 class="title">사업분야의 결정 아이디어 모색</h3>
						<p>
							창업한 사업이 성공적으로 운영되는가의 여부는 사업 아이템이 얼마나 유망하고 창업자에게 적합한 업종을 선택하였는가에 따라 결정된다. 
나아가 사업 아이디어가 얼마나 시장조건에 잘 들어맞는가 하는 점도 중요하다.
사업 아이디어를 이끌어냄에 있어서는 어떤 제품, 서비스를 생산 · 판매할 것이며 그 시기를 언제로 할 것인가에 관한 고려가 중요하다. 이를 위해 먼저 시장조사 특히, 소비자조사를 통하여 소비자 수요의 동향을 파악하고 이를 충족할 수 있는 제품이나 서비스를 발굴해야 한다.
						</p>
						
					</div>
					
				
				<div class="space"></div>
				</div>
				
			</div> 
		</div>
		</div>
		
		<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
				<div class="icon">
					
					<div class="image" id="image4">
					<h2> STEP 4</h2>
					<h3>사업성 분석</h3>
					</div>
					
					<div id="infochang4" style="display:none">
					<div class="info">
						<h3 class="title">사업성 분석</h3>
						<p>
							모든 사업은 시행하기 전에 어떤 형태로든지 사업을 통하여 발생될 손해와 이익에 관한 분석을 실시해야 한다. 사업성 분석은 시장성, 기술성 및 수익성 측면에서 이루어져야 하며, 고려하고 있는 사업이 공익과 관계되는 경우에는 사업성 분석에서 이상의 세가지뿐만 아니라 공익성 분석을 추가하여 실시해야 한다.
보다 신뢰할 수 있는 사업성 분석을 위해서는 기존 사업사례를 참조하고 나아가 희망 사업분야의 총투자 및 비용 규모, 예상입지 및 상권분석에 대한 정보를 확보해야한다.
						</p>
						
					</div>
					
					
				
				<div class="space"></div>
				</div>
				
			</div> 
		</div>
		</div>
		
		<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
				
				<div class="icon">
					<div class="image" id="image5">
					<h2> STEP 5 </h2>
					<h3>인적 물절 자원 조달과 구성</h3>
					</div>
					
					<div id="infochang5" style="display:none">
					<div class="info">
						<h3 class="title">인적 물절 자원 조달과 구성</h3>
						<p>
							사업성 분석에서 자신의 사업 아이디어가 유망한 것으로 판단되면 이를 실행하기 위한 인적 · 물적 자원을 조달하여야 한다. 
우선, 인적 자원의 조달은 창업팀을 만드는데서 시작된다. 창업팀은 사업 활동의 목표 및 범위를 결정하는 것과 같은 새로운 사업시작에 필요한 사업계획을 수립해야 한다.
다음으로 물적 자원의조달이 필요한데 여기서 가장 중요한 것은 소요자금의 조달문제이다. 
창업에 필요한 자금은 자기 자본에 의하거나 타인자본에 의해 조달할 수 있다.
						</p>
						
					</div>
					
					
				
				<div class="space"></div>
				
				</div>
			</div> 
		</div>
		</div>
		
		<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
				
				<div class="icon">
					<div class="image" id="image6">
					<h2> STEP 6</h2>
					<h3>사업계획성의 작성과 조직 구조의 설정</h3>
					</div>
					
					<div id="infochang6" style="display:none">
					<div class="info">
						<h3 class="title">사업계획성의 작성과 조직 구조의 설정</h3>
						<p>
							인적 · 물적 자원의 조달이 이루어지면 구체적으로 수행하게 될 사업 실행계획을 수립해야 한다. 
여기에는 제품 계획, 시장성과 판매계획, 생산 및 설비계획, 일정계획 등이 구체적인 사업 활동의 내역별로 포함되어야 한다. 
나아가 기업의 주요 기능에 따라 업무, 책임, 권한 등을 체계적으로 구분하고 이를 담당할 인력을 선발, 배치하여야 한다.
						</p>
						
					</div>

				<div class="space"></div>
				</div>
				
			</div> 
		</div>
		</div>
			
		<div class="col-sx-12 col-sm-6 col-lg-6">
			<div class="box">							
				<div class="icon">
					<div class="image">
					<h2> STEP 7</h2>
					<h3>사업 개시</h3>
					</div>
					
					
				
			</div> 
		</div>	
		</div>
        
			
        	    
		<!-- /Boxes de Acoes -->

<!-- 박싱 -->


	
</div>
</div>


</body>
</html>