package dao.event;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.Date;

public class JdbcTemplateEvent 
{
	public JdbcTemplate getTemplate()
	{
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("tmp");
		
		return temp;
	}
	
	////////GET NEW ID(incrementing MAX id) FUNCTION//////////
	public int getNewEventID()
	{
	
		JdbcTemplate temp = getTemplate();	
		Integer newpid = temp.queryForObject("select max(pid) + 1 from PromotionalEvent_tbl",Integer.class);
		return newpid;
	}
	
	////////SHOW ALL CATEGORY//////////
	public List<EventInfo> getAllEvents()
	{
		JdbcTemplate temp = getTemplate();
		List<EventInfo> list = temp.query("Select * from PromotionalEvent_tbl order by pid asc",new EventMapper());
		
		
		return list;

	}
	
	////////GET ALL INCOMING EVENT FUNCTION//////////
	public List<EventInfo> getAllIEvents()
	{
		JdbcTemplate temp = getTemplate();
		List<EventInfo> list2 = temp.query("select * from PromotionalEvent_tbl WHERE eventstartdate > current_date",new EventMapper());
	
		return list2 ;

	}
	
	////////GET ALL ONGOING EVENT FUNCTION//////////
	public List<EventInfo> getAllOEvents()
	{
		JdbcTemplate temp = getTemplate();
		List<EventInfo> list3 = temp.query("select * from PromotionalEvent_tbl WHERE eventstartdate <= current_date and eventenddate >= current_date order by eventstartdate asc\r\n"
				+ "",new EventMapper());
	
		return list3 ;

	}
	
	////////ADD NEW EVENT FUNCTION//////////
	public void insertNewEvent(int pid,String eventname,Date eventstartdate,Date eventenddate,String eventdesc)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("insert into PromotionalEvent_tbl values(?,?,?,?,?)",new Object[] {pid,eventname, eventstartdate,eventenddate,eventdesc});
		System.out.println(eventstartdate);
		System.out.println("----------row inserted");
	}
	
	////////UPDATE EVENT FUNCTION//////////
	public void updateEvent(int pid,String eventname, Date eventstartdate, Date eventenddate, String eventdesc)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("update promotionalevent_tbl set eventname = ?, eventstartdate=?, eventenddate=?, eventdesc= ? where pid =?",new Object[] {eventname,eventstartdate,eventenddate,eventdesc,pid});
	}

	////////DELETE EVENT FUNCTION//////////
	public void deleteEvent(int pid)
	{
		JdbcTemplate temp = getTemplate();	
		temp.update("delete from promotionalevent_tbl where pid =?",new Object[] {pid});

	}
	
	////////SEARCH EVENT via ID FUNCTION//////////
	public EventInfo searchEvent(int pid)
	{
		JdbcTemplate temp = getTemplate();	
		EventInfo event = temp.queryForObject("Select * from promotionalevent_tbl where pid = ?",
											new Object [] {pid},new EventMapper());
		return event;
	}
	
	public Integer countTotalEvents()
	{
	JdbcTemplate temp = getTemplate();
	Integer totalevents = temp.queryForObject("select count(*) as totalevents from promotionalevent_tbl ",Integer.class);

	return totalevents;
	}
}


