package com.company.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.company.domain.MemberVO;

// 1. 해당 클래스를 DAO로 사용하겠다. 
// 스프링에게 등록하는 어노테이션(root-context.xml파일)
@Repository
public class MemberDAOImpl implements MemberDAO{
 
	// 1) DB와 연결 - root-context.xml에서 처리했음(2번, 10번)
	@Inject
	private SqlSession sqlSession;
	// => DB와 연결, 자원 해제, SQL쿼리 실행을 한다.
	
	// 2) mapper 주소가 필요하다.
	private static final String namespace =
			"com.company.mapper.MemberMapper";
	// memberMapper.xml파일의 namespace와 동일해야한다.

	/////////////////////////////////////////////////////////////////////
	
	/* 회원가입 메서드 */
	@Override
	public void signUp(MemberVO vo) {
		
		System.out.println("-- DAOImpl : signUp() 실행 ");
		sqlSession.selectOne(namespace+".signUp", vo);
		System.out.println("-- DAOImpl : signUp() 실행 완료 ");
		
	} // signUp()

	/////////////////////////////////////////////////////////////////////

	/* ID에 맞는 회원 정보를 가져오는 메서드 */
	@Override
	public MemberVO getMem(String email) {
		
		System.out.println("-- DAOImpl : TEST 파일에서 getMem() 호출 !");
		System.out.println("-- DAOImpl : MyBatis 사용 memberMapper로 이동 !");
		
		// com.itwillbs.mepper.MemberMapper.getMember
		MemberVO vo = sqlSession.selectOne(namespace + ".getMem", email); 
		// .selectOne() : 가지고 올 정보가 한 개일 경우 사용한다.
   	    // (String id)값을 갖고 넘겨야 조회 메소드가 실행되기 때문에
		
		System.out.println("-- DAOImpl : Mapper에서  SQL 구문 실행 완료 !");
		System.out.println("-- DAOImpl : 결과를 저장해서 TEST 페이지로 이동한다.");
		
		return vo; // TEST에서 vo받아서 출력한다.
	} // getMem()
	
	/////////////////////////////////////////////////////////////////////
	
	/* 로그인 메서드 */
	@Override
	public MemberVO signIn(String email, String pwd) {
		
		System.out.println("-- DAOImpl : signIn() 실행 ");
		System.out.println("-- DAOImpl : DB 연결 준비 ! (의존 주입을 통해 이미 완료)");
		System.out.println("-- DAOImpl : MyBatis 사용 Mapper로 이동하여 SQL을 호출 ! ");
		System.out.println("-- DAOImpl : 파라미터 값 2개를 전달하기 위해 Map 객체를 생성 !");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		// 저장할 때 key값을 테이블의 컬럼명으로 저장한다. -> Mapper에서 바로 전달될 수 있도록 처리한다.
		paramMap.put("email", email);
		paramMap.put("pwd", pwd);
		
		MemberVO vo = sqlSession.selectOne(namespace+".signIn", paramMap); 
		// selectOne()은 인자값이 1개여야하지만 위 문법은 2개이기 때문에 Map을 사용하여 데이터를 담아서 넘긴다.
		
		System.out.println("-- DAOImpl : Mapper에서 SQL구문 실행 완료 후 돌아온다.");
		System.out.println("-- DAOImpl : 결과를 저장하고 다시 TEST 페이지로 이동한다.");
		System.out.println("-- DAOImpl : signIn() 실행 완료 ");

		return vo;
	} // signIn()

	/////////////////////////////////////////////////////////////////////

	/* 회원탈퇴 메서드 */
	@Override
	public int dropOut(MemberVO vo) throws Exception {
		
		int check = 0;
		System.out.println("-- DAOImpl : dropOut() 실행 ");
		System.out.println("@@@ check : " + check);
		check = sqlSession.delete(namespace+".dropOut", vo);
		System.out.println("-- DAOImpl : dropOut() 실행 완료 ");
		return check;
	} // deleteMem()

	/////////////////////////////////////////////////////////////////////

	/* 회원 정보 수정 메소드 */
	@Override
	public int modify(MemberVO vo) {
		
		System.out.println("-- DAOImpl : modify() 실행 ");
		
		int check = 0; 
		check = sqlSession.delete(namespace+".modify", vo);
		System.out.println("@@@ check : " + check);
		
		if(check == 1) {
			System.out.println("-- 회원 정보 수정 완료 ");
		
		}else {
			System.out.println("-- 회원 정보 수정 실패 (modify()에서 오류 발생)");
		}
		
		System.out.println("-- DAOImpl : modify() 실행 완료 ");
		return check;
	} // modify() 

	/////////////////////////////////////////////////////////////////////
	
	/* 멤버십 정보를 가져오는 메서드 */
	@Override
	public MemberVO getMembership(String email) throws Exception {

		System.out.println("-- DAOImpl : getMembership() 실행 ");
		MemberVO vo = sqlSession.selectOne(namespace+".getMembership", email);
		System.out.println("@@@ vo : " + vo);
		System.out.println("-- DAOImpl : getMembership() 실행 완료 ");
		return vo;
	} // getMembership

	/////////////////////////////////////////////////////////////////////

	/* 전체 회원 조회 메서드 */
	@Override
	public List<MemberVO> getMembers() throws Exception {

		System.out.println("-- DAOImpl : getMembers() 실행 ");
		List memberList = sqlSession.selectList(namespace+".getMembers");
		System.out.println("@@ memberList : "+ memberList);
		System.out.println("-- DAOImpl : getMembers() 실행 완료");
		return memberList;
	} // getMembers()
	
	/////////////////////////////////////////////////////////////////////

	
	
	
}