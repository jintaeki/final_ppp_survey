package com.mycompany.webapp.dto;

public class PopupDTO {
   private int projectId;
   private int gradeId;
   private int departmentId;
   private String employeeName;
   
   public int getProjectId() {
      return projectId;
   }
   public void setProjectId(int projectId) {
      this.projectId = projectId;
   }
   public int getGradeId() {
      return gradeId;
   }
   public void setGradeId(int gradeId) {
      this.gradeId = gradeId;
   }
   public int getDepartmentId() {
      return departmentId;
   }
   public void setDepartmentId(int departmentId) {
      this.departmentId = departmentId;
   }
   public String getEmployeeName() {
      return employeeName;
   }
   public void setEmployeeName(String employeeName) {
      this.employeeName = employeeName;
   }
   @Override
   public String toString() {
      return "PopupDTO [projectId=" + projectId + ", gradeId=" + gradeId + ", departmentId=" + departmentId
            + ", employeeName=" + employeeName + "]";
   }
   
}