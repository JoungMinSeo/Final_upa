package edu.fin.upa.management.model.service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.fin.upa.management.model.dao.ManagementDAO;
import edu.fin.upa.management.model.vo.Management;
import edu.fin.upa.management.model.vo.Pagination;


@Service
public class ManagementServiceImpl implements ManagementService{
	
	@Autowired
	private ManagementDAO mDao;

	@Autowired  
	private JavaMailSender mailSender;   //메일
	
	
	// 특정 팀의 모든 팀원 수 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg =mDao.getListCount(pg.getWorkNo());
		
		System.out.println(selectPg);
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount(), pg.getWorkNo(), selectPg.getWorkNm());
	}

	// 멤버 리스트조회
	@Override
	public List<Management> selectMemberList(Pagination pagination) {
		return mDao.selectMemberList(pagination);
	}

	// 팀 멤버 초대 메일 보내기
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int invitation(Management inputAddEmail) {
		
		
		// 워크 스페이스에 가입된 회원인지 검사
		Map<String, Object> map= mDao.selectWorkspaceJoin(inputAddEmail);
		
		int result =0;	
		System.out.println(map);
		System.out.println(inputAddEmail);
		
		if( Integer.parseInt(  map.get("CNT").toString()) == 0) { // 가입되지 않은 회원이라면
			
			try {
				result = mDao.invitation(inputAddEmail);
				
				if(result > 0) {
					String setfrom = "upalupa789@gmail.com"; // 보내는 서버 이메일
					String tomail = inputAddEmail.getMemberId(); // 받는 사람 이메일
					String title = "우파루파로부터 초대장이 도착했습니다."; // 제목
					
					String content =   (String)map.get("WORK_NM") + " 팀의 도롱뇽이 되어주세요!<br>"
							+ "아래 링크 클릭 시 바로 승인됩니다.<br>"
							+ "<a href='http://localhost:8080/wooper/management/"+inputAddEmail.getWorkNo()+"/add'>팀 초대 링크</a>"; // 내용
					// <a href='http://localhost:8080/wooper/management/2/add>팀 초대 링크</a>
					
					// https://github.com/HoneyBBangdangE/WTWI/invitations
					
					try {
						
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
						
						messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
						messageHelper.setTo(tomail); // 받는사람 이메일
						messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
						messageHelper.setText(content, true); // 메일 내용
						
						mailSender.send(message);
						
					} catch (Exception e) {
						e.printStackTrace();
					}
					
				}
				
			}catch (Exception e) {
				result = 0;
			}
			
		}else { // 가입이 되어있는 경우
			result = -1;
			mDao.deleteInvitation(inputAddEmail);
		}
		
		return result;
	}

	// 팀 회원 추가
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int addJoinMember(Management management) {
		
		// 1) INVITATAION 테이블에서 회원번호, 워크스페이스 번호가 일치하는 행의 memberRank 조회
		String memberRank = mDao.selectIvitation(management);
		
		int result = 0 ;
		// 2) memberRank가 존재한다면 == 현재 워크스페이스에 초대된 회원
		if(memberRank != null) {
			management.setMemberRank(memberRank);
			
			result = mDao.addJoinMember(management);
		
			
			
			System.out.println("result : " + result);
			System.out.println(management);
			if(result > 0) {
				mDao.deleteInvitation(management);
			}
		}else {
			// 이미 워크스페이스에 가입된 회원인지 확인
			result = mDao.checkWorkspceMember(management);
			
			// 이미 존재하는 회원인 경우
			if(result > 0)  result = -1;
		}
		
		return result;
	}
	
	// 회원 등급 수정
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateMemberRank(List<Management> list) {
		int result = 0;
		System.out.println("너는 무엇이 담겨있느냐 : " + list);
		
		for(Management m : list) {
			result = mDao.updateMemberRank(m);
			
			if(result == 0) {
				break;
			}
		}
		
		return result;
	}
		
	// 팀 회원 삭제
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int deleteJoinMember(List<Management>  list) {
		int result = 0;
		
		for(Management m : list) {
			result=mDao.deleteJoinMember(m);
			if(result ==0) {
				break;
			}
		}
		
		return result;
	}
		
		


	


}
