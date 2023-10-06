package hello.hellospring;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello, World!");
        System.out.println("---test---");
        return "hello"; // 이 템플릿 이름은 hello.html로 가정합니다.
    }
}