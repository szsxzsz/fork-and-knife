<%@page import="com.fork.user.action.EmailConfirm"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

         pageEncoding="UTF-8"%>

<script type="text/javascript">

function confirmemail(emailconfirm_value, authNum){

    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우

	if(!emailconfirm_value || emailconfirm_value != authNum){
		
		document.emailcheck.chid.value=0;

		alert("잘못된 인증번호입니다.");

		emailconfirm_value="";

// 		self.close();

		console.log(authNum);

    // 인증코드가 일치하는 경우

	}else if(emailconfirm_value==authNum){

		document.emailcheck.chid.value=1;
		
		opener.document.getElementById("hidEmail").value = document.getElementById("chid").value
		
		alert("인증되었습니다. ");

		emailconfirm_value="";
		
		self.close();

		opener.document.fr.emailconfirm_value.value=1;

	}

}

</script>

<%

String email=request.getParameter("email");
 
// 위에서 작성한 java파일 객체 생성

EmailConfirm emailconfirm = new EmailConfirm();
String authNum=emailconfirm.connectEmail(email);

%>

<form method="post" action="" name="emailcheck" >
	<table>
		<tr>
			<th colspan="2">인증번호를 입력하세요.</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="emailconfirm">
			</td>
			<td>
				<input type="hidden" value="" id="chid">
				<input type="button" value="확인" id="emailconfirm_btn2"
                 onclick="confirmemail(emailcheck.emailconfirm.value,
                                                               <%=authNum%>)">
			</td>
		</tr>
	</table>
</form>



