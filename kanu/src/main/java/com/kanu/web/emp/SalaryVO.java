package com.kanu.web.emp;

public class SalaryVO {

	private String employeeId;
	private String hireType;
	private String salaryDate;
	private String duringTime;
	private String monthSalary;
	private String monthWork;
	private String employeeName;
	
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public String getHireType() {
		return hireType;
	}
	public void setHireType(String hireType) {
		this.hireType = hireType;
	}
	public String getSalaryDate() {
		return salaryDate;
	}
	public void setSalaryDate(String salaryDate) {
		this.salaryDate = salaryDate;
	}
	public String getDuringTime() {
		return duringTime;
	}
	public void setDuringTime(String duringTime) {
		this.duringTime = duringTime;
	}
	public String getMonthSalary() {
		return monthSalary;
	}
	public void setMonthSalary(String monthSalary) {
		this.monthSalary = monthSalary;
	}
	public String getMonthWork() {
		return monthWork;
	}
	public void setMonthWork(String monthWork) {
		this.monthWork = monthWork;
	}
	@Override
	public String toString() {
		return "SalaryVO [employeeId=" + employeeId + ", hireType=" + hireType + ", salaryDate=" + salaryDate
				+ ", duringTime=" + duringTime + ", monthSalary=" + monthSalary + ", monthWork=" + monthWork
				+ ", employeeName=" + employeeName + "]";
	}
	 
	
	
}
