package pkg;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import dao.event.EventInfo;
import dao.event.JdbcTemplateEvent;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyEventController {

	
	JdbcTemplateEvent objtemplate = new JdbcTemplateEvent();
	
	
	////////////GET ALL EVENT MAPPING//////////////
	@RequestMapping("/admin-event")
	public String showAllEventDetails(Model model)
	{
		List<EventInfo> list = objtemplate.getAllEvents();
 
		model.addAttribute("allevents",list);
		
		return "admin-event";
	}
	
	////////////GET ALL ONGOING AND INCOMING EVENT MAPPING//////////////
	@RequestMapping("/Ongoing&IncomingEvents")
	public String showAllOngoingAndIncommingEventDetails(Model model)
	{
		List<EventInfo> list2 = objtemplate.getAllIEvents();
		List<EventInfo> list3 = objtemplate.getAllOEvents();
		
		
		model.addAttribute("IncomingEvents",list2);
		model.addAttribute("OngoingEvents",list3);
		
		
		return "ongoingAndIncomingEvents";
	}
	
	////////////ADD EVENT FORM//////////////
	@RequestMapping("/admin-event/addNewEventForm")
	public String insertNewEventForm()
	{
		return "admin-event/addNewEventForm";
	}
	
	////////////SAVE NEW EVENT FUNCTION//////////////
	@RequestMapping("/admin-event/saveNewEvent")
	public String saveNewEvent(HttpServletRequest request,Model model) throws ParseException 
	{

		int pid = objtemplate.getNewEventID();
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		String eventname = request.getParameter("eventname");
		Date eventstartdate = formatter.parse(request.getParameter("eventstartdate"));
		Date eventenddate = formatter.parse(request.getParameter("eventenddate"));
		String eventdesc = request.getParameter("eventdesc");
		
		objtemplate.insertNewEvent(pid, eventname, eventstartdate,eventenddate, eventdesc);
		
		return "redirect:/admin-event?event="+1;  
	}
	
	////////////DELETE EVENT//////////////
	@RequestMapping("/deleteEvent/{pid}")
	public String deleteEvent(@PathVariable int pid)
	{
		objtemplate.deleteEvent(pid);
		return "redirect:/admin-event?remove="+1;  
	}
	
	////////////UPDATE EVENT FORM//////////////
	@RequestMapping("/admin-event/editEventForm/{pid}")
	public String editEventForm(@PathVariable int pid, Model model)
	{
		EventInfo objEvent = objtemplate.searchEvent(pid);
		
				
		model.addAttribute("event",objEvent);
		return "admin-event/editEventForm";  
	}
	
	////////////UPDATE EVENT FUNCTION//////////////
	@RequestMapping("/admin-event/updateEventDetail")
	public String updateEventDetail(HttpServletRequest request) throws ParseException 
	{

		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		int pid = Integer.parseInt(request.getParameter("pid"));
		String eventname = request.getParameter("eventname");
		Date eventstartdate = formatter.parse(request.getParameter("eventstartdate"));
		Date eventenddate = formatter.parse(request.getParameter("eventenddate"));
		String eventdesc = request.getParameter("eventdesc");
		objtemplate.updateEvent(pid, eventname, eventstartdate,eventenddate, eventdesc);
		System.out.print(eventstartdate);
		return "redirect:/admin-event?edit="+1;  
		
	}

	
}
