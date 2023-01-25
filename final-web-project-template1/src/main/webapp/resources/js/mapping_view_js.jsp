<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				
				
				
				<script>		
				$(function (){
					$("#btn_toggle").click(function (){
				  	$("#Toggle").slideToggle();
				  });

				
				});
				
				$(function (){
					$("#btn_toggle1").click(function (){
				  	$("#Toggle1").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle2").click(function (){
				  	$("#Toggle2").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle3").click(function (){
				  	$("#Toggle3").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle4").click(function (){
				  	$("#Toggle4").toggle();
				  });
				});
				
// 				사원버튼 기준
				function selectPEmp(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMPEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMPAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				사원버튼 기준끝
				
// 				대리버튼 기준
				function selectPAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMADM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				대리버튼 기준끝

// 				과장버튼 기준
				function selectPSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				과장버튼 기준 끝

// 				차장버튼 기준
				function selectPAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				function AGMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				차장버튼 기준끝

// 				부장버튼 기준		
				function selectPDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				function DMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				부장버튼 기준끝				
				
// 				옵션				

				$(document).ready(function(){
// 				사원 기준
					  // 동급 제외
					  $("#EMPsame").click(function(){
							
							if(this.checked){
								$(".EMPPEMP").prop("disabled",true);
							}
							else{
								$(".EMPPEMP").prop("disabled",false);
							}
						});
					    
					  // 상급자 제외
					  $("#EMPhigher").click(function(){
							
							if(this.checked){
								$(".EMPPAM").prop("disabled",true);
								$(".EMPPAGM").prop("disabled",true);
								$(".EMPPSM").prop("disabled",true);
								$(".EMPPDM").prop("disabled",true);
							
							}
							else{
								$(".EMPPAM").prop("disabled",false);
								$(".EMPPAGM").prop("disabled",false);
								$(".EMPPSM").prop("disabled",false);
								$(".EMPPDM").prop("disabled",false);
							}
						});
		
// 				사원 기준 끝

// 				대리 기준
					  // 동급 제외
					  $("#AMsame").click(function(){
							
							if(this.checked){
								$(".AMPAM").prop("disabled",true);
							}
							else{
								$(".AMPAM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#AMlower").click(function(){
							
							if(this.checked){
								$(".AMPEMP").prop("disabled",true);				
							}
							else{
								$(".AMPEMP").prop("disabled",false);
							}
					   });
					    
					  // 상급자 제외
					  $("#AMhigher").click(function(){
							
							if(this.checked){
								$(".AMPAGM").prop("disabled",true);
								$(".AMPSM").prop("disabled",true);
								$(".AMPDM").prop("disabled",true);
							
							}
							else{
								$(".AMPAGM").prop("disabled",false);
								$(".AMPSM").prop("disabled",false);
								$(".AMPDM").prop("disabled",false);
							}
						});
// 				대리 기준 끝

// 				과장 기준
					  // 동급 제외
					  $("#SMsame").click(function(){
							
							if(this.checked){
								$(".SMPSM").prop("disabled",true);
							}
							else{
								$(".SMPSM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#SMlower").click(function(){
							
							if(this.checked){
								$(".SMPEMP").prop("disabled",true);				
								$(".SMPAM").prop("disabled",true);				
							}
							else{
								$(".SMPEMP").prop("disabled",false);
								$(".SMPAM").prop("disabled",false);
							}
						});
					
					  // 상급자 제외
					  $("#SMhigher").click(function(){
							
							if(this.checked){
								$(".SMPAGM").prop("disabled",true);
								$(".SMPDM").prop("disabled",true);
							
							}
							else{
								$(".SMPAGM").prop("disabled",false);
								$(".SMPDM").prop("disabled",false);
							}
						});
// 				과장 기준 끝

// 				차장 기준
					  // 동급 제외
					  $("#AGMsame").click(function(){
							
							if(this.checked){
								$(".AGMPAGM").prop("disabled",true);
							}
							else{
								$(".AGMPAGM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#AGMlower").click(function(){
							
							if(this.checked){
								$(".AGMPEMP").prop("disabled",true);				
								$(".AGMPAM").prop("disabled",true);				
								$(".AGMPSM").prop("disabled",true);				
							}
							else{
								$(".AGMPEMP").prop("disabled",false);
								$(".AGMPAM").prop("disabled",false);
								$(".AGMPSM").prop("disabled",false);
							}
					   });
					    
					  // 상급자 제외
					  $("#AGMhigher").click(function(){
							
							if(this.checked){
								$(".AGMPDM").prop("disabled",true);
							}
							else{
								$(".AGMPDM").prop("disabled",false);
							}
						});
// 				차장 기준 끝

// 				부장 기준
					  // 동급 제외
					  $("#DMsame").click(function(){
							
							if(this.checked){
								$(".DMPDM").prop("disabled",true);
							}
							else{
								$(".DMPDM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#DMlower").click(function(){
							
							if(this.checked){
								$(".DMPEMP").prop("disabled",true);				
								$(".DMPAM").prop("disabled",true);				
								$(".DMPSM").prop("disabled",true);				
								$(".DMPAGM").prop("disabled",true);				
							}
							else{
								$(".DMPEMP").prop("disabled",false);
								$(".DMPAM").prop("disabled",false);
								$(".DMPSM").prop("disabled",false);
								$(".DMPAGM").prop("disabled",false);
							}
						});
					   });
// 				부장 기준 끝				    
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				
				
				
				<script>		
				$(function (){
					$("#btn_toggle").click(function (){
				  	$("#Toggle").slideToggle();
				  });

				
				});
				
				$(function (){
					$("#btn_toggle1").click(function (){
				  	$("#Toggle1").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle2").click(function (){
				  	$("#Toggle2").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle3").click(function (){
				  	$("#Toggle3").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle4").click(function (){
				  	$("#Toggle4").toggle();
				  });
				});
				
// 				사원버튼 기준
				function selectPEmp(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMPEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMPAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				사원버튼 기준끝
				
// 				대리버튼 기준
				function selectPAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMADM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				대리버튼 기준끝

// 				과장버튼 기준
				function selectPSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				과장버튼 기준 끝

// 				차장버튼 기준
				function selectPAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				function AGMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				차장버튼 기준끝

// 				부장버튼 기준		
				function selectPDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				function DMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				부장버튼 기준끝				
				
// 				옵션				

				$(document).ready(function(){
// 				사원 기준
					  // 동급 제외
					  $("#EMPsame").click(function(){
							
							if(this.checked){
								$(".EMPPEMP").prop("disabled",true);
							}
							else{
								$(".EMPPEMP").prop("disabled",false);
							}
						});
					    
					  // 상급자 제외
					  $("#EMPhigher").click(function(){
							
							if(this.checked){
								$(".EMPPAM").prop("disabled",true);
								$(".EMPPAGM").prop("disabled",true);
								$(".EMPPSM").prop("disabled",true);
								$(".EMPPDM").prop("disabled",true);
							
							}
							else{
								$(".EMPPAM").prop("disabled",false);
								$(".EMPPAGM").prop("disabled",false);
								$(".EMPPSM").prop("disabled",false);
								$(".EMPPDM").prop("disabled",false);
							}
						});
		
// 				사원 기준 끝

// 				대리 기준
					  // 동급 제외
					  $("#AMsame").click(function(){
							
							if(this.checked){
								$(".AMPAM").prop("disabled",true);
							}
							else{
								$(".AMPAM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#AMlower").click(function(){
							
							if(this.checked){
								$(".AMPEMP").prop("disabled",true);				
							}
							else{
								$(".AMPEMP").prop("disabled",false);
							}
					   });
					    
					  // 상급자 제외
					  $("#AMhigher").click(function(){
							
							if(this.checked){
								$(".AMPAGM").prop("disabled",true);
								$(".AMPSM").prop("disabled",true);
								$(".AMPDM").prop("disabled",true);
							
							}
							else{
								$(".AMPAGM").prop("disabled",false);
								$(".AMPSM").prop("disabled",false);
								$(".AMPDM").prop("disabled",false);
							}
						});
// 				대리 기준 끝

// 				과장 기준
					  // 동급 제외
					  $("#SMsame").click(function(){
							
							if(this.checked){
								$(".SMPSM").prop("disabled",true);
							}
							else{
								$(".SMPSM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#SMlower").click(function(){
							
							if(this.checked){
								$(".SMPEMP").prop("disabled",true);				
								$(".SMPAM").prop("disabled",true);				
							}
							else{
								$(".SMPEMP").prop("disabled",false);
								$(".SMPAM").prop("disabled",false);
							}
						});
					
					  // 상급자 제외
					  $("#SMhigher").click(function(){
							
							if(this.checked){
								$(".SMPAGM").prop("disabled",true);
								$(".SMPDM").prop("disabled",true);
							
							}
							else{
								$(".SMPAGM").prop("disabled",false);
								$(".SMPDM").prop("disabled",false);
							}
						});
// 				과장 기준 끝

// 				차장 기준
					  // 동급 제외
					  $("#AGMsame").click(function(){
							
							if(this.checked){
								$(".AGMPAGM").prop("disabled",true);
							}
							else{
								$(".AGMPAGM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#AGMlower").click(function(){
							
							if(this.checked){
								$(".AGMPEMP").prop("disabled",true);				
								$(".AGMPAM").prop("disabled",true);				
								$(".AGMPSM").prop("disabled",true);				
							}
							else{
								$(".AGMPEMP").prop("disabled",false);
								$(".AGMPAM").prop("disabled",false);
								$(".AGMPSM").prop("disabled",false);
							}
					   });
					    
					  // 상급자 제외
					  $("#AGMhigher").click(function(){
							
							if(this.checked){
								$(".AGMPDM").prop("disabled",true);
							}
							else{
								$(".AGMPDM").prop("disabled",false);
							}
						});
// 				차장 기준 끝

// 				부장 기준
					  // 동급 제외
					  $("#DMsame").click(function(){
							
							if(this.checked){
								$(".DMPDM").prop("disabled",true);
							}
							else{
								$(".DMPDM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#DMlower").click(function(){
							
							if(this.checked){
								$(".DMPEMP").prop("disabled",true);				
								$(".DMPAM").prop("disabled",true);				
								$(".DMPSM").prop("disabled",true);				
								$(".DMPAGM").prop("disabled",true);				
							}
							else{
								$(".DMPEMP").prop("disabled",false);
								$(".DMPAM").prop("disabled",false);
								$(".DMPSM").prop("disabled",false);
								$(".DMPAGM").prop("disabled",false);
							}
						});
					   });
// 				부장 기준 끝				    
>>>>>>> branch 'master' of https://github.com/jintaeki/final_ppp_survey.git
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
				
				
				
				<script>		
				$(function (){
					$("#btn_toggle").click(function (){
				  	$("#Toggle").slideToggle();
				  });

				
				});
				
				$(function (){
					$("#btn_toggle1").click(function (){
				  	$("#Toggle1").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle2").click(function (){
				  	$("#Toggle2").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle3").click(function (){
				  	$("#Toggle3").toggle();
				  });
				});
				
				$(function (){
					$("#btn_toggle4").click(function (){
				  	$("#Toggle4").toggle();
				  });
				});
				
// 				사원버튼 기준
				function selectPEmp(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMPEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMPAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMPDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('EMP_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				사원버튼 기준끝
				
// 				대리버튼 기준
				function selectPAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AMADM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				대리버튼 기준끝

// 				과장버튼 기준
				function selectPSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function SMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('SM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				과장버튼 기준 끝

// 				차장버튼 기준
				function selectPAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				function AGMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function AGMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('AGM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				차장버튼 기준끝

// 				부장버튼 기준		
				function selectPDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMEMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_EMP');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				function DMAM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_AM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMSM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_SM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMAGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_AGM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function DMDM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('DM_DM');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				부장버튼 기준끝				
				
// 				옵션				

				$(document).ready(function(){
// 				사원 기준
					  // 동급 제외
					  $("#EMPsame").click(function(){
							
							if(this.checked){
								$(".EMPPEMP").prop("disabled",true);
							}
							else{
								$(".EMPPEMP").prop("disabled",false);
							}
						});
					    
					  // 상급자 제외
					  $("#EMPhigher").click(function(){
							
							if(this.checked){
								$(".EMPPAM").prop("disabled",true);
								$(".EMPPAGM").prop("disabled",true);
								$(".EMPPSM").prop("disabled",true);
								$(".EMPPDM").prop("disabled",true);
							
							}
							else{
								$(".EMPPAM").prop("disabled",false);
								$(".EMPPAGM").prop("disabled",false);
								$(".EMPPSM").prop("disabled",false);
								$(".EMPPDM").prop("disabled",false);
							}
						});
		
// 				사원 기준 끝

// 				대리 기준
					  // 동급 제외
					  $("#AMsame").click(function(){
							
							if(this.checked){
								$(".AMPAM").prop("disabled",true);
							}
							else{
								$(".AMPAM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#AMlower").click(function(){
							
							if(this.checked){
								$(".AMPEMP").prop("disabled",true);				
							}
							else{
								$(".AMPEMP").prop("disabled",false);
							}
					   });
					    
					  // 상급자 제외
					  $("#AMhigher").click(function(){
							
							if(this.checked){
								$(".AMPAGM").prop("disabled",true);
								$(".AMPSM").prop("disabled",true);
								$(".AMPDM").prop("disabled",true);
							
							}
							else{
								$(".AMPAGM").prop("disabled",false);
								$(".AMPSM").prop("disabled",false);
								$(".AMPDM").prop("disabled",false);
							}
						});
// 				대리 기준 끝

// 				과장 기준
					  // 동급 제외
					  $("#SMsame").click(function(){
							
							if(this.checked){
								$(".SMPSM").prop("disabled",true);
							}
							else{
								$(".SMPSM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#SMlower").click(function(){
							
							if(this.checked){
								$(".SMPEMP").prop("disabled",true);				
								$(".SMPAM").prop("disabled",true);				
							}
							else{
								$(".SMPEMP").prop("disabled",false);
								$(".SMPAM").prop("disabled",false);
							}
						});
					
					  // 상급자 제외
					  $("#SMhigher").click(function(){
							
							if(this.checked){
								$(".SMPAGM").prop("disabled",true);
								$(".SMPDM").prop("disabled",true);
							
							}
							else{
								$(".SMPAGM").prop("disabled",false);
								$(".SMPDM").prop("disabled",false);
							}
						});
// 				과장 기준 끝

// 				차장 기준
					  // 동급 제외
					  $("#AGMsame").click(function(){
							
							if(this.checked){
								$(".AGMPAGM").prop("disabled",true);
							}
							else{
								$(".AGMPAGM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#AGMlower").click(function(){
							
							if(this.checked){
								$(".AGMPEMP").prop("disabled",true);				
								$(".AGMPAM").prop("disabled",true);				
								$(".AGMPSM").prop("disabled",true);				
							}
							else{
								$(".AGMPEMP").prop("disabled",false);
								$(".AGMPAM").prop("disabled",false);
								$(".AGMPSM").prop("disabled",false);
							}
					   });
					    
					  // 상급자 제외
					  $("#AGMhigher").click(function(){
							
							if(this.checked){
								$(".AGMPDM").prop("disabled",true);
							}
							else{
								$(".AGMPDM").prop("disabled",false);
							}
						});
// 				차장 기준 끝

// 				부장 기준
					  // 동급 제외
					  $("#DMsame").click(function(){
							
							if(this.checked){
								$(".DMPDM").prop("disabled",true);
							}
							else{
								$(".DMPDM").prop("disabled",false);
							}
						});
						
					// 히급자 제외
					  $("#DMlower").click(function(){
							
							if(this.checked){
								$(".DMPEMP").prop("disabled",true);				
								$(".DMPAM").prop("disabled",true);				
								$(".DMPSM").prop("disabled",true);				
								$(".DMPAGM").prop("disabled",true);				
							}
							else{
								$(".DMPEMP").prop("disabled",false);
								$(".DMPAM").prop("disabled",false);
								$(".DMPSM").prop("disabled",false);
								$(".DMPAGM").prop("disabled",false);
							}
						});
					   });
// 				부장 기준 끝				    
>>>>>>> refs/remotes/origin/cbj2
	</script>