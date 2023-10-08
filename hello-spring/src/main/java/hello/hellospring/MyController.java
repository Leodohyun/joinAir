package hello.hellospring;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {
    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello, Thymeleaf!");
        model.addAttribute("message1", "나의, 타임리프");
        return "hello"; 
    }
}