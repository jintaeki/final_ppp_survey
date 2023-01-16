package com.mycompany.webapp.dto;

public class ProjectDTO {
   private String projectId;
   private String projectName;
   private String projectStartDate;
   private String projectClosedDate;
   public String getProjectId() {
      return projectId;
   }
   public void setProjectId(String projectId) {
      this.projectId = projectId;
   }
   public String getProjectName() {
      return projectName;
   }
   public void setProjectName(String projectName) {
      this.projectName = projectName;
   }
   public String getProjectStartDate() {
      return projectStartDate;
   }
   public void setProjectStartDate(String projectStartDate) {
      this.projectStartDate = projectStartDate;
   }
   public String getProjectClosedDate() {
      return projectClosedDate;
   }
   public void setProjectClosedDate(String projectClosedDate) {
      this.projectClosedDate = projectClosedDate;
   }
   @Override
   public String toString() {
      return "ProjectDTO [projectId=" + projectId + ", projectName=" + projectName + ", projectStartDate="
            + projectStartDate + ", projectClosedDate=" + projectClosedDate + "]";
   }
}

