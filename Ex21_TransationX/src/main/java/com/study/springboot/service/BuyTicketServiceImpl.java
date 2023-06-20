package com.study.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.dao.Transaction1Dao;
import com.study.springboot.dao.Transaction2Dao;

@Service
public class BuyTicketServiceImpl implements BuyTicketService {

	@Autowired
	Transaction1Dao transaction1;
	
	@Autowired Transaction2Dao transaction2;
	
	@Override
	public int buy(String consumerId, String amount, String error) {
		try {
			
			transaction1.pay(consumerId, amount);
			
			if("1".equals(error)) {
				// 일부러 예외 발생
				int n = 10 / 0;
			}
			
			transaction2.pay(consumerId, amount);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

}