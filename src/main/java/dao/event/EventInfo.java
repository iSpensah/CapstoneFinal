package dao.event;

import java.util.Date;

public class EventInfo {
	
	
	private int pid;
	private String eventname;
	private String eventdesc;
	private Date eventstartdate;
	private Date eventenddate;
	
	public Date getEventstartdate() {
		return eventstartdate;
	}



	public void setEventstartdate(Date eventstartdate) {
		this.eventstartdate = eventstartdate;
	}



	public Date getEventenddate() {
		return eventenddate;
	}



	public void setEventenddate(Date eventenddate) {
		this.eventenddate = eventenddate;
	}

	
	public int getPid() {
		return pid;
	}



	public void setPid(int pid) {
		this.pid = pid;
	}



	public String getEventname() {
		return eventname;
	}



	public void setEventname(String eventname) {
		this.eventname = eventname;
	}



	public String getEventdesc() {
		return eventdesc;
	}



	public void setEventdesc(String eventdesc) {
		this.eventdesc = eventdesc;
	}

}