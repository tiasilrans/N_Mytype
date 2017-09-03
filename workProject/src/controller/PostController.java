package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import model.PostDao;

@Controller
@SuppressWarnings({ "unchecked", "rawtypes" })
public class PostController {
	@Autowired
	ObjectMapper objMapper;
	
	@Autowired
	PostDao pdao;	
	
	@RequestMapping("postgoodAdd.mt")
	@ResponseBody
	public String postgoodAdd(@RequestParam Map map,HttpSession session) throws JsonProcessingException{
		Map result = new HashMap<>();
		map.put("num", ((String)map.get("num")).replace("heart-", ""));
		map.put("email", (String)session.getAttribute("login"));
		result.put("rst", pdao.postgoodAdd(map) > 0 ? true: false);
		String mz=objMapper.writeValueAsString(result);
		return mz;
	}
	
	@RequestMapping("postgoodRemove.mt")
	@ResponseBody
	public String postgoodRemove(@RequestParam Map map,HttpSession session) throws JsonProcessingException{
		Map result = new HashMap<>();
		map.put("num", ((String)map.get("num")).replace("heart-", ""));
		map.put("email", (String)session.getAttribute("login"));
		result.put("rst", pdao.postgoodRemove(map) > 0 ? true: false);
		String mz=objMapper.writeValueAsString(result);
		return mz;
	}
	
}
