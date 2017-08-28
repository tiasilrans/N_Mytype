package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class MainController {
	
	@RequestMapping({ "/", "/index.mt" })
	public String welcome(Map map) {
		map.put("section", "main");
		return "t_el";
	}

}
