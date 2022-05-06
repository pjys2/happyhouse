package com.ssafy.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.UserDTO;
import com.ssafy.service.UserService;

@RestController
@CrossOrigin("*")
public class UserRestController {
	
	@Autowired
	UserService userser;
	
	@GetMapping("/user/{id}")
	public Map<String, Object> searchpw(@PathVariable String id) throws SQLException {
		String pw = userser.searchpw(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if(pw!=null) {
			map.put("flag", 1);
			map.put("pw", pw);
		}else {
			map.put("flag", 0);
		}
		
		return map;
	}
	
	@PostMapping("/user")
	@Transactional
	public Map<String, Object> register(@RequestBody UserDTO udto) throws SQLException {
		int flag = userser.insertUser(udto);
		Map<String, Object> map = new HashMap<String, Object>();
		if(flag == 0) {
			map.put("flag", flag);
		}else {
			map.put("flag", flag);
		}
		return map;
	}
	
	@PutMapping("/user/{id}")
	@Transactional
	public Map<String, Object> update(@PathVariable("id") String id, @RequestBody UserDTO udto) throws SQLException {
		System.out.println(id+"여기옴??"+udto);
		int flag = userser.updateUser(udto);
		Map<String, Object> map = new HashMap<String, Object>();
		if(flag == 0) {
			map.put("flag", flag);
		}else {
			map.put("flag", flag);
		}
		return map;
	}
	
	@DeleteMapping("/user/{id}")
	@Transactional
	public Map<String, Object> del(@PathVariable("id") String id) throws SQLException {
		int flag = userser.deletetUser(id);
		Map<String, Object> map = new HashMap<String, Object>();
		if(flag == 0) {
			map.put("flag", flag);
		}else {
			map.put("flag", flag);
		}
		return map;
	}
	
	
	
	
}
