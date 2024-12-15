package com.pk.roadproject;

import java.util.Locale;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pk.dao.RestaurantDao;
import com.pk.dto.MemberDto;
import com.pk.dto.RestaurantDto;
import com.pk.dto.RservationDto;
import com.pk.service.GetRestService;
import com.pk.service.MemberService;
import com.pk.service.MenuGetListService;
import com.pk.service.MenupanGetListService;
import com.pk.service.ReservationService;
import com.pk.service.RestTrashFileDel;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private MemberService service;
	
	@Autowired
	MemberDto memberDto;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	GetRestService getRest;
	
	@Autowired
	MenuGetListService getMenuList;
	
	@Autowired
	RestTrashFileDel RestTrashFileDel;
	
	@Autowired
	MenupanGetListService getmpList;
	
	@Autowired
	RestaurantDao rdao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
    private ReservationService reservationService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index.tiles";
	}
	  
	  //회원가입
	  @RequestMapping(value = "/join", method = {RequestMethod.GET, RequestMethod.POST})
	    public String join(@RequestParam(required = false) String role, Locale locale, Model model) {
	        logger.info("join 접속");
	        
	        model.addAttribute("role", role);
	        
	        return "join.tiles";
	    }
	  @RequestMapping(value = "/join2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String join2(@RequestParam(required = false) String role, Locale locale, Model model) {
	        logger.info("join2 접속");
	        
	        model.addAttribute("role", role);
	        
	        return "join2.tiles";
	    }
	  
	  
	  @RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
	    public String index(Locale locale, Model model) {
	        logger.info("index 접속");
	        
	        return "index.tiles";
	    }
	  
	  @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
	    public String login(Locale locale, Model model) {
	        logger.info("login 접속");
	        
	        return "login.tiles";
	    }
	  
	  @RequestMapping(value = "admin/adminPage", method = {RequestMethod.GET, RequestMethod.POST})
	    public String adminPage(Locale locale, Model model) {
	        logger.info("adminPage 접속");
	        
	        return "admin/adminPage.tiles";
	    }
	  
	  @RequestMapping(value = "admin/admin_reviewDetail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_reviewDetail(Locale locale, Model model) {
	        logger.info("admin_reviewDetail 접속");
	        
	        return "admin/admin_reviewDetail.tiles";
	    }
	  
	  @RequestMapping(value = "admin/admin_keyword", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_keyword(Locale locale, Model model) {
	        logger.info("admin_keyword 접속");
	        
	        return "admin/admin_keyword.tiles";
	    }
	  
	  @RequestMapping(value = "admin/admin_keywordDetail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_keywordDetail(Locale locale, Model model) {
	        logger.info("admin_keywordDetail 접속");
	        
	        return "admin/admin_keywordDetail.tiles";
	    }
	  
	  @RequestMapping(value = "admin/admin_user", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_user(Locale locale, Model model) {
	        logger.info("admin_user 접속");
	        
	        return "admin/admin_user.tiles";
	    }
	  @RequestMapping(value = "admin/admin_userDetail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_userDetail(Locale locale, Model model) {
	        logger.info("admin_userDetail 접속");
	        
	        return "admin/admin_userDetail.tiles";
	    }
	  @RequestMapping(value = "admin/admin_userDetail2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_userDetail2(Locale locale, Model model) {
	        logger.info("admin_userDetail2 접속");
	        
	        return "admin/admin_userDetail2.tiles";
	    }
	  
	  @RequestMapping(value = "admin/admin_decl", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_decl(Locale locale, Model model) {
	        logger.info("admin_decl 접속");
	        
	        return "admin/admin_decl.tiles";
	    }
	  @RequestMapping(value = "admin/admin_declDetail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String admin_declDetail(Locale locale, Model model) {
	        logger.info("admin_declDetail 접속");
	        
	        return "admin/admin_declDetail.tiles";
	    }
	  
	  @RequestMapping(value = "/joinFine", method = {RequestMethod.GET, RequestMethod.POST})
	  public ModelAndView joinFine(
	            @RequestParam String nickname,
	            @RequestParam String userid,
	            @RequestParam String pass1,
	            @RequestParam String pass2,
	            @RequestParam String addr1,
	            @RequestParam String addr2,
	            @RequestParam(required = false) String tel,
	            @RequestParam(required = false) String role,
	            @RequestParam(required = false) String buisness) throws Exception {
		  logger.info("joinFine 접속");
		  
		  ModelAndView mav = new ModelAndView();
		  int role2 = 0;
		  String password = null;
		  System.out.println(role);
		  System.out.println(userid);
		  System.out.println(nickname);
		  System.out.println(pass1);
		  System.out.println(pass2);
		  System.out.println(addr1);
		  System.out.println(addr2);
		  
		  if(role == null) {
			  role2 = 1;
		  }
		  else {
			  role2 = Integer.parseInt(role);
		  }
	        
		  if(role2 == 1) {
			  if(pass1.equals(pass2)) {
				  System.out.println("??");
				  password = pass1;
				  
				  memberDto.setNickname(nickname);
				  memberDto.setUserid(userid);
				  memberDto.setPassword(password);
				  memberDto.setAddr1(addr1);
				  memberDto.setAddr2(addr2);
				  memberDto.setRole(role2);
				  
				  service.insertDB(memberDto);
				  
			      mav.setViewName("joinFine.tiles");
			  }
			  else {
				  
				  	mav.setViewName("join.tiles"); // 여기서 ModelAndView 객체를 생성하고 뷰 이름을 설정합니다.
				    mav.addObject("alert", "비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
				    mav.addObject("nickname", nickname);
				    mav.addObject("userid", userid);
				    mav.addObject("addr1", addr1);
				    mav.addObject("addr2", addr2);
				    mav.addObject("role", role2);
				    
				    return mav;
				  
			  }
	        

	        
		  }
		  else if(role2 == 2) {
			  
			  if(pass1.equals(pass2)) {
				  System.out.println("??");
				  password = pass1;
				  
				  memberDto.setNickname(nickname);
			      memberDto.setUserid(userid);
			      memberDto.setPassword(password);
			      memberDto.setTel(tel);
			      memberDto.setAddr1(addr1);
			      memberDto.setAddr2(addr2);
			      memberDto.setRole(role2);
			      memberDto.setBuisness(buisness);
				  
				  service.insertDB(memberDto);
				  
			      mav.setViewName("joinFine.tiles");
			  }
			  else {
				  
				  	mav.setViewName("join2.tiles"); // 여기서 ModelAndView 객체를 생성하고 뷰 이름을 설정합니다.
				    mav.addObject("alert", "비밀번호가 일치하지 않습니다. 다시 입력해 주세요.");
				    mav.addObject("nickname", nickname);
				    mav.addObject("userid", userid);
				    mav.addObject("tel", tel);
				    mav.addObject("addr1", addr1);
				    mav.addObject("addr2", addr2);
				    mav.addObject("role", role2);
				    
				    return mav;
				  
			  }
		  }
		      
	      return mav;
	    }
	  
	  @RequestMapping(value = "/joinedit", method = {RequestMethod.GET, RequestMethod.POST})
	    public String joinedit(Locale locale, Model model) {
	        logger.info("joinedit 접속");
	        
	        return "joinedit.tiles";
	    }
	  
	  @RequestMapping(value = "/joinDelete", method = {RequestMethod.GET, RequestMethod.POST})
	    public String joineDelete(Locale locale, Model model) {
	        logger.info("joineDelete 접속");
	        
	        return "joinDelete.tiles";
	    }
	  
	  @RequestMapping(value = "/joinDelete_success", method = {RequestMethod.GET, RequestMethod.POST})
	    public String joineDelete_success(Locale locale, Model model) {
	        logger.info("joinDelete_success 접속");
	        
	        return "joinDelete_success.tiles";
	    }
	  
	  @RequestMapping(value = "/selectType", method = {RequestMethod.GET, RequestMethod.POST})
	    public String selectType(Locale locale, Model model) {
	        logger.info("selectType 접속");
	        
	        return "selectType.tiles";
	    }
	  
	  @RequestMapping(value = "/follow", method = {RequestMethod.GET, RequestMethod.POST})
	    public String follow(Locale locale, Model model) {
	        logger.info("follow 접속");
	        
	        return "follow.tiles";
	    }
	  
	  @RequestMapping(value = "/following", method = {RequestMethod.GET, RequestMethod.POST})
	    public String following(Locale locale, Model model) {
	        logger.info("following 접속");
	        
	        return "following.tiles";
	    }
	  
	  @RequestMapping(value = "/myPage", method = {RequestMethod.GET, RequestMethod.POST})
	    public String myPage(Locale locale, Model model) {
	        logger.info("myPage 접속");
	        
	        return "myPage.tiles";
	    }
	  
	  @RequestMapping(value = "/myPage2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String myPage2(Locale locale, Model model) {
	        logger.info("myPage2 접속");
	        
	        return "myPage2.tiles";
	    }
	  
	  @RequestMapping(value = "/myPage3", method = {RequestMethod.GET, RequestMethod.POST})
	    public String myPage3(Locale locale, Model model) {
	        logger.info("myPage3 접속");
	        
	        return "myPage3.tiles";
	    }
	  
	  @RequestMapping(value = "map/map", method = RequestMethod.GET)
	  public String map(Locale locale, Model model) {
		  System.out.println("map 접속");
		  
		  return "map/map.tiles";
	  }
	  
	  @RequestMapping(value = "map/map_book", method = RequestMethod.GET)
	  public String map_book(Locale locale, Model model) {
		  System.out.println("map_book 접속");
		  
		  return "map/map_book.tiles";
	  }
	  
	  @RequestMapping(value = "map/map_theme", method = RequestMethod.GET)
	  public String map_thema(Locale locale, Model model) {
		  System.out.println("map_thema 접속");
		  
		  return "map/map_theme.tiles";
	  }
	  
	  @RequestMapping(value = "/partnerPage_detail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage_detail(@RequestParam("restaurant_id") int restaurantId, 
	    								 Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
	        logger.info("partnerPage_detail 접속");
	        
	        //테스트용 restaurantId
	        System.out.println(restaurantId);
	        model.addAttribute("restaurantId", restaurantId);
	        
	        return "partnerPage_detail.tiles";
	    }
	  
	  @RequestMapping(value = "/partnerPage_detail_menu", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage_detail_menu(Locale locale, Model model) {
	        logger.info("partnerPage_detail_menu 접속");
	        
	        return "partnerPage_detail_menu.tiles";
	    }

	  
	  @RequestMapping(value = "/partnerPage_review_registration", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage_review_registration(Locale locale, Model model) {
	        logger.info("partnerPage_review_registration 접속");
	        
	        return "partnerPage_review_registration.tiles";
	    }
	  
	  
	  @RequestMapping(value = "/partnerPage", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response,
						    		@RequestParam(value="cpg", defaultValue="1") int cpg, 
									@RequestParam(value="searchname", defaultValue="") String searchname,
									@RequestParam(value="searchvalue", defaultValue="") String searchvalue) {
	        logger.info("partnerPage 접속");
	      
	        System.out.println("현재 저장된 business값 : " + session.getAttribute("buisness"));
	        String business = (String) session.getAttribute("buisness");
	        int rest_id = (int) session.getAttribute("rest_id");
	        System.out.println(rest_id);
	        model.addAttribute("business", business );
	        model.addAttribute("req", request);
	        
			/*
			 * int rbusiness = Integer.parseInt( (String) session.getAttribute("buisness"));
			 * model.addAttribute("business", rbusiness);
			 */
	        model.addAttribute("cpg" , cpg);
	        model.addAttribute("searchname", searchname);
	        model.addAttribute("searchvalue", searchvalue);
	        model.addAttribute("rest_id", rest_id);
	        getRest.excute(model);
	        getMenuList.excute(model);
	        getmpList.excute(model);	       
	        
	        return "partnerPage.tiles";
	    }
	  @RequestMapping(value = "/partnerPage2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage2(Locale locale, Model model) {
	        logger.info("partnerPage2 접속");
	        
	        return "partnerPage2.tiles";
	    }
	  
	  @RequestMapping(value = "/partnerPage_myreview", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage_myreview(Locale locale, Model model) {
	        logger.info("partnerPage_myreview 접속");
	        
	        return "partnerPage_myreview.tiles";
	    }
	  
	  @RequestMapping(value = "/partnerPage_myreview2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage_myreview2(Locale locale, Model model) {
	        logger.info("partnerPage_myreview2 접속");
	        
	        return "partnerPage_myreview2.tiles";
	    }
	  
	  
	  @RequestMapping(value = "/partnerPage3", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage3(Locale locale, Model model) {
	        logger.info("partnerPage3 접속");
	        
	        return "partnerPage3.tiles";
	    }
	  @RequestMapping(value = "/partnerPage4", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partnerPage4(Locale locale, Model model) {
	        logger.info("partnerPage4 접속");
	        
	        return "partnerPage4.tiles";
	    }
	  
	  @RequestMapping(value = "/partner_avg_detail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partner_avg_detail(Locale locale, Model model) {
	        logger.info("partner_avg_detail 접속");
	        
	        return "partner_avg_detail.tiles";
	    }
	  
	  @RequestMapping(value = "/partneredit", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partneredit(Locale locale, Model model) {
	        logger.info("partneredit 접속");
	        RestTrashFileDel.restDelCom();  //rest_id가 0인 이미지,파일 값들 삭제로직.
	        return "partneredit.tiles";
	    }
	  
	  
	  /* 원래 쓰던거
	  @RequestMapping(value = "/partneredit2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partneredit2(Locale locale, Model model, HttpSession session) {
		
	        logger.info("partneredit2 접속");
	        String upDir = servletContext.getRealPath("/resources/");
			System.out.println(upDir);
			String imnum = UUID.randomUUID().toString();
			session.getAttribute("buisness");
			model.addAttribute("imnum", imnum);
	        return "partneredit2.tiles";
	    }
	  */
	  @RequestMapping(value = "/partneredit2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String partneredit2(Locale locale, Model model, HttpSession session) {
		
	        logger.info("partneredit2 접속");
	        String upDir = servletContext.getRealPath("/resources/");
			System.out.println(upDir);
			String imnum = UUID.randomUUID().toString();
			int rbusiness = Integer.parseInt((String) session.getAttribute("buisness"));
			model.addAttribute("imnum", imnum);
			model.addAttribute("buisness", rbusiness);
			
			getRest.excute(model);	
			
	        return "partneredit2.tiles";
	    }
	  
	  //rs
	  @RequestMapping(value = "/openrun1", method = {RequestMethod.GET, RequestMethod.POST})
	    public String openrun1(Locale locale, Model model) {
	        logger.info("openrun1 접속");
	        
	        return "openrun1.tiles";
	    }
	  
	  @RequestMapping(value = "/openrun2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String openrun2(Locale locale, Model model) {
	        logger.info("openrun2 접속");
	        
	        return "openrun2.tiles";
	    }
	  
	  @RequestMapping(value = "/openrun3", method = {RequestMethod.GET, RequestMethod.POST})
	    public String openrun3(Locale locale, Model model) {
	        logger.info("openrun1 접속");
	        
	        return "openrun3.tiles";
	    }
	  
	  @RequestMapping(value = "/rs/reservation_main", method = {RequestMethod.GET, RequestMethod.POST})
	    public String reservation_main(Locale locale, Model model) {
	        logger.info("reservation_main 접속");
	        
	        return "rs/reservation_main.tiles";
	    }
	  @RequestMapping(value = "/rs/normalrs", method = {RequestMethod.GET, RequestMethod.POST})
	    public String normalrs(Locale locale, Model model) {
	        logger.info("normalrs 접속");
	        
	        return "rs/normalrs.tiles";
	    }
	  @RequestMapping(value = "/rs/normalrs2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String normalrs2(Locale locale, Model model) {
	        logger.info("normalrs2 접속");
	        
	        return "rs/normalrs2.tiles";
	    }
	  
	  @RequestMapping(value = "/rs/speedrs", method = {RequestMethod.GET, RequestMethod.POST})
	    public String speedrs(Locale locale, Model model) {
	        logger.info("speedrs 접속");
	        
	        return "rs/speedrs.tiles";
	    }
	  @RequestMapping(value = "/rs/speedrs2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String speedrs2(Locale locale, Model model) {
	        logger.info("speedrs2 접속");
	        
	        return "rs/speedrs2.tiles";
	    }
	  @RequestMapping(value = "/rs/smartrs", method = {RequestMethod.GET, RequestMethod.POST})
	    public String smartrs(Locale locale, Model model) {
	        logger.info("smartrs 접속");
	        
	        return "rs/smartrs.tiles";
	    }
	  @RequestMapping(value = "/rs/smartrs2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String smartrs2(Locale locale, Model model) {
	        logger.info("smartrs2 접속");
	        
	        return "rs/smartrs2.tiles";
	    }
	  @RequestMapping(value = "/rs/smartrs3", method = {RequestMethod.GET, RequestMethod.POST})
	    public String smartrs3(Locale locale, Model model) {
	        logger.info("smartrs3 접속");
	        
	        return "rs/smartrs3.tiles";
	    }
	  @RequestMapping(value = "/rs/smart_loading", method = {RequestMethod.GET, RequestMethod.POST})
	  public String smart_loading(HttpServletRequest request, HttpSession session, Locale locale, Model model) {
	      logger.info("smart_loading 접속");

	      // 사용자가 입력한 날짜와 키워드를 가져옵니다.
	      String selectedDate = (String) session.getAttribute("selectedDate"); // 세션에서 날짜 값 가져오기
	      String selectedKeywords = request.getParameter("keywords");
	      String personCountStr = request.getParameter("personCount");

	      // 인원 수를 정수로 변환하고 세션에 저장합니다. null일 경우 기본값 1로 설정.
	      int personCount = (personCountStr != null) ? Integer.parseInt(personCountStr) : 1;
	      session.setAttribute("personCount", personCount);

	      // 세션에 저장합니다.
	      session.setAttribute("selectedDate", selectedDate);
	      session.setAttribute("selectedKeywords", selectedKeywords);
	      
	      logger.info("resDay: " + selectedDate);
	      logger.info("resKeyword" + selectedKeywords);
	      logger.info("resKeyword" + personCount);
	      

	      return "rs/smart_loading.tiles";
	  }
	  
	  @RequestMapping(value = "/rs/smart_ok", method = {RequestMethod.GET, RequestMethod.POST})
	  public String smart_ok(HttpServletRequest request, HttpSession session, Locale locale, Model model) {
	      logger.info("smart_ok 접속");
	      

	  

	   // 세션에서 값 가져오기
	      String userid = (String) session.getAttribute("nickname");
	      String usertel = (String) session.getAttribute("phone");
	      String rtAddr1 = "인천광역시 부평구";
	      String rtAddr2 = "부평대로 44";
	      String rtTel = "000-000-0000";
	      String rtName = "{상호명}";
	      Integer resNum = (Integer) session.getAttribute("personCount");
	      String resTime = (String) session.getAttribute("selectedTime");

	      // null 체크 및 기본값 설정
	      String resDay = (String) session.getAttribute("selectedDate");
	      if (resDay == null) {
	          resDay = request.getParameter("selectedDate");
	      }

	      if (resDay == null) {
	          resDay = "없음"; // 둘 다 없을 경우 "없음"으로 설정
	      }
	      String resKeyword = (String) session.getAttribute("selectedKeywords");
	      if (resKeyword == null) {
	          resKeyword = "없음";
	      }

	      int rtCode = 11111;
	      
	      logger.info("userid: " + userid);
	      logger.info("usertel: " + usertel);
	      logger.info("resNum: " + resNum);
	      logger.info("resTime: " + resTime);
	      logger.info("resDay: " + resDay);
	      logger.info("resKeyword" + resKeyword);


	      // DTO 생성
	      RservationDto reservation = new RservationDto();
	      reservation.setUserid(userid);
	      reservation.setUsertel(usertel);
	      reservation.setRtCode(rtCode);
	      reservation.setRtAddr1(rtAddr1);
	      reservation.setRtAddr2(rtAddr2);
	      reservation.setRtTel(rtTel);
	      reservation.setRtName(rtName);
	      reservation.setResNum(resNum);
	      reservation.setResTime(resTime);
	      reservation.setResDay(resDay);
	      reservation.setResKeyword(resKeyword);

	      // DB에 예약 저장
	      reservationService.saveReservation(reservation);

	      return "rs/smart_ok.tiles";
	  }
	  @RequestMapping(value = "/rs/smart_map", method = {RequestMethod.GET, RequestMethod.POST})
	    public String smart_map(Locale locale, Model model) {
	        logger.info("smart_map 접속");
	        
	        return "rs/smart_map.tiles";
	    }
	  @RequestMapping(value = "/rs/smart_map2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String smart_map2(Locale locale, Model model) {
	        logger.info("smart_map2 접속");
	        
	        return "rs/smart_map2.tiles";
	    }
	  @RequestMapping(value = "/rs/speedrs_ok", method = {RequestMethod.GET, RequestMethod.POST})
	  public String speedrs_ok(HttpSession session, Locale locale, Model model) {
	      logger.info("speedrs_ok 접속");
	      

	  

	   // 세션에서 값 가져오기
	      String userid = (String) session.getAttribute("nickname");
	      String usertel = (String) session.getAttribute("phone");
	      String rtAddr1 = "인천광역시 부평구";
	      String rtAddr2 = "부평대로 44";
	      String rtTel = "000-000-0000";
	      String rtName = "{상호명}";
	      Integer resNum = (Integer) session.getAttribute("personCount");
	      String resTime = (String) session.getAttribute("selectedTime");

	      // null 체크 및 기본값 설정
	      String resDay = (String) session.getAttribute("selectedDate");
	      if (resDay == null) {
	          resDay = "없음";
	      }

	      String resKeyword = (String) session.getAttribute("selectedKeywordString");
	      if (resKeyword == null) {
	          resKeyword = "없음";
	      }

	      int rtCode = 11111;
	      
	      logger.info("userid: " + userid);
	      logger.info("usertel: " + usertel);
	      logger.info("resNum: " + resNum);
	      logger.info("resTime: " + resTime);
	      logger.info("resDay: " + resDay);
	      logger.info("resKeyword" + resKeyword);


	      // DTO 생성
	      RservationDto reservation = new RservationDto();
	      reservation.setUserid(userid);
	      reservation.setUsertel(usertel);
	      reservation.setRtCode(rtCode);
	      reservation.setRtAddr1(rtAddr1);
	      reservation.setRtAddr2(rtAddr2);
	      reservation.setRtTel(rtTel);
	      reservation.setRtName(rtName);
	      reservation.setResNum(resNum);
	      reservation.setResTime(resTime);
	      reservation.setResDay(resDay);
	      reservation.setResKeyword(resKeyword);

	      // DB에 예약 저장
	      reservationService.saveReservation(reservation);

	      return "rs/speedrs_ok.tiles";
	  }
	  @RequestMapping(value = "/rs/speedrs_fail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String speedrs_fail(Locale locale, Model model) {
	        logger.info("speedrs_fail 접속");
	        
	        return "rs/speedrs_fail.tiles";
	    }
	  @RequestMapping(value = "/rs/normalrs_ok", method = {RequestMethod.GET, RequestMethod.POST})
	  public String normalrs_ok(HttpSession session, Locale locale, Model model) {
	      logger.info("normalrs_ok 접속");
	      

	  

	   // 세션에서 값 가져오기
	      String userid = (String) session.getAttribute("nickname");
	      String usertel = (String) session.getAttribute("phone");
	      String rtAddr1 = "인천광역시 부평구";
	      String rtAddr2 = "부평대로 44";
	      String rtTel = "000-000-0000";
	      String rtName = "{상호명}";
	      Integer resNum = (Integer) session.getAttribute("personCount");
	      String resTime = (String) session.getAttribute("selectedTime");

	      // null 체크 및 기본값 설정
	      String resDay = (String) session.getAttribute("selectedDate");
	      if (resDay == null) {
	          resDay = "없음";
	      }

	      String resKeyword = (String) session.getAttribute("selectedKeywordString");
	      if (resKeyword == null) {
	          resKeyword = "없음";
	      }

	      int rtCode = 11111;
	      
	      logger.info("userid: " + userid);
	      logger.info("usertel: " + usertel);
	      logger.info("resNum: " + resNum);
	      logger.info("resTime: " + resTime);
	      logger.info("resDay: " + resDay);
	      logger.info("resKeyword" + resKeyword);


	      // DTO 생성
	      RservationDto reservation = new RservationDto();
	      reservation.setUserid(userid);
	      reservation.setUsertel(usertel);
	      reservation.setRtCode(rtCode);
	      reservation.setRtAddr1(rtAddr1);
	      reservation.setRtAddr2(rtAddr2);
	      reservation.setRtTel(rtTel);
	      reservation.setRtName(rtName);
	      reservation.setResNum(resNum);
	      reservation.setResTime(resTime);
	      reservation.setResDay(resDay);
	      reservation.setResKeyword(resKeyword);

	      // DB에 예약 저장
	      reservationService.saveReservation(reservation);

	      return "rs/normalrs_ok.tiles";
	  }
	  @RequestMapping(value = "/rs/normalrs_fail", method = {RequestMethod.GET, RequestMethod.POST})
	    public String normalrs_fail(Locale locale, Model model) {
	        logger.info("normalrs_fail 접속");
	        
	        return "rs/normalrs_fail.tiles";
	    }
	  @RequestMapping(value = "/rs/waiting_speed", method = {RequestMethod.GET, RequestMethod.POST})
	    public String waiting_speed(Locale locale, Model model) {
	        logger.info("waiting_speed 접속");
	        
	        return "rs/waiting_speed.tiles";
	    }
	  @RequestMapping(value = "/rs/waiting_speed2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String waiting_speed2(Locale locale, Model model) {
	        logger.info("waiting_speed2 접속");
	        
	        return "rs/waiting_speed2.tiles";
	    }
	  
	  @RequestMapping(value = "/rs/rsCalendar", method = {RequestMethod.GET, RequestMethod.POST})
	    public String rsCalendar(Locale locale, Model model) {
	        logger.info("rsCalendar 접속");
	        
	        return "rs/rsCalendar";
	    }
	  @RequestMapping(value = "/rs/rsCalendar2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String rsCalendar2(Locale locale, Model model) {
	        logger.info("rsCalendar2 접속");
	        
	        return "rs/rsCalendar2";
	    }
	  @RequestMapping(value = "/rs/rsCalendar3", method = {RequestMethod.GET, RequestMethod.POST})
	    public String rsCalendar3(Locale locale, Model model) {
	        logger.info("rsCalendar3 접속");
	        
	        return "rs/rsCalendar3";
	    }
	  
	  @RequestMapping(value = "/rs/timeselect", method = {RequestMethod.GET, RequestMethod.POST})
	    public String timeselect(Locale locale, Model model) {
	        logger.info("timeselect 접속");
	        
	        return "rs/timeselect";
	    }
	  @RequestMapping(value = "/rs/timeselect2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String timeselect2(Locale locale, Model model) {
	        logger.info("timeselect2 접속");
	        
	        return "rs/timeselect2";
	    }
	  @RequestMapping(value = "/rs/timeselect4", method = {RequestMethod.GET, RequestMethod.POST})
	    public String timeselect4(Locale locale, Model model) {
	        logger.info("timeselect4 접속");
	        
	        return "rs/timeselect4";
	    }
	  @RequestMapping(value = "/rs/timeselect3", method = {RequestMethod.GET, RequestMethod.POST})
	    public String timeselect3(Locale locale, Model model) {
	        logger.info("timeselect3 접속");
	        
	        return "rs/timeselect3";
	    }
	  @RequestMapping(value = "/rs/kwselect", method = {RequestMethod.GET, RequestMethod.POST})
	    public String kwselect(Locale locale, Model model) {
	        logger.info("kwselect 접속");
	        
	        return "rs/kwselect";
	    }
	  @RequestMapping(value = "/rs/kwselect2", method = {RequestMethod.GET, RequestMethod.POST})
	    public String kwselect2(Locale locale, Model model) {
	        logger.info("kwselect2 접속");
	        
	        return "rs/kwselect2";
	    }
	  @RequestMapping(value = "/map/rsmap", method = {RequestMethod.GET, RequestMethod.POST})
	    public String rsmap(Locale locale, Model model) {
	        logger.info("rsmap 접속");
	        
	        return "map/rsmap.tiles";
	    }
	  
	  @RequestMapping(value = "/rs/saveTime", method = RequestMethod.POST)
	    public String saveTime(HttpServletRequest request, @ModelAttribute("time") String selectedTime) {
	        HttpSession session = request.getSession();
	        session.setAttribute("selectedTime", selectedTime); // 세션에 시간 저장
	        System.out.println("시간 저장 완료 : " + selectedTime);
	        
	        // 다음 페이지로 리다이렉트
	        return "rs/saveTime"; // 원하는 페이지로 리다이렉트
	    }
	  @RequestMapping(value = "/rs/saveToSession", method = RequestMethod.POST)
	    public String saveToSession(HttpServletRequest request, @ModelAttribute("time") String selectedTime) {
	        HttpSession session = request.getSession();
	        session.setAttribute("saveToSession", selectedTime); // 세션에 시간 저장
	        System.out.println("시간 저장 완료 : " + selectedTime);
	        
	        // 다음 페이지로 리다이렉트
	        return "rs/saveToSession"; // 원하는 페이지로 리다이렉트
	    }
	  
	  @RequestMapping(value = "/rs/getSessionValue", method = RequestMethod.GET)
	  @ResponseBody
	  public String getSessionValue(HttpSession session) {
	      String selectedDate = (String) session.getAttribute("selectedDate");
	      return selectedDate != null ? selectedDate : "값이 없습니다.";
	  }
	  
	    @PostMapping("/rs/resetSession")
	    @ResponseBody
	    public String resetSession(HttpSession session) {
	        session.invalidate(); // 세션 무효화
	        return "세션이 성공적으로 지워졌습니다."; // 응답 메시지
	    }
	  
	  //로그인
	  @RequestMapping(value = "/searchMember", method = RequestMethod.POST)
	  public ModelAndView searchMember(
			    @RequestParam(required = false) String userid,
			    @RequestParam(required = false) String password,
			    HttpSession session) throws Exception {
		  
		  
		  		System.out.println(userid);
			    memberDto.setUserid(userid);
			    memberDto.setPassword(password);
			  
			    if (service.searchId(memberDto)) { // 로그인 확인
			        System.out.println("로그인 되었습니다.");
			        MemberDto search = new MemberDto();
		  
			        search.setUserid(userid);
			        search = service.searchNick(search);
			        
			        
			        System.out.println(search); // 회원 정보 가져오기
			        String nick = search.getNickname();
			        int role = search.getRole();
			        String buisness = search.getBuisness();
			        String tel = search.getTel();
			        System.out.println(nick);
			     
			        if(role == 2) {
			        	session.setAttribute("nickname", nick);
			        	session.setAttribute("userid", userid);
			        	session.setAttribute("role", role);
			        	session.setAttribute("buisness", buisness);
			        	RestaurantDto rdto = new RestaurantDto();
			        	rdto.setBusiness(Integer.parseInt(buisness));
			           	int rbusiness = rdto.getBusiness();
			            rdto = rdao.rSelectDetail(rbusiness);
			            int rest_id = rdto.getId();
			            System.out.println(rest_id);
 			        	session.setAttribute("tel", tel);
			        	session.setAttribute("rest_id", rest_id);
			        	
			        	System.out.println("id : "+session.getAttribute("userid")+", nick : "+session.getAttribute("nickname")+", role : "+session.getAttribute("role")+", buisness : "+session.getAttribute("buisness")+", rest_id : "+session.getAttribute("rest_id"));
			        }else {
			        	session.setAttribute("nickname", nick);
			        	session.setAttribute("userid", userid);
			        	session.setAttribute("role", role);
			        	
			        	System.out.println("id : "+session.getAttribute("userid")+", nick : "+session.getAttribute("nickname")+", role : "+session.getAttribute("role"));
			        }
			        
			 
			    } else {
			        System.out.println("로그인에 실패했습니다.");
			    }

			    ModelAndView modelAndView = new ModelAndView("redirect:/index");
			    return modelAndView;
			}
	  //로그아웃
	  @RequestMapping(value = "/logout", method = RequestMethod.GET)
	  public ModelAndView logout(HttpSession session) {
		  
		  session.invalidate();
		  System.out.println("로그아웃 완료");
		  
		  ModelAndView modelAndView = new ModelAndView("redirect:/index");
		  return modelAndView;
	  }
	  
	  @RequestMapping(value = "/recommend", method = RequestMethod.GET)
	  public String recommend(Locale locale, Model model) {
		  System.out.println("recommend 접속");
		  
		  return "recommend.tiles";
	  }
}
