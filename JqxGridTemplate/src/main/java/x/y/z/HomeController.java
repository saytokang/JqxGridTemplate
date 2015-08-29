package x.y.z;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import x.y.z.service.PostService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	PostService postService;

	@RequestMapping(value="/") 
	public String home() {
		return "home";
	}

	@RequestMapping(value="/call.do") 
	public String dbcall() {
		return "db_call";
	}
	
	
	@RequestMapping(value="/list.do")
	@ResponseBody
	public List<Map<String, Object>> list() {
		List<Map<String, Object>> list = postService.getList();
		System.out.println("size:" +list.size());
		
		return list;
	}
	
}
