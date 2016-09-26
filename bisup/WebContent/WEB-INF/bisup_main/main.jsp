<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script>
$name="";
$message='test';
function init(){
	var socket = new WebSocket('ws://'+location.host+'<c:url value="${echoUrl}"/>');
	$client = Stomp.over(socket); //Stomp client 구성
	$client.connect({}, function(frame) {
		console.log('connected stomp over sockjs');
		// subscribe message
		$client.subscribe('/user/topic/echo', function(message) {
			console.log('receive subscribe');
			alert(message);
		});
	});
};

//send message
function send() {
	var data = {
		userId: $name,
		msg: $message
	};
	$client.send('/app${echoUrl}', {}, JSON.stringify(data));
};

</script>
<button onclick="init()">확인</button>