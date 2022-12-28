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
					       = document.getElementsByName('평가자사원');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMP_EMP(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자사원');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				
				function EMP_AM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자대리');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMP_SM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자과장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMP_AGM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자차장');
					  
					  checkboxes.forEach((checkbox) => {
					    checkbox.checked = selectAll.checked;
					  })
					}
				function EMP_DM(selectAll)  {
					  const checkboxes 
					       = document.getElementsByName('피평가자부장');
					  
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
					 
					  
					  $("#same").click(function(){
							
							if(this.checked){
								$(".emp").prop("disabled",true);
							}
							else{
								$(".emp").prop("disabled",false);
							}
						});
					    
					   });
					   
		
				
// 				사원 기준 끝
	</script>