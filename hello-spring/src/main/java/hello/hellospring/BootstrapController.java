package hello.hellospring;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BootstrapController {

	@RequestMapping("index")
	public String dashboard() {
		return "index";
	}
}
