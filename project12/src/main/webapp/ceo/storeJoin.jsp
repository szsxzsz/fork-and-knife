<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>
       <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Submit property Page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css"> 
        <link rel="stylesheet" href="assets/css/wizard.css"> 
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/css/bootstrap-select.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>
		<!-- (Optional) Latest compiled and minified JavaScript translation files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/i18n/defaults-*.min.js"></script>
		<!-- 타임피커 CDN  -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">
$(document).ready(function(){
	/* 타임피커 (안씀)  */
	$('input#timepicker').timepicker({
	    timeFormat: 'h:mm p',
	    interval: 60,
	    minTime: '9',
	    maxTime: '11:00pm',
	    defaultTime: '24',
	    startTime: '09:00',
	    dynamic: true,
	    dropdown: true,
	    scrollbar: true							
	});
	
	/* 메뉴 추가 이벤트  */
	document.getElementById("menuAdd").addEventListener("click", function(e){
	      var target = document.querySelector("#menuTable").cloneNode(true);
	      document.querySelector(".field").innerHTML += target.innerHTML;
	});

});

const form = document.querySelector('#form__wrap');
const checkAll = document.querySelector('.terms__check__all input');
const checkBoxes = document.querySelectorAll('.input__check input');
const submitButton = document.querySelector('button');

const agreements = {
  termsOfService: false,
  privacyPolicy: false,
  allowPromotions: false,
};

form.addEventListener('submit', (e) => e.preventDefault()); // 새로고침(submit) 되는 것 막음

checkBoxes.forEach((item) => item.addEventListener('input', toggleCheckbox));

function toggleCheckbox(e) {
  const { checked, id } = e.target;  
  agreements[id] = checked;
  this.parentNode.classList.toggle('active');
  checkAllStatus();
  toggleSubmitButton();
}

function checkAllStatus() {
  const { termsOfService, privacyPolicy, allowPromotions } = agreements;
  if (termsOfService && privacyPolicy && allowPromotions) {
    checkAll.checked = true;
  } else {
    checkAll.checked = false;
  }
}

function toggleSubmitButton() {
  const { termsOfService, privacyPolicy } = agreements;
  if (termsOfService && privacyPolicy) {
    submitButton.disabled = false;
  } else {
    submitButton.disabled = true;
  }
}

checkAll.addEventListener('click', (e) => {
  const { checked } = e.target;
  if (checked) {
    checkBoxes.forEach((item) => {
      item.checked = true;
      agreements[item.id] = true;
      item.parentNode.classList.add('active');
    });
  } else {
    checkBoxes.forEach((item) => {
      item.checked = false;
      agreements[item.id] = false;
      item.parentNode.classList.remove('active');
    });
  }
  toggleSubmitButton();
});

</script>

<style type="text/css">
.box {
  float: left;
  width: 33.33%;
  padding: 50px;
}
</style>
</head>
 		<!-- header  -->
 		<jsp:include page="../inc/top.jsp" />
 		<!-- header  -->
 		
        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">Submit new property</h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">
                <div class="clearfix" > 
                    <div class="wizard-container"> 
                        <div class="wizard-card ct-wizard-orange" id="wizardProperty">
                            <form action="" method="">                        
                                <div class="wizard-header">
                                    <h3>
                                        <b>Submit</b> YOUR PROPERTY <br>
                                        <small>Lorem ipsum dolor sit amet, consectetur adipisicing.</small>
                                    </h3>
                                </div>
                                <!-- 상단 tab  -->
                                <ul class="nav nav-tabs">
                                    <li class="active" style="width: 25%;"><a href="#step1" data-toggle="tab" aria-expanded="true">Step 1 </a></li>
                                    <li style="width: 25%;"><a href="#step2" data-toggle="tab">Step 2 </a></li>
                                    <li style="width: 25%;"><a href="#step3" data-toggle="tab">Step 3 </a></li>
                                    <li style="width: 25%;"><a href="#step4" data-toggle="tab">Finished </a></li>
                                </ul>
                                <!-- 상단 tab  -->
                                
								<!-- Start tab content -->
                                <div class="tab-content">
                                	<!-- Start step1 -->
                                    <div class="tab-pane" id="step1"> <!-- class="tab-pane active" 로 바꿀것  -->
	                                    <h4 class="info-text"> 기본 정보 입력 <small>(필수입력사항)</small></h4>
	<!--                                <div class="col-sm-4 col-sm-offset-1"> --> <!-- 간격 넓은 것  -->
	                                    <div class="col-sm-4">						<!-- 간격 좁은 것  -->
		                                    <!-- 가게 메인이미지 -->
		                                    <div class="picture-container">
		                                        <div class="picture">
		                                            <img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title=""/>
		                                            <input type="file" id="wizard-picture">
		                                        </div> 
		                                    </div>
		                                    <!-- 가게 메인이미지 -->
		                                    <div class="form-group">
		                                       <label>도로명주소 <sup>*</sup></label>
		                                       <input name="addr" type="text" class="form-control" placeholder="정확하게 입력해주세요" style="margin-bottom: 2%;">
		                                       <!-- 지도API -->
		                                       <div id="map" style="width:100%;height:300px;"></div>
		                                       <!-- 지도API -->
		                                    </div>
	                                    </div>
                                        <div class="col-sm-6" style="float: left;">
	                                       <div class="form-group">
                                               <label>상호명 <sup>*</sup></label>
                                               <input name="storename" type="text" class="form-control" placeholder="Fork&Knife">
                                           </div>
                                           <div class="form-group">
                                               <label>대표 전화번호 <sup>*</sup></label>
                                               <input name="tel" type="tel" class="form-control" placeholder="051-0000-0000">
                                           </div> 
                                           <div class="form-group">
                                               <label>사업자등록번호 <sup>*</sup></label>
                                               <input name="license" type="text" class="form-control" placeholder="숫자만 기입해주세요">
                                           </div>
                                           <div class="form-group" id="select">
	                                          <label>업종 <sup>*</sup>&nbsp;</label> <!-- data-live-search-style="begins" -->
                                              <select class="selectpicker"> <!-- 간격줄일것 -->
                                              	<option value="kor">한식</option>
                                              	<option value="jap">일식</option>
                                              	<option value="ch">중식</option>
                                              	<option value="am">양식</option>
                                              	<option value="oma">오마카세</option>
                                              </select>
                                           </div>
                                           <div class="form-group" >
											<fieldset>
											<label>영업시간 <sup>*</sup></label><hr style="margin-top: 5px; margin-bottom: 10px;">
                                      			<div class="col-sm-6">
	                                             	<label for="open" style="color: gray; font-size: 14px;">오픈시간</label>
		                                            <input name="hours" id="open" type="time" class="form-control">
	                                          	</div>
                                           		<div class="col-sm-6">
	                                            	<label for="close" style="color: gray; font-size: 14px;">마감시간</label>
	                                            	<input name="hours" id="close" type="time" class="form-control">
	                                          	</div>
	                                        </fieldset>
	                                        </div>
                                        </div>
                                    </div>
                                    <!--  End step 1 -->

                                    <!--  Start step 2 -->
                                    <div class="tab-pane" id="step2"> <!-- active 없앨 것 -->
                                        <h4 class="info-text"> 상세 정보 입력<small>(선택입력사항)</small> </h4>
                                        <div class="col-sm-12"> 
	                                        <div class="col-sm-4">
		                                        <div class="picture-container">
		                                            <div class="picture">
		                                                <img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title=""/>
		                                                <input type="file" id="wizard-picture">
		                                            </div> 
		                                        </div>
		                                    </div>
	                                        <div class="col-sm-4"> 
	                                            <div class="form-group">
	                                                <label>식당소개글 :</label>
	                                                <textarea name="discrition" class="form-control" rows="12"></textarea>
	                                            </div> 
	                                        </div>
	                                        <div class="col-sm-4">
	                                        <label>&nbsp;&nbsp;&nbsp;&nbsp;편의시설 <small>(해당항목 선택)</small></label>
                                        	<div class="form-group">
                                               	<div class="checkbox">
                                                    <label>
                                                        <input type="checkbox"  class="padding-bottom-15"> 주차 가능
                                                        	<input type="text" class="form-control" placeholder="상세정보(선택)">
                                                    </label>
                                                </div>
                                             </div>
                                           	 <div class="form-group">
                                                   <div class="checkbox">
                                                       <label>
                                                           <input type="checkbox" class="padding-bottom-15"> 반려동물 동반
                                                           <input type="text" class="form-control" placeholder="상세정보(선택)">
                                                       </label>
                                                   </div>
                                              </div>
                                              <div class="form-group">
                                                   <div class="checkbox">
                                                       <label>
                                                           <input type="checkbox"> 키즈존
                                                           <input type="text" class="form-control" placeholder="상세정보(선택)">
                                                       </label>
                                                   </div>
                                               </div>
                                               <div class="form-group">
                                                   <div class="checkbox">
                                                       <label>
                                                           <input type="checkbox"> 콜키지 서비스
                                                           <input type="text" class="form-control" placeholder="상세정보(선택)" >
                                                       </label>
                                                   </div>
                                                </div>
                                                <div class="form-group">
                                                   <div class="checkbox">
                                                       <label>
                                                           <input type="checkbox"> 대관 서비스
                                                           <input type="text" class="form-control" placeholder="상세정보(선택)" >
                                                       </label>
                                                   </div>
                                                 </div>
                                            </div>
                                    	</div>
	                                </div> <br>
                                    <!-- End step 2 -->

                                    <!-- Start step 3 -->
                                    <div class="tab-pane" id="step3">                                        
                                        <h4 class="info-text">메뉴 등록 </h4>
                                   	<!-- <div class="col-sm-6">
	                                        <div class="col-sm-4 col-sm-offset-1">
		                                        <div class="picture-container"> 메뉴에 들어갈 메뉴판, 음식사진(선택)
		                                            <div class="picture">
		                                                <img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title=""/>
		                                                <input type="file" id="wizard-picture">
		                                            </div> 
		                                        </div>
		                                    </div>
                                          </div> -->
                                            <div class="col-sm-6 col-sm-offset-1"> <!-- 메뉴와 사진을 추가 버튼을 통해 추가할 수 있도록 할 것 -->
	                                            	<div class="pull-right">
	                                            		<input type="button" value="메뉴 항목 추가" class="btn btn-next btn-primary" id="menuAdd">
	                                            	</div>
	                                            <div class="form-group" id="menuTable">
	                                            	<table border="1" style="border: 1px #DADADA; line-height: 3.5; width: 100%; height: 44px; padding: 6px 12px; color: #838383; box-shadow: 0px 1px 1px rgb(179 179 179 / 10%) inset;
    													transition: border-color 0.15s ease-in-out 0s, box-shadow 0.15s ease-in-out 0s; text-align: center; "> 
		                                            	<tr>
		                                            		<td><b>메뉴명</b></td>
		                                            		<td><input type="text" name="menu"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>가격</b></td>
		                                            		<td><input type="text" name="price"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>메뉴설명</b></td>
		                                            		<td><input type="text" name="content"></td>
		                                            	</tr>
		                                            	<tr>
		                                            		<td><b>이미지</b></td>
		                                            		<td><input type="file" name="image"></td>
		                                            	</tr>
	                                            	</table>
		                                            <div class="col-sm-4" style="float: right;">
		                                            	<input type="button" value="삭제" class= "btn btn-next btn-primary" style="background: #DADADA; border: #DADADA; color: #1C1A18;" >
		                                            </div>
		                                            <div class="col-sm-4"  style="float: right;">
		                                            	<input type="button" value="저장" class="btn btn-next btn-primary" style="background: #DADADA; border: #DADADA; color: #1C1A18; margin-bottom: 2%;">
		                                            </div>
	                                        	</div>
	                                        	<!-- 메뉴 추가 위치 -->
	                                            <div class="field"></div>
	                                        	<!-- 메뉴 추가 위치 -->
	                                        </div>
	                                            <div class="col-sm-4">
	                                                <div class="form-group">
	                                                    <label for="property-video">Property video :</label>
	                                                    <input class="form-control" value="" placeholder="http://www.youtube.com, http://vimeo.com" name="property_video" type="text">
	                                                </div> 
	
	                                                <div class="form-group">
	                                                    <input class="form-control" value="" placeholder="http://www.youtube.com, http://vimeo.com" name="property_video" type="text">
	                                                </div>
	
	                                                <div class="form-group">
	                                                    <input class="form-control" value="" placeholder="http://www.youtube.com, http://vimeo.com" name="property_video" type="text">
	                                                </div>
                                                </div>
                                            <!-- </div> -->
                                       <!--  </div> -->
                                        <!-- </div>
                                        </div> -->
                                    </div> <br>
                                    <!--  End step 3 -->


                                    <div class="tab-pane  active" id="step4">                                        
                                        <h4 class="info-text"> Finished and submit </h4>
                                        <div class="row">  
                                            <div class="col-sm-12">
                                                <div class="">
                                                    <p>
                                                        <label>Fork&Knife's <strong>이용 약관</strong></label>
                                                        Fork&Knife에 사업자번호 등 개인정보가 포함된 콘텐츠가 사용될 수 있으며,<br>
                                                        귀하의 개인 정보를 수집, 사용 및 공개하는데 동의합니다.
                                                        By accessing or using  GARO ESTATE services, such as 
                                                        posting your property advertisement with your personal 
                                                        information on our website you agree to the
                                                        collection, use and disclosure of your personal information 
                                                        in the legal proper manner
                                                    </p>
													<%-- <jsp:include page="../ceo/termsConditions.jsp"/> --%>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" /> <strong>Accept termes and conditions.</strong>
                                                        </label>
                                                    </div> 

                                                </div> 
                                            </div>
                                        </div>
                                    </div>
                                    <!--  End step 4 -->

                                </div>
                                <!-- End Tab Contents  -->

                                <div class="wizard-footer" style="clear: both;">
                                    <div class="pull-right">
                                        <input type='button' class='btn btn-next btn-primary' name='next' value='Next' />
                                        <input type='button' class='btn btn-finish btn-primary ' name='finish' value='Finish' />
                                    </div>

                                    <div class="pull-left">
                                        <input type='button' class='btn btn-previous btn-default' name='previous' value='Previous' />
                                    </div>
                                    <div class="clearfix"></div>                                            
                                </div>	
                            </form>
                        </div>
                        <!-- End submit form -->
                    </div> 
                </div>
            </div>
        </div>
        </div>

    <!-- Footer area-->
	<jsp:include page="../inc/bottom.jsp"/>
    <!-- Footer area-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1900efb9ff28bb0a54c68c9b272a9b10&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(35.1584134149369, 129.0620342646736), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('부산광역시 부산진구 동천로 109 삼한골든게이트 7층', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">상호명 받아와서 기입되도록 할 것</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		}); 
	</script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
    </body>
</html>