package com.company.view.user;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.spring_annotation.common.PasswordEncryptUtil;
import com.company.spring_annotation.user.UserDAO;
import com.company.spring_annotation.user.UserDO;

/*
 * LoginController 클래스를 POJO 클래스라 한다.
 * 
 * POJO(Plain Old Java Object)란? (= 평범하고 오래된 자바 객체 = 순수한 객체 라는 / 의미를 갖고있다.) 
 * 즉, Java로 생성하는 순수한 객체를 뜻한다. 
 * 이를 해석하면 POJO는 객체 지향적인 원리에 
 * 충실하면서 환경과 기술에 종속되지 않고, 
 * 필요에 따라 재활용될 수 있는 방식으로 설계된 오브젝트를 의미한다.
 * 쉽게 말하면 어떤 클래스로부터 '상속'도 받지 않고, 어떤 '인터페이스'로부터 구현도 받지 않은 클래스
 * 
 * 이런 이유로 IT 전문가들을 "스프링 프레임워크"는 => 'POJO 방식의 프레임워크' 이라고 함!!
 * POJO 클래스 위에 '@Controller' 어노테이션 받으면 된다.
 */

@Controller
public class LoginController {

    @RequestMapping("/login.do")
    public String login(UserDO userDO, UserDAO userDAO, HttpSession session) {
        try {
            // 패스워드 암호화
            String encryptedPassword = PasswordEncryptUtil.encryptSHA256(userDO.getUser_Password());
            userDO.setUser_Password(encryptedPassword);

            // 사용자 정보 조회
            UserDO user = userDAO.getUser(userDO);

            if (user != null) { // 로그인 인증 성공
                System.out.println("로그인 인증 성공!!");
                // 추가적인 검증 또는 정보 저장
                session.setAttribute("userId", user.getUser_Id());
                session.setAttribute("userName", user.getUser_Name());
                return "redirect:/index.jsp"; // index.jsp 페이지로 리다이렉트
            } else {
                // 로그인 실패 시 메시지와 함께 로그인 페이지로 이동
                return "login"; // login 페이지의 이름은 실제 프로젝트에서 사용하는 뷰 이름으로 변경해야 합니다.
            }
        } catch (Exception e) {
            // 예외 발생 시 로깅 또는 예외 처리 로직 추가
            e.printStackTrace();
            // 에러 페이지로 리다이렉트 또는 에러 메시지와 함께 로그인 페이지로 이동
            return "login";
        }
    }

    @ExceptionHandler(Exception.class)
    public String handleException(Exception e) {
        // 예외 발생 시 로깅 또는 예외 처리 로직 추가
        e.printStackTrace();
        // 에러 페이지로 리다이렉트 또는 에러 메시지와 함께 로그인 페이지로 이동
        return "login";
    }
}
