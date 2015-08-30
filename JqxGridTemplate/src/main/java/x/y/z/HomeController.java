package x.y.z;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(value="/index.do") 
	public String home() {
		System.out.println("call home");
		return "home";
	}

	@RequestMapping(value="/call.do") 
	public String dbcall(@RequestParam Map<String, String> params) {
		return "db_call";
	}
	
	
	@RequestMapping(value="/list.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> list(@RequestParam Map<String, String> params) {
		System.out.println(params);
		List<Map<String, Object>> list = postService.getList(params);
		System.out.println("size:" +list.size());
		
		return list;
	}
	
}
