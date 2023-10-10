package com.company.view.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.spring_annotation.user.UserDAO;
import com.company.spring_annotation.user.UserDO;

@Controller
public class UserController {
	
	@RequestMapping("/insertUser.do")
	public String insertUser(UserDO userDO, UserDAO userDAO) { 
		// 기존의 메소드 이름이 'insertUSer'로 되어 있어서 오타인 것 같습니다. 'insertUser'로 수정합니다.
		userDAO.insertUser(userDO);
		return "login.jsp"; // 회원 가입 후 로그인 페이지로 이동하도록 설정
	}
}
