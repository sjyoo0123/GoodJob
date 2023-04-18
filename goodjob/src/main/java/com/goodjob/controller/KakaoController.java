package com.goodjob.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.goodjob.member.model.MemberDAO;
import com.goodjob.member.model.MemberDTO;



@Controller
@RequestMapping("/oauth")
public class KakaoController {
	
	@Autowired
	MemberDAO mdao;
	String clientId="61dcf9dc3f066d3fdbf620ba80e181cd";
	
	@RequestMapping(value="/getToken.do",method = RequestMethod.GET)
	public String kakaojoin(String code, HttpSession session,HttpServletRequest req) throws JsonMappingException, JsonProcessingException {
	    RestTemplate restTemplate = new RestTemplate();

	    String url = "https://kauth.kakao.com/oauth/token";
	    String params = "grant_type=authorization_code&client_id=" + clientId + "&redirect_uri=http://localhost:9090/goodjob/oauth/getToken.do&code=" + code;

	    HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	    HttpEntity<String> entity = new HttpEntity<>(params, headers);

	    ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

	    ObjectMapper objectMapper = new ObjectMapper();
	    String accessToken = objectMapper.readTree(response.getBody()).get("access_token").asText();
	    session.setAttribute("accessToken", accessToken);
	    System.out.println(accessToken);

	    // Get user information using access token
	    String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
	    HttpHeaders userInfoHeaders = new HttpHeaders();
	    userInfoHeaders.set("Authorization", "Bearer " + accessToken);
	    userInfoHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
	    HttpEntity<String> userInfoEntity = new HttpEntity<>(userInfoHeaders);

	    ResponseEntity<String> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, userInfoEntity, String.class);

	    // Parse user information
	    JsonNode rootNode = objectMapper.readTree(userInfoResponse.getBody());
	    String kakaoId = rootNode.path("id").asText();
	    String email = rootNode.path("kakao_account").path("email").asText();
	    String nickname = rootNode.path("properties").path("nickname").asText();
	  //  System.out.println(rootNode.toString());
	    // Store user information in session or database

	    System.out.println(email);
	 //  MemberDTO dto= mdao.emailCheck(email);
	  // if(dto==null) {
		    req.setAttribute("id",kakaoId);
		    req.setAttribute("email",email);
		    req.setAttribute("nickname", nickname);
		    return "redirect:/kakaoJoin.do";
	//   }else {
//		   	session.setAttribute("sidx", dto.getIdx());
//			session.setAttribute("sname", dto.getName());
//			session.setAttribute("scategory", dto.getUser_category());
//			session.setAttribute("status", dto.getStatus());
		//	return "redirect:/index.do";
	   }
	//}
	@RequestMapping(value="/getToken.do",method = RequestMethod.POST)
	public String login(String accessToken){
		System.out.println(accessToken);
		return "index"; 
	}
}
