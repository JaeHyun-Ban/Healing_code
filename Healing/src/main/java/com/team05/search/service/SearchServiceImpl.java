package com.team05.search.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team05.command.ProductVO;
import com.team05.command.ReservationVO;
import com.team05.command.ReviewVO;
import com.team05.command.RoomVO;
import com.team05.command.util.Criteria;
import com.team05.command.util.SearchAreaVO;
import com.team05.command.util.SearchNameVO;
import com.team05.search.mapper.SearchMapper;

@Service
public class SearchServiceImpl implements SearchService{

	@Autowired
	SearchMapper searchMapper;
	
	@Override
	public ArrayList<ProductVO> getlist(SearchAreaVO searchvo) {
		
		return searchMapper.getlist(searchvo);
	}

	@Override
	public ArrayList<RoomVO> getroom(int pro_no) {
		
		return searchMapper.getroom(pro_no);
	}

	@Override
	public boolean insertReview(ReviewVO vo) {
		
		return searchMapper.insertReview(vo);
	}

	@Override
	public ArrayList<ReviewVO> getreview(Criteria cri,int pro_no) {
		
		return searchMapper.getreview(cri,pro_no);
	}

	@Override
	public int reviewtotal(int pro_no) {
		
		return searchMapper.reviewtotal(pro_no);
	}

	@Override
	public int reviewtotalSum(int pro_no) {
		
		return searchMapper.reviewtotalSum(pro_no);
	}

	@Override
	public String getaddress(int pro_no) {
		
		return searchMapper.getaddress(pro_no);
	}

	@Override
	public String gettitle(int pro_no) {
		
		return searchMapper.gettitle(pro_no);
	}

	@Override
	public ArrayList<ProductVO> searchname(SearchNameVO searchNameVOh) {
		
		return searchMapper.searchname(searchNameVOh);
	}

	@Override
	public String getproductTitle(int pro_no) {
		
		return searchMapper.getproductTitle(pro_no);
	}

	@Override
	public int reservationForm(ReservationVO vo) {
		
		return searchMapper.reservationForm(vo);
	}

	@Override
	public ArrayList<ProductVO> productlist(int[] list) {
		
		return searchMapper.productlist(list);
	}

	@Override
	public ArrayList<ProductVO> reviewRank() {
		
		return searchMapper.reviewRank();
	}

	
	
}
