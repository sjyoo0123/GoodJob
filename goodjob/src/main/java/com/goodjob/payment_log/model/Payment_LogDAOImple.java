package com.goodjob.payment_log.model;

import java.time.*;
import java.time.format.DateTimeFormatter;

import org.apache.ibatis.session.SqlSession;

public class Payment_LogDAOImple implements Payment_LogDAO {

	private SqlSession sqlMap;
	public Payment_LogDAOImple() {
		// TODO Auto-generated constructor stub
	}
	public SqlSession getSqlMap() {
		return sqlMap;
	}
	public void setSqlMap(SqlSession sqlMap) {
		this.sqlMap = sqlMap;
	}
	@Override// 주문번호 생성 매서드
	public String paymentCallUid() {
		LocalDate today = LocalDate.now();
		DateTimeFormatter fom=DateTimeFormatter.BASIC_ISO_DATE;
		String todaystr=today.format(fom);
		System.out.println(todaystr);
		
		Integer i=sqlMap.selectOne("paymentCallUid");
		String str=i.toString();
		for(int j=i.toString().length();j<4;j++) {
			str="0"+str;
		}
		str=todaystr+str;
		return str;
	}
	
	@Override
	public int manPaymentAdd(Payment_LogDTO dto) {
		
		int count=sqlMap.insert("manPaymentAdd", dto);
		
		return count;
	}

}
