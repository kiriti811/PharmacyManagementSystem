package javaActionForms;

public class addMedicinesBean {
	public  int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	

	public String getMedicineType() {
		return medicineType;
	}
	public void setMedicineType(String medicineType) {
		this.medicineType = medicineType;
	}


	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}


	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}


	public String getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}


	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}


	public float getUnitCost() {
		return unitCost;
	}
	public void setUnitCost(float unitCost) {
		this.unitCost = unitCost;
	}


	public int getTotalUnits() {
		return totalUnits;
	}
	public void setTotalUnits(int totalUnits) {
		this.totalUnits = totalUnits;
	}


	public float getTotalPurchaseCost() {
		return totalPurchaseCost;
	}
	public void setTotalPurchaseCost(float totalPurchaseCost) {
		this.totalPurchaseCost = totalPurchaseCost;
	}


	public int getSafetyStock() {
		return safetyStock;
	}
	public void setSafetyStock(int safetyStock) {
		this.safetyStock = safetyStock;
	}


	public int getRemainingStock() {
		return remainingStock;
	}
	public void setRemainingStock(int remainingStock) {
		this.remainingStock = remainingStock;
	}


	private int id=	0;
	private String medicineType	="";
	private String medicineName	="";
	private String manufacturer	="";
	private String batchNumber	="";
	private String expiryDate	="";
	private float unitCost	=0f;
	private int totalUnits	=0;
	private float totalPurchaseCost	=0f;
	private int safetyStock	=0;
	private int remainingStock	=0;
}
