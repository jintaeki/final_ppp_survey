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
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('평가자대리');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자사원');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자대리');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자과장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				대리버튼 기준끝

// 				과장버튼 기준
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('평가자과장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자과장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				과장버튼 기준 끝

// 				차장버튼 기준
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('평가자차장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}

				
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자차장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				차장버튼 기준끝

// 				부장버튼 기준		
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('평가자부장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function select(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자부장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
// 				차장버튼 기준끝				
				
// 				옵션				
// 				사원 기준

				$(document).ready(function(){
					 
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
					   });
					   
		
				
// 				사원 기준 끝
	</script>