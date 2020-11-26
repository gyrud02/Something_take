package com.company.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.company.domain.MemberVO;
import com.company.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	// DB에 접근이 가능해야한다. => MemberDAO 객체가 필요하기 때문에 의존 주입을 위해 생성한다.
	@Inject
	private MemberDAO mdao;
	
	///////////////////////////////////////////////////////////////////////
	
	/* 회원가입 동작 메서드 */
	@Override
	public void insertMem(MemberVO vo) throws Exception {

		System.out.println("-- ServiceImpl : insertMem() 실행 ");
		
		mdao.signUp(vo);
		
		System.out.println("-- ServiceImpl : insertMem() 실행 완료 ");

	} // insertMem

	///////////////////////////////////////////////////////////////////////

	/* 로그인 메서드 */
	@Override
	public MemberVO loginMem(MemberVO vo) throws Exception {

		System.out.println("-- ServiceImpl : loginMem() 실행 ");
		System.out.println("@@@@ Service : " + vo);

		// 로그인 체크 기능이 있는 DAO 객체로 이동
		MemberVO DBvo = mdao.signIn(vo.getEmail(), vo.getPwd());
		
		System.out.println("@@@@ Service : " + DBvo);
		
		System.out.println("-- ServiceImpl : loginMem() 실행 완료 ");

		return DBvo;
		
	} // loginMem()


	///////////////////////////////////////////////////////////////////////

	/* 회원 탈퇴 메서드 */
	@Override
	public int deleteMem(MemberVO vo) throws Exception {
		
		System.out.println("-- ServiceImpl : deleteMem() 실행 ");
		System.out.println("-- serviceImpl : vo -> " + vo);
		int check = mdao.dropOut(vo);
		System.out.println("@@@ num : " + check);
		
		// 정상처리일때와 비정상처리일때
		if(check == 1) {
			// 정상처리일때
			System.out.println("-- serviceImpl : 정상적으로 처리가 완료되었습니다.");
		}else {
			// 비정상처리일때 (ex- 비밀번호 오류)
			System.out.println("-- serviceImpl : 오류가 발생했습니다.");
		} // if문 끝
		
		System.out.println("-- ServiceImpl : deleteMem() 실행 완료");
		return check;
	} // deleteMem()

	///////////////////////////////////////////////////////////////////////

	/* 회원 정보 수정 메소드 */
	@Override
	public MemberVO updateMem(MemberVO vo) throws Exception {

		System.out.println("-- ServiceImpl : updateMem() 실행 ");
		System.out.println("-- serviceImpl : vo -> " + vo);

		int num = mdao.modify(vo);
		
		System.out.println("@@@ num : " + num);
		
		// 정상처리일때와 비정상처리일때
		if(num == 1) {
			// 정상처리일때
			System.out.println("-- serviceImpl : 정상적으로 처리가 완료되었습니다.");
		}else{
			// 비정상처리일때 (ex- 비밀번호 오류)
			System.out.println("-- serviceImpl : 오류가 발생했습니다.");
		} // if문 끝
		
		System.out.println("-- ServiceImpl : deleteMem() 실행 완료 ");
		
		return vo;
	} // updateMem()

	///////////////////////////////////////////////////////////////////////

	/* 본인 정보를 가져오는 메서드 */
	@Override
	public MemberVO getMem(String email) throws Exception {

		System.out.println("-- ServiceImpl : getMem() 실행 ");
		System.out.println("-- serviceImpl : email -> " + email);
		
		MemberVO DBvo = mdao.getMem(email);
		
		System.out.println("-- ServiceImpl : getMem() 실행 완료 ");
	
		return DBvo;
	} // getMem() 

	///////////////////////////////////////////////////////////////////////
	
	/* 멤버십 정보를 가져오는 메서드 */
	@Override
	public MemberVO getMembership(String email) throws Exception {

		System.out.println("-- ServiceImpl : getMembership() 실행 ");
		System.out.println("-- serviceImpl : email -> " + email);
		
		MemberVO vo = mdao.getMembership(email);
		
		System.out.println("-- ServiceImpl : getMembership() 실행 완료 ");
		return vo;
	} // membership()

	///////////////////////////////////////////////////////////////////////

	/* 회원 정보 전체 조회  */
	@Override
	public List<MemberVO> getMembers() throws Exception {

		System.out.println("-- ServiceImpl : getMembers() 실행");
		List memberList = mdao.getMembers();
		System.out.println("@@ memberList : " + memberList);
		System.out.println("-- ServiceImpl : getMembers() 실행 완료");
		return memberList;
	} // getMembers()

	///////////////////////////////////////////////////////////////////////

	/* 이메일 중복 확인 메서드 */
	@Override
	public int duplicate(String email) throws Exception {
		
		int check = 0;
		System.out.println("-- ServiceImpl : dupl() 실행");
		check = mdao.duplicate(email);
		System.out.println("@@ check : " + check);
		System.out.println("-- ServiceImpl : dupl() 실행");
		return check;
	} // dupl()
	
	///////////////////////////////////////////////////////////////////////

	
	
}