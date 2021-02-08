package com.company.main;

import java.sql.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.domain.PaymentVO;
import com.company.service.PaymentService;

@Controller
@RequestMapping(value = "/payment/*")
public class PaymentController {

	private static Logger logger =
			LoggerFactory.getLogger(PaymentController.class);
	
	/////////////////////////////////////////////////////////

	@Inject
	private PaymentService pservice; // 결제 관련 서비스
	
	/////////////////////////////////////////////////////////
	
	/* 주문 */
	@RequestMapping(value = "payment", method = RequestMethod.POST)
	public String payment(String phone, Date order_date, String menu, String menutype, int amount, int price, String message,
						  PaymentVO pvo, Model model, HttpSession session) throws Exception{
	
		logger.info("-- 결제 버튼 실행");
		String email = (String)session.getAttribute("email");
		pvo.setPhone(phone); pvo.setOrder_date(order_date); pvo.setMenu(menu); 
		pvo.setMenutype(menutype); pvo.setAmount(amount); pvo.setPrice(price); pvo.setMessage(message);
		model.addAttribute("email", email);
		model.addAttribute("phone", pvo.getPhone());
		model.addAttribute("order_date", pvo.getOrder_date());
		model.addAttribute("menu", pvo.getMenu());
		model.addAttribute("menutype", pvo.getMenutype());
		model.addAttribute("amount", pvo.getAmount());
		model.addAttribute("price", pvo.getPrice());
		model.addAttribute("message", pvo.getMessage());
		logger.info("@@ pvo : " + pvo);
		pservice.registerPM(pvo);
		return "redirect:../index";
	} // payment()

	/////////////////////////////////////////////////////////
}