package com.team05.controller;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team05.command.ProductVO;
import com.team05.command.ReservationVO;
import com.team05.command.ReviewVO;
import com.team05.command.Review_imgVO;
import com.team05.command.RoomVO;
import com.team05.command.UserVO;
import com.team05.command.util.Criteria;
import com.team05.command.util.Room_infoVO;
import com.team05.command.util.SearchAreaVO;
import com.team05.command.util.SearchNameVO;
import com.team05.search.service.SearchService;

@Controller
@RequestMapping("search")
public class SearchController {
	
	@Autowired
	SearchService searchService;
	
	//예약 처리
	@RequestMapping(value = "reservation",method=RequestMethod.POST)
	public String reservation(Room_infoVO infovo, Model model) {
		System.out.println(infovo.toString());
		
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH");//날짜 형식 변경
		Date date1 = new Date();//입실
		Date date2 = new Date();//퇴실
		if(infovo.getCheckin()== null) {
			date1.setHours(infovo.getTime1());
			date2.setHours(infovo.getTime1()+infovo.getTime2());			
		}else {
			int checkin_time=Integer.parseInt(infovo.getCheckin().split(":")[0]);
			int checkout_time=Integer.parseInt(infovo.getCheckout().split(":")[0]);
			date1.setHours(checkin_time);
			date2.setDate(date1.getDate()+1);
			date2.setHours(checkout_time);
		}
		//날짜형식 변환
		String checkin=format1.format(date1);
		String checkout = format1.format(date2);
		infovo.setCheckin(checkin);
		infovo.setCheckout(checkout);
		
		String pro_title=searchService.getproductTitle(infovo.getPro_no());
		infovo.setPro_title(pro_title);
		model.addAttribute("infovo", infovo);
		System.out.println(infovo.toString());

		return "search/reservation";
	}
	
	//예약데이터 전송
	@RequestMapping("reservationForm")
	public String reservationForm(ReservationVO vo,RedirectAttributes ra) {
		int result =searchService.reservationForm(vo);
		if(result ==1) {
			ra.addFlashAttribute("msg", "예약이 완료되었습니다");
		}else {
			ra.addFlashAttribute("msg", "예약 실패!, 관리자에게 문의하세요");
		}
		return "redirect:/";
	}
	
	@RequestMapping(value = "room_info",method = RequestMethod.GET)
	public String room_info(@RequestParam("pro_no") int pro_no,Model model) {
		ArrayList<RoomVO> roomlist=searchService.getroom(pro_no);
		
		String address=searchService.getaddress(pro_no);
		String protitle=searchService.gettitle(pro_no);
		
		
		model.addAttribute("address", address);
		model.addAttribute("protitle", protitle);
		model.addAttribute("roomlist", roomlist);
		return "search/room_info";
	}
	
	

	@RequestMapping("search_area")
	public String search_area(SearchAreaVO searchvo,Model model) {
		
		ArrayList<ProductVO> productlist=searchService.getlist(searchvo);
		model.addAttribute("productlist", productlist);
		model.addAttribute("searchvo", searchvo);
		
		System.out.println(productlist.toString());
		return "search/search_area";
	}

	
	@ResponseBody
	@RequestMapping("display/{fileloca}/{filename:.+}")
	public ResponseEntity<byte[]> display(@PathVariable("fileloca") String fileloca,
											@PathVariable("filename") String filename){
		
		//각자 컴퓨터에 맞는 경로로 바꿀 것
		String uploadpath = "C:\\Users\\Win10\\Desktop\\Project\\"+fileloca;
		File file = new File(uploadpath+"\\"+filename);
		
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			byte[] arr = FileCopyUtils.copyToByteArray(file);
			result = new ResponseEntity<byte[]>(arr,header,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	@RequestMapping("search_room")
	public String search_room(SearchNameVO searchNameVO,Model model) {
		System.out.println(searchNameVO.toString());
		
		ArrayList<ProductVO> productlist=searchService.searchname(searchNameVO);
		System.out.println(productlist.toString());
		model.addAttribute("productlist", productlist);
		model.addAttribute("searchNameVO",searchNameVO);
		return "search/search_room";
	}
	
	@RequestMapping("select_area")
	public String select_area() {
		return "search/select_area";
	}
	
	
	@ResponseBody
	@RequestMapping("upload")
	public String upload(@RequestParam("file") MultipartFile file,
						@RequestParam("pro_no") int pro_no,
						@RequestParam("score") int score,
						@RequestParam("title") String title,
						@RequestParam("content") String content,HttpSession session) {
		try {
			UserVO uservo=(UserVO)session.getAttribute("userVO");
			String writer=uservo.getUserId();
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String fileloca=sdf.format(date);
			System.out.println(fileloca);
			
			
			String uploadpath = "C:\\Users\\Win10\\Desktop\\Project\\"+fileloca;
			File folder = new File(uploadpath);
			if(!folder.exists()) { 
				folder.mkdir(); 
			}
			
			
			String filerealname=file.getOriginalFilename();
			long size=file.getSize();
			String fileExtension=filerealname.substring(filerealname.lastIndexOf("."),filerealname.length());
			
			UUID uuid=UUID.randomUUID();
			String uuids=uuid.toString().replaceAll("-", "");
			
			String filename = uuids+fileExtension; 
	
			File saveFile = new File(uploadpath+"\\"+filename);
			file.transferTo(saveFile); 
			
			
			ReviewVO vo = new ReviewVO(0,writer,pro_no,score,content,title,uploadpath,filename,filerealname,fileloca,null,null);
			boolean result = searchService.insertReview(vo);
			
			if(result) {
				return "success";
			}else {
				return "fail";
			}
		} catch (NullPointerException e) {
			
			return "fail";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
		
		
	}
	
	@ResponseBody
	@RequestMapping("getreview/{pro_no}/{pageNum}")
	public HashMap<String, Object> getreview(@PathVariable("pro_no") int pro_no,
										@PathVariable("pageNum") int pageNum) {
		System.out.println(pro_no);
		Criteria cri = new Criteria(pageNum,10);
		HashMap<String, Object> map = new HashMap<String, Object>();
		//리뷰개수
		int count=searchService.reviewtotal(pro_no);
		double mean =0.0;
		if(count > 0) {
			//리뷰점수합
			int total=searchService.reviewtotalSum(pro_no);
			mean = (double)total /count;			
		}
		
		
		map.put("count", count);
		map.put("mean",mean);
		map.put("list",searchService.getreview(cri,pro_no));
		return map;
	}
	
	@ResponseBody
	@RequestMapping("reviewcountMean/{pro_no}")
	public HashMap<String, Object> reviewcountMean(@PathVariable("pro_no") int pro_no){
		HashMap<String, Object> map = new HashMap<String, Object>();
		//리뷰개수
		int count=searchService.reviewtotal(pro_no);
		if(count == 0) {		
			map.put("count", 0);
			map.put("mean", 0);
			return map;
		}
		//리뷰점수합
		int total=searchService.reviewtotalSum(pro_no);
		
		double mean = (double)total /count;
		
		map.put("count", count);
		map.put("mean", mean);
		return map;
	}
	
	//연령대별 
	@RequestMapping("byagegroup")
	public String agePopul(Model model) {
		RConnection conn =null;//R연결 커넥션
		
		try {
			conn = new RConnection("127.0.0.1",6311);//R연결 주소
			//R라이브러리 호출
			conn.eval("library(rJava)");
			conn.eval("library(DBI)");
			conn.eval("library(RJDBC)");
			conn.eval("library(dplyr)");
			conn.eval("library(ggplot2)");
			
			conn.eval("drv_oracle = JDBC(driverClass = 'oracle.jdbc.OracleDriver',classPath ='C:/Users/Win10/Desktop/last/ojdbc8.jar')");
			conn.eval("con_oracle = dbConnect(drv_oracle,'jdbc:oracle:thin:@localhost:1521/XEPDB1','HEALING','HEALING')");
			conn.eval("query = 'select pro_no,u.userage from reservation r left join users u on r.id=u.userid'");
			conn.eval("data = dbGetQuery(con_oracle,query)");
			conn.eval("data$temp = ifelse(data$USERAGE>=40,'40대',ifelse(data$USERAGE>=30,'30대','20대'))");
			conn.eval("data1=data %>% filter(temp=='20대')");
			conn.eval("data2=data %>% filter(temp=='30대')");
			conn.eval("data3=data %>% filter(temp=='40대')");
			conn.eval("data1=data1 %>%group_by(PRO_NO) %>% summarise(count=n()) %>% arrange(desc(count)) %>% head(10)");
			conn.eval("data2=data2 %>%group_by(PRO_NO) %>% summarise(count=n()) %>% arrange(desc(count)) %>% head(10)");
			conn.eval("data3=data3 %>%group_by(PRO_NO) %>% summarise(count=n()) %>% arrange(desc(count)) %>% head(10)");
			conn.eval("data1=data.frame(data1)");
			conn.eval("data2=data.frame(data2)");
			conn.eval("data3=data.frame(data3)");
			
			int[] twenty_prono=conn.eval("data1$PRO_NO").asIntegers();
			int[] thirty_prono=conn.eval("data2$PRO_NO").asIntegers();
			int[] forty_prono=conn.eval("data3$PRO_NO").asIntegers();
			if(twenty_prono.length >0) {
				ArrayList<ProductVO> twentylist=searchService.productlist(twenty_prono);				
				model.addAttribute("twentylist", twentylist);
			}
			if(thirty_prono.length >0) {
				ArrayList<ProductVO> thirtylist=searchService.productlist(thirty_prono);
				System.out.println(thirtylist.toString());
				model.addAttribute("thirtylist", thirtylist);
			}
			if(forty_prono.length >0) {
				ArrayList<ProductVO> fortylist=searchService.productlist(forty_prono);				
				model.addAttribute("fortylist", fortylist);
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
		}
		
		return "search/byagegroup";
		
	}
	
}
