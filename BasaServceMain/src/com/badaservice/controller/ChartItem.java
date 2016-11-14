package com.badaservice.controller;

public class ChartItem {
	private String date;
	private int visits;
	private int views;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getVisits() {
		return visits;
	}

	public void setVisits(int visits) {
		this.visits = visits;
	}

	

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	@Override
	public String toString() {
		return "ChartItem [date=" + date + ", visits=" + visits +  ", views=" + views + "]";
	}

}
