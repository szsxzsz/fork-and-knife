<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>GARO ESTATE | Property  page</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        
    
	<jsp:include page="../inc/top.jsp" />

        <div class="page-head"> 
            <div class="container">
                <div class="row">
                    <div class="page-head-content">
                        <h1 class="page-title">Store Details </h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header -->

        <!-- property area -->
        <div class="content-area single-property" style="background-color: #FCFCFC;">
            <div class="container">

                <div class="clearfix padding-top-40">
                    <div class="col-md-8 single-property-content ">
                        <div class="row">
                            <div class="light-slide-item">            
                                <div class="clearfix">
                                    <div class="favorite-and-print">
                                        <a class="add-to-fav" href="#login-modal" data-toggle="modal">
                                            <i class="fa fa-star-o"></i>
                                        </a>
                                        <a class="printer-icon " href="javascript:window.print()">
                                            <i class="fa fa-print"></i> 
                                        </a>
                                    </div> 

                                    <ul id="image-gallery" class="gallery list-unstyled cS-hidden">
                                        <li data-thumb="assets/img/property-1/property1.jpg"> 
                                            <img src="assets/img/property-1/property1.jpg" />
                                        </li>
                                        <li data-thumb="img/property-1/property2.jpg"> 
                                            <img src="assets/img/property-1/property3.jpg" />
                                        </li>
                                        <li data-thumb="assets/img/property-1/property3.jpg"> 
                                            <img src="assets/img/property-1/property3.jpg" />
                                        </li>
                                        <li data-thumb="assets/img/property-1/property4.jpg"> 
                                            <img src="assets/img/property-1/property4.jpg" />
                                        </li>                                         
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="single-property-wrapper">
                            <div class="single-property-header">                                          
                                <h1 class="property-title pull-left">Facilities</h1>
                            </div>

                            <div class="property-meta entry-meta clearfix ">   

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-tag">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill-rule="evenodd" clip-rule="evenodd" fill="#1C1A18" d="M47.199 24.176l-23.552-23.392c-.504-.502-1.174-.778-1.897-.778l-19.087.09c-.236.003-.469.038-.696.1l-.251.1-.166.069c-.319.152-.564.321-.766.529-.497.502-.781 1.196-.778 1.907l.092 19.124c.003.711.283 1.385.795 1.901l23.549 23.389c.221.218.482.393.779.523l.224.092c.26.092.519.145.78.155l.121.009h.012c.239-.003.476-.037.693-.098l.195-.076.2-.084c.315-.145.573-.319.791-.539l18.976-19.214c.507-.511.785-1.188.781-1.908-.003-.72-.287-1.394-.795-1.899zm-35.198-9.17c-1.657 0-3-1.345-3-3 0-1.657 1.343-3 3-3 1.656 0 2.999 1.343 2.999 3 0 1.656-1.343 3-2.999 3z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">주차정보</span>
                                        <span class="property-info-value">For Sale</span>
                                    </span>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info icon-area">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#1C1A18" d="M46 16v-12c0-1.104-.896-2.001-2-2.001h-12c0-1.103-.896-1.999-2.002-1.999h-11.997c-1.105 0-2.001.896-2.001 1.999h-12c-1.104 0-2 .897-2 2.001v12c-1.104 0-2 .896-2 2v11.999c0 1.104.896 2 2 2v12.001c0 1.104.896 2 2 2h12c0 1.104.896 2 2.001 2h11.997c1.106 0 2.002-.896 2.002-2h12c1.104 0 2-.896 2-2v-12.001c1.104 0 2-.896 2-2v-11.999c0-1.104-.896-2-2-2zm-4.002 23.998c0 1.105-.895 2.002-2 2.002h-31.998c-1.105 0-2-.896-2-2.002v-31.999c0-1.104.895-1.999 2-1.999h31.998c1.105 0 2 .895 2 1.999v31.999zm-5.623-28.908c-.123-.051-.256-.078-.387-.078h-11.39c-.563 0-1.019.453-1.019 1.016 0 .562.456 1.017 1.019 1.017h8.935l-20.5 20.473v-8.926c0-.562-.455-1.017-1.018-1.017-.564 0-1.02.455-1.02 1.017v11.381c0 .562.455 1.016 1.02 1.016h11.39c.562 0 1.017-.454 1.017-1.016 0-.563-.455-1.019-1.017-1.019h-8.933l20.499-20.471v8.924c0 .563.452 1.018 1.018 1.018.561 0 1.016-.455 1.016-1.018v-11.379c0-.132-.025-.264-.076-.387-.107-.249-.304-.448-.554-.551z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">반려동물</span>
                                        <span class="property-info-value">3500<b class="property-info-unit">Sq Ft</b></span>
                                    </span>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bed">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#1C1A18" d="M21 48.001h-19c-1.104 0-2-.896-2-2v-31c0-1.104.896-2 2-2h19c1.106 0 2 .896 2 2v31c0 1.104-.895 2-2 2zm0-37.001h-19c-1.104 0-2-.895-2-1.999v-7.001c0-1.104.896-2 2-2h19c1.106 0 2 .896 2 2v7.001c0 1.104-.895 1.999-2 1.999zm25 37.001h-19c-1.104 0-2-.896-2-2v-31c0-1.104.896-2 2-2h19c1.104 0 2 .896 2 2v31c0 1.104-.896 2-2 2zm0-37.001h-19c-1.104 0-2-.895-2-1.999v-7.001c0-1.104.896-2 2-2h19c1.104 0 2 .896 2 2v7.001c0 1.104-.896 1.999-2 1.999z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">키즈존/노키즈존</span>
                                        <span class="property-info-value">3</span>
                                    </span>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-bath">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#1C1A18" d="M37.003 48.016h-4v-3.002h-18v3.002h-4.001v-3.699c-4.66-1.65-8.002-6.083-8.002-11.305v-4.003h-3v-3h48.006v3h-3.001v4.003c0 5.223-3.343 9.655-8.002 11.305v3.699zm-30.002-24.008h-4.001v-17.005s0-7.003 8.001-7.003h1.004c.236 0 7.995.061 7.995 8.003l5.001 4h-14l5-4-.001.01.001-.009s.938-4.001-3.999-4.001h-1s-4 0-4 3v17.005000000000003h-.001z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">대관</span>
                                        <span class="property-info-value">3.5</span>
                                    </span>
                                </div>

                                <div class="col-xs-3 col-sm-3 col-md-3 p-b-15">
                                    <span class="property-info-icon icon-garage">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 48 48">
                                        <path class="meta-icon" fill="#1C1A18" d="M44 0h-40c-2.21 0-4 1.791-4 4v44h6v-40c0-1.106.895-2 2-2h31.999c1.106 0 2.001.895 2.001 2v40h6v-44c0-2.209-1.792-4-4-4zm-36 8.001h31.999v2.999h-31.999zm0 18h6v5.999h-2c-1.104 0-2 .896-2 2.001v6.001c0 1.103.896 1.998 2 1.998h2v2.001c0 1.104.896 2 2 2s2-.896 2-2v-2.001h11.999v2.001c0 1.104.896 2 2.001 2 1.104 0 2-.896 2-2v-2.001h2c1.104 0 2-.895 2-1.998v-6.001c0-1.105-.896-2.001-2-2.001h-2v-5.999h5.999v-3h-31.999v3zm8 12.999c-1.104 0-2-.895-2-1.999s.896-2 2-2 2 .896 2 2-.896 1.999-2 1.999zm10.5 2h-5c-.276 0-.5-.225-.5-.5 0-.273.224-.498.5-.498h5c.275 0 .5.225.5.498 0 .275-.225.5-.5.5zm1-2h-7c-.275 0-.5-.225-.5-.5s.226-.499.5-.499h7c.275 0 .5.224.5.499s-.225.5-.5.5zm-6.5-2.499c0-.276.224-.5.5-.5h5c.275 0 .5.224.5.5s-.225.5-.5.5h-5c-.277 0-.5-.224-.5-.5zm11 2.499c-1.104 0-2.001-.895-2.001-1.999s.896-2 2.001-2c1.104 0 2 .896 2 2s-.896 1.999-2 1.999zm0-12.999v5.999h-16v-5.999h16zm-24-13.001h31.999v3h-31.999zm0 5h31.999v3h-31.999z"></path>
                                        </svg>
                                    </span>
                                    <span class="property-info-entry">
                                        <span class="property-info-label">콜키지</span>
                                        <span class="property-info-value">2</span>
                                    </span>
                                </div>


                            </div>
                           
                            <!-- 가게 추가 정보 -->

                            <div class="section additional-details">

                                <h4 class="s-property-title">I N F O R M A T I O N</h4>

                                <ul class="additional-details-list clearfix">
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">반려동물</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Yes</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">키즈/노키즈존</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">no</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Parking</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">2 Or More Spaces,Covered Parking,Valet Parking</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Waterfront</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Yes</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">View</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Intracoastal View,Direct ew</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">Waterfront Description:</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">Intracoastal Front,Ocean Access</span>
                                    </li> 

                                </ul>
                            </div>  
                            
                            <!-- 메뉴  -->
                            <div class="section additional-details">

                                <h4 class="s-property-title">M E N U</h4>

                                <ul class="additional-details-list clearfix">
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">갈비</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">50600500</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">스테이크</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">13115215</span>
                                    </li>
                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">라면</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">21511</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">김밥</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">5000</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">단무지</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">100000000000</span>
                                    </li>

                                    <li>
                                        <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">김치</span>
                                        <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">50000</span>
                                    </li> 

                                </ul>
                            </div> <br>
                            <!-- End additional-details area  -->

                           
                            <!-- End features area  -->

                         
                                <h4 class="s-property-title">M A P </h4>
							<!--  지도 api -->
							<div id="map" style="width: 730px; height: 400px;"></div>
							
						
						
                            <!-- 리뷰/QnA 토글  -->
                            <div class="review">
                            
                            
                            
                            </div>
                            
                        </div>
                    </div>

                    <div class="col-md-4 p0">
                        <aside class="sidebar sidebar-property blog-asside-right">
                            <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="">
                                                    <img src="assets/img/octocat.png" class="img-circle">
                                                </a>
                                            </div>
                                            <br>
                                            <div class="col-xs-8 col-sm-8 ">
                                                <h3 class="dealer-name">
                                                  <p style="font-size:30px;">
													 <b>지 원 스 시</b></p>
                                                        
                                                </h3>
                                               

                                            </div>
                                        </div>

                                        <div class="clear">
                                            <ul class="dealer-contacts">                                       
                                                <li><i class="pe-7s-map-marker strong"> </i> MAP url</li>
                                                <li><i class="pe-7s-mail strong"> </i>Store Email</li>
                                                <li><i class="pe-7s-call strong"> </i> Store Tel :  </li>
                                            </ul>
                                            <p> 가게 상세정보 db에 잇는거</p>
                                        </div>

                                    </div>
                                </div>
                            </div>
        <!--  가게 검색 기능-->
		<div class="panel panel-default sidebar-menu wow fadeInRight animated" >
           <div class="panel-heading">
               <h3 class="panel-title">- S T O R E * S E A R C H -</h3>
           </div>
           <div class="panel-body search-widget">
               <form action="" class=" form-inline"> 
                   <fieldset>
                       <div class="row">
                           <div class="col-xs-12">
                               <input type="text" class="form-control" placeholder="Key word">
                           </div>
                       </div>
                   </fieldset>

                   <fieldset>
                       <div class="row">
                           <div class="col-xs-6">

                               <select id="lunchBegins" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select Your Menu">

                                   <option>New york, CA</option>
                                   <option>Paris</option>
                                   <option>Casablanca</option>
                                   <option>Tokyo</option>
                                   <option>Marraekch</option>
                                   <option>kyoto , shibua</option>
                               </select>
                           </div>
                           <div class="col-xs-6">

                               <select id="basic" class="selectpicker show-tick form-control">
                                   <option> -Status- </option>
                                   <option>가능 </option>
                                   <option>예약중</option>
                                   <option></option>  

                               </select>
                           </div>
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6">
                               <label for="price-range">Price range ($):</label>
                               <input type="text" class="span2" value="" data-slider-min="0" 
                                      data-slider-max="600" data-slider-step="5" 
                                      data-slider-value="[0,450]" id="price-range" ><br />
                               <b class="pull-left color">2000$</b> 
                               <b class="pull-right color">100000$</b>                                                
                           </div>
                           <div class="col-xs-6">
                               <label for="property-geo">Property geo (m2) :</label>
                               <input type="text" class="span2" value="" data-slider-min="0" 
                                      data-slider-max="600" data-slider-step="5" 
                                      data-slider-value="[50,450]" id="property-geo" ><br />
                               <b class="pull-left color">40m</b> 
                               <b class="pull-right color">12000m</b>                                                
                           </div>                                            
                       </div>
                   </fieldset>                                

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6">
                               <label for="price-range">Min baths :</label>
                               <input type="text" class="span2" value="" data-slider-min="0" 
                                      data-slider-max="600" data-slider-step="5" 
                                      data-slider-value="[250,450]" id="min-baths" ><br />
                               <b class="pull-left color">1</b> 
                               <b class="pull-right color">120</b>                                                
                           </div>

                           <div class="col-xs-6">
                               <label for="property-geo">Min bed :</label>
                               <input type="text" class="span2" value="" data-slider-min="0" 
                                      data-slider-max="600" data-slider-step="5" 
                                      data-slider-value="[250,450]" id="min-bed" ><br />
                               <b class="pull-left color">1</b> 
                               <b class="pull-right color">120</b>

                           </div>
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6">
                               <div class="checkbox">
                                   <label> <input type="checkbox" checked> Fire Place</label>
                               </div> 
                           </div>

                           <div class="col-xs-6">
                               <div class="checkbox">
                                   <label> <input type="checkbox"> Dual Sinks</label>
                               </div>
                           </div>                                            
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label> <input type="checkbox" checked> Swimming Pool</label>
                               </div>
                           </div>  
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label> <input type="checkbox" checked> 2 Stories </label>
                               </div>
                           </div>  
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label><input type="checkbox"> Laundry Room </label>
                               </div>
                           </div>  
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label> <input type="checkbox"> Emergency Exit</label>
                               </div>
                           </div>  
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label>  <input type="checkbox" checked> Jog Path </label>
                               </div>
                           </div>  
                           <div class="col-xs-6"> 
                               <div class="checkbox">
                                   <label>  <input type="checkbox"> 26' Ceilings </label>
                               </div>
                           </div>  
                       </div>
                   </fieldset>

                   <fieldset class="padding-5">
                       <div class="row">
                           <div class="col-xs-12"> 
                               <div class="checkbox">
                                   <label>  <input type="checkbox"> Hurricane Shutters </label>
                               </div>
                           </div>  
                       </div>
                   </fieldset>

                   <fieldset >
                       <div class="row">
                           <div class="col-xs-12">  
                               <input class="button btn largesearch-btn" value="Search" type="submit">
                           </div>  
                       </div>
                   </fieldset>                                     
               </form>
           </div>
       </div>

                            <div class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated">
                                <div class="panel-heading">
                                    <h3 class="panel-title">FK가 추천하는 메뉴!</h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <ul>
                                        <li>
                                            <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                <a href="single.html"><img src="assets/img/demo/small-property-2.jpg"></a>
                                                <span class="property-seeker">
                                                    <b class="b-1">A</b>
                                                    <b class="b-2">S</b>
                                                </span>
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                <h6> <a href="single.html">Super nice villa </a></h6>
                                                <span class="property-price">3000000$</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col-md-3 col-sm-3  col-xs-3 blg-thumb p0">
                                                <a href="single.html"><img src="assets/img/demo/small-property-1.jpg"></a>
                                                <span class="property-seeker">
                                                    <b class="b-1">A</b>
                                                    <b class="b-2">S</b>
                                                </span>
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                <h6> <a href="single.html">Super nice villa </a></h6>
                                                <span class="property-price">3000000$</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                <a href="single.html"><img src="assets/img/demo/small-property-3.jpg"></a>
                                                <span class="property-seeker">
                                                    <b class="b-1">A</b>
                                                    <b class="b-2">S</b>
                                                </span>
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                <h6> <a href="single.html">Super nice villa </a></h6>
                                                <span class="property-price">3000000$</span>
                                            </div>
                                        </li>

                                        <li>
                                            <div class="col-md-3 col-sm-3 col-xs-3 blg-thumb p0">
                                                <a href="single.html"><img src="assets/img/demo/small-property-2.jpg"></a>
                                                <span class="property-seeker">
                                                    <b class="b-1">A</b>
                                                    <b class="b-2">S</b>
                                                </span>
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry">
                                                <h6> <a href="single.html">Super nice villa </a></h6>
                                                <span class="property-price">3000000$</span>
                                            </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>



                            <div class="panel panel-default sidebar-menu wow fadeInRight animated">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Ads her  </h3>
                                </div>
                                <div class="panel-body recent-property-widget">
                                    <img src="assets/img/ads.jpg">
                                </div>
                            </div>

                            


                        </aside>
                    </div>
                </div>

            </div>
        </div>

        <!-- Footer area-->
      <jsp:include page="../inc/bottom.jsp" />
      
	<!-- 지도 api-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	</script>
	
	<!-- 지도 라이브러리 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c&libraries=LIBRARY"></script>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=460a67a3e3effe9faae64573339c5d3c&libraries=services,clusterer,drawing"></script>

        

        <script>
	         $(document).ready(function () {
	
	             $('#image-gallery').lightSlider({
	                 gallery: true,
	                 item: 1,
	                 thumbItem: 9,
	                 slideMargin: 0,
	                 speed: 500,
	                 auto: true,
	                 loop: true,
	                 onSliderLoad: function () {
	                     $('#image-gallery').removeClass('cS-hidden');
	                 }
	             });
	         });
        </script>

    </body>
</html>