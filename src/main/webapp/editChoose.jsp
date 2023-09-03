<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="hibernate.util.Methods"%>
<%@page import="hibernate.entity.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style><%@include file="/WEB-INF/css/production.css"%></style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script language="javascript">
	function fncSubmit(){
		if(document.EditChoose.teacher.value == ""){
			swal("Oops", "Te rog alege profesorul!", "error");
			document.EditChoose.teacher.style.border = "3px solid red";
			document.EditChoose.teacher.focus();
			return false;
		} 
		
		if(document.EditChoose.theme.value == ""){
			swal("Oops", "Te rog alege teme!", "error");
			document.EditChoose.theme.style.border = "3px solid red";
			document.EditChoose.theme.focus();
			return false;
		} 
		
	//document.EditChoose.submit();
	}
</script>
<%
////////////////
int userid = (int) request.getSession().getAttribute("userId");

String choosedTeacher = request.getParameter("teacher");
String choosedTheme = request.getParameter("theme");
if (StringUtils.isNotEmpty(choosedTeacher) && StringUtils.isNotEmpty(choosedTheme) ){
	Methods mmm = new Methods();
	mmm.editChoosedTheme(userid, choosedTeacher, choosedTheme);
}

///////////////
%>
<script language="javascript" type="text/javascript">
	var xmlHttp
	var xmlHttp
	function showTeacher(str) {
		if (typeof XMLHttpRequest != "undefined") {
			xmlHttp = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		if (xmlHttp == null) {
			alert("Browser does not support XMLHTTP Request")
			return;
		}
		var url = "ajaxFile.jsp";
		url += "?prof=" + str;
		xmlHttp.onreadystatechange = stateChange2;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
	}

	function stateChange2() {
		if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
			document.getElementById("theme").innerHTML = xmlHttp.responseText
		}
	}
</script>
<title>Edit choosed themes</title>
</head>
<div class="top-area">
	<center>
		<h2 class="titlu tracking-in-expand text-shadow-pop-top">Student
			Page</h2>
	</center>
</div>
<jsp:include page="studentMenu.jsp"></jsp:include>
<body>
	<form action="" method="post" name="EditChoose" onSubmit="return fncSubmit();">
		<center>
			<div class="content-area">
				<div class="panel" style="float: left; max-width: 600px">
					<div class="title">Edit choosed Themes</div>
					<%
						String message = (String) request.getAttribute("Message");
					%>
					<%=message != null ? message : ""%>

					<%
						Methods mm = new Methods();
						Choose choose = mm.getChoose(userid);
					%>
					<table>
						<tr>
							<td><label>Choose the teacher</label></td>
							<td colspan="3"><select name="teacher" id="teacher" class="text"
								onchange="showTeacher(this.value)">
									<!-- <option value="" selected>Select</option>-->
									<%
										//int userId = Integer.parseInt(request.getParameter("userid"));
										int userId = (int) request.getSession().getAttribute("userId");
										Methods m = new Methods();
										List<Themes> list = m.getListOfTeacher();
										for (Themes u : list) {
									%>
									<option value="<%=u.getProfName()%>"
										<%=u.getProfName().equalsIgnoreCase(choose.getProfName()) ? "selected" : ""%>><%=u.getProfName()%></option>
									<%
										}
									%>

							</select></td>
						</tr>
						<tr>
							<td><label>Choose the theme</label></td>
							<td colspan="3">
								<div id='theme'>
									<select name='theme' id='theme' class='text'>
										<option value="" selected>Select</option>
										<option value=''></option>
									</select>
								</div>
							</td>
						</tr>
					</table>
					<center>
						<input type="submit" id="editChoosenBtn" class="form-button" value="Edit"
							name="submit">
					</center>
					</td> <input type="hidden" name="userId" value="<%=userId != 0 ? userId : ""%>" />
						<p id="expiryDate" style="color: red;font-size: italic; font-family:calibri;"></p>
					<script language="javascript">
						var countDownDate = new Date("Dec 10, 2023 09:00:00").getTime();
						var x = setInterval(function() {
							var now = new Date().getTime();
							var distance = countDownDate - now;
							var days = Math.floor(distance / (1000 * 60 * 60 * 24));
							var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
							var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
							var seconds = Math.floor((distance % (1000 * 60)) / 1000);
							document.getElementById("expiryDate").innerHTML = "Au mai ramas " + days + " zile " + hours + " ore "
							+ minutes + " minute si " + seconds + " secunde pana cand expira data alegerii temei!";
							
							if (distance < 0) {
							  clearInterval(x);
							  document.getElementById("editChoosenBtn").disabled = true;
							  document.getElementById("expiryDate").innerHTML = "A expirat data alegerii temei!";
							}
						}, 1000);
					</script> 
	</form>
		<script language="javascript">
		
		var optionValues =[];
		$('#teacher option').each(function(){
		   if($.inArray(this.value, optionValues) >-1){
		      $(this).remove()
		   }else{
		      optionValues.push(this.value);
		   }
		});
		
		
		function sleep (time) {
			  return new Promise((resolve) => setTimeout(resolve, time));
			}
			showTeacher("<%=choose.getProfName()%>");
			sleep(500).then(() => {
			    // Do something after the sleep
			document.getElementsByName("theme")[0].value="<%=choose.getTheme()%>";
			});
		</script>
</body>
</html>