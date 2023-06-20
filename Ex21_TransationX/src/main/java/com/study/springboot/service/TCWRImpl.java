package com.study.springboot.service;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;

public class TCWRImpl 
	extends TransactionCallbackWithoutResult {

	@Override
	protected void doInTransactionWithoutResult(TransactionStatus status) {
		// TODO Auto-generated method stub
		
	}

}
