package com.camp.kakaoBank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.camp.kakaoBank.bean.CardRequestVO;
import com.camp.kakaoBank.service.CRService;

@Controller
@RequestMapping(value="/cardRequest")
public class CRController {
	
	@Autowired
	CRService crService;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public String CRList(Model model) {
		model.addAttribute("list", crService.getCRList());
		return "list";
	}
	
	@RequestMapping(value="/add", method = RequestMethod.GET)
	public String addPost() {
		return "addpostform";
	}
	
	 @RequestMapping(value="/addok", method = RequestMethod.POST)
     public String addPostOK(CardRequestVO vo) {
         if(crService.insertCR(vo) == 0)
             System.out.println("데이터 추가 실패");
         else
             System.out.println("데이터 추가 성공!!!");
         return "redirect:list";
     }
     
     @RequestMapping(value="/editform/{id}", method = RequestMethod.GET)
     public String editPost(@PathVariable("id") int id, Model model) {
         CardRequestVO crVO = crService.getCR(id);
         model.addAttribute("u", crVO);
         return "editform";
     }
     
     @RequestMapping(value="/editok", method = RequestMethod.POST)
     public String editPostOk(CardRequestVO vo) {
         if(crService.updateCR(vo) == 0)
             System.out.println("데이터 수정 실패");
         else
             System.out.println("데이터 수정 성공!!!");
         return "redirect:list";
     }
     
     @RequestMapping(value="/deleteok/{id}", method = RequestMethod.GET)
     public String deletePostOk(@PathVariable("id") int id) {
         if(crService.deleteCR(id) == 0)
             System.out.println("데이터 삭제 실패");
         else
             System.out.println("데이터 삭제 성공!!!");
         return "redirect:../list";
     }
}
