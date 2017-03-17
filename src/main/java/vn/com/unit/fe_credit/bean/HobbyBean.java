package vn.com.unit.fe_credit.bean;

import java.util.List;

import vn.com.unit.fe_credit.entity.Hobby;

public class HobbyBean extends AbstractBean<Hobby> {
	private List<Hobby> listHobby;
	private String searchField;
	private String  succesorfail;

	public List<Hobby> getListHobby() {
		return listHobby;
	}

	public void setListHobby(List<Hobby> listHobby) {
		this.listHobby = listHobby;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public String getSuccesorfail() {
		return succesorfail;
	}

	public void setSuccesorfail(String succesorfail) {
		this.succesorfail = succesorfail;
	}
	
}
