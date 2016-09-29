(function($) {
    "use strict";

    $('body').scrollspy({
        target: '.navbar-fixed-top',
        offset: 60
    });

    $('#topNav').affix({
        offset: {
            top: 200
        }
    });
    
    new WOW().init();
    
    $('a.page-scroll').bind('click', function(event) {
        var $ele = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($ele.attr('href')).offset().top - 60)
        }, 1450, 'easeInOutExpo');
        event.preventDefault();
    });
    
    $('.navbar-collapse ul li a').click(function() {
        /* always close responsive nav after click */
        $('.navbar-toggle:visible').click();
    });

    $('#galleryModal').on('show.bs.modal', function (e) {
       $('#galleryImage').attr("src",$(e.relatedTarget).data("src"));
    });

})(jQuery);


function loginsuccess(){
	alert("로그인중기다려주십시오.");
	location.href='indexki.do';
//		frm.submit();
}
function loginCheck(){
	var param = "id" + "=" + $("#id").val() + "&" +"pw" + "="+ $("#pw").val();
	$.ajax({
		url : "bisup_login/main.do",
		type : "POST",
		data : param,
		cache : false,
		async : false,
		dataType : "text",

		success : function(response) {								
			if(response=='1')
			{
				loginsuccess();
			}
			else
			{
				alert("아이디 또는 비번이 틀렸습니다. 다시 입력하세요.")
				return false;
			}	
			
			alert(check);
		},
		error : function(request, status, error) {
			if (request.status != '0') {
				alert("code : " + request.status + "\r\nmessage : "
						+ request.reponseText + "\r\nerror : " + error);
			}
		}

	});
}

