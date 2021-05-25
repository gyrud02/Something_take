# Something_take : <a href="http://something-take.shop/></a>
                   <a href="http://3.23.185.192:8080/Something_take/index" target="_blank">http://3.23.185.192:8080/Something_take/index</a>

## JAVA
- com.company.domain : VO 클래스 패키지
  - AuthKeyVO.java : 회원가입 인증 메일 VO 
  - BoardVO.java : 게시판 VO
  - Criteria.java : 페이징 처리 VO
  - MemberVO.java : 회원 VO
  - PaymentVO.java : 결제 VO
  - ReplyVO.java : 댓글 VO

- com.company.main : Controller 클래스 패키지
  - BoardController.java : 게시판 관련 컨트롤러
  - ErrorController.java : 오류 관련 컨트롤러
  - HomeController.java : 메인 컨트롤러
  - MemberController.java : 회원 관련 컨트롤러
  - MessageController.java : 메세지 관련 컨트롤러
  - PaymentController.java : 결제 관련 컨트롤러

- com.company.persistence : DAO 클래스 패키지
  - BoardDAO.java : 게시판 DAO 인터페이스
  - BoardDAOImpl.java : 게시판 DAO
  - MemberDAO.java : 회원 DAO 인터페이스
  - MemberDAOImpl.java : 회원 DAO
  - MessageDAO.java : 메세지 DAO 인터페이스
  - MessageDAOImpl.java : 메시지 DAO
  - PaymentDAO.java : 결제 DAO 인터페이스
  - PaymentDAOImpl.java : 결제 DAO
  - ReplyDAO.java : 댓글 DAO 인터페이스
  - ReplyDAOImpl.java : 댓글 DAO

- com.company.service : Service 클래스 패키지
  - BoardService.java : 게시판 서비스 인터페이스
  - BoardServiceImpl.java : 게시판 서비스
  - MemberService.java : 회원 서비스 인터페이스
  - MemberServiceImpl.java : 회원 서비스
  - MessageService.java : 메세지 서비스 인터페이스
  - MessageServiceImpl.java : 메세지 서비스
  - PaymentService.java : 결제 서비스 인터페이스
  - PaymentServiceImpl.java : 결제 서비스
  - ReplyService.java : 댓글 서비스 인터페이스
  - ReplyServiceImpl.java : 댓글 서비스


## VIEWS
- admin : 관리자 폴더
  - adm_board.jsp : 게시판 관리 페이지
  - adm_icons.jsp : 아이콘 관리 페이지
  - adm_main.jsp : 관리자 메인 페이지
  - adm_members.jsp : 회원 관리 페이지
  - adm_message.jsp : 창업 문의 메세지 관리 페이지
  - adm_ordered.jsp : 주문 내역 관리 페이지
  - adm_payment.jsp : 결제 내역 관리 페이지
  - message.jsp : 창업 문의 메세지 내용 보기 페이지 

- board : 게시판 폴더
  - board.jsp : 게시판 목록 페이지
  - content.jsp : 게시글 내용 보기 페이지
  - modify.jsp : 게시글 내용 수정 페이지
  - paging.jsp : 게시판 페이징 처리 페이지
  - write.jsp : 게시글 쓰기 페이지

- business
  - about.jsp : 회사 소개 페이지

- error : 오류 폴더
  - 404.jsp : 404 오류 발생 시 나타나는 페이지
  - 500.jsp : 500 오류 발생 시 나타나는 페이지
  - errorLayout.jsp : 오류 페이지 레이아웃

- gallary
  - interior.jsp : 각 지점 인테리어 이미지 페이지

- member : 회원 폴더
  - mem_delete.jsp : 회원탈퇴 페이지
  - mem_findpw.jsp : 비밀번호 찾기 페이지
  - mem_membership.jsp : 회원 멤버십 결제 내역 페이지
  - mem_modify.jsp : 회원정보 수정 페이지
  - mem_ordered.jsp : 회원 주문 내역 페이지
  - sign_in.jsp : 로그인 페이지
  - sign_up.jsp : 회원가입 페이지
  - terms_of_mem.jsp : 가입 시 회원 정보 이용 동의 내역 페이지

- payment : 결제 폴더
  - membership.jsp : 멤버십 가입 페이지
  - order.jsp : 주문하기 페이지

- tiles : 페이지 분할 폴더(tiles framework)
  - bottom.jsp : 하단 페이지 레이아웃
  - content.jsp : 중앙 페이지 레이아웃
  - Top.jsp : 상단 페이지 레이아웃

- 0index.jsp : 메인 페이지 레이아웃
