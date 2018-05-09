create table SOLDESK_contents
    (
    	sc_no number(10) primary key,						-- 고유번호		scs_contents_no join
        sc_category number(10) not null,					-- 분류			ss join
        sc_title varchar2(50 char) not null,				-- 과정명
        sc_teacher number(10) not null,						-- 강사고유번호		st_no join
    	sc_schedule_START date not null,					-- 교육일정(시작)
        sc_schedule_FINISH date not null,					-- 교육일정(끝)
        -- 교육기간은 종료일정에서 시작일정을 뺀 값을 넣음.
        
        sc_week number(3)not null,							-- 교육시간(요일)
        -- 덧샘뺄샘을 이용해서 7개 요일을 자유자제로 선택해서 고를 수 있게끔 설정
			-- 다 더해진 값이 저장됨.
			-- 가장 큰 값을 빼서 0보다 크면 해당 값의 요일이 표시.
			-- 0보다 작으면 그다음 큰 값을 뺌.
			-- 0이 될 때까지 반복.
		-- 월:1, 화:2, 수:4, 목:8, 금:16, 토:32, 일:64
		-- 모두 선택할 시, 127이 저장됨.
        sc_capacity number(3) not null,						-- 수강정원
        
        sc_expense number(10) not null						-- 교육비
    );
    
create table SOLDESK_contents_substance
	(
		scs_no number(10) primary key,						-- 고유번호
		scs_contents_no number(10) not null,				-- 과정번호		sc_no join
		scs_order number(2) not null,						-- 소내용 순서
		scs_title varchar2(20 char) not null,				-- 소내용 제목
		scs_info varchar2(4000) not null					-- 소내용 내용
	);

create table SOLDESK_teacher
    (
        st_no number(10) primary key,						-- 고유번호
        st_name varchar2(10 char) not null,					-- 강사명			sc_teacher join
        st_photo varchar2(4000) not null,					-- 강사사진
        st_resume varchar2(4000) not null,					-- 경력사항
        st_certificate varchar2(4000) not null				-- 자격증
    );
    
create sequence SOLDESK_contents_seq;
create sequence SOLDESK_contents_substance_seq;
create sequence SOLDESK_teacher_seq;
    
insert into SOLDESK_contents values
	(
		1,													-- 고유번호		scs_contents_no join
        1,													-- 분류번호		ss join
        '자바 보안코딩 빅데이터개발 양성과정',							-- 과정명
        1,													-- 강사고유번호 		st_no join
    	to_date('2018.04.24(09:30)','yyyy.mm.dd(hh24:mi)'),	-- 교육일정(시작)
    	to_date('2018.10.26(18:30)','yyyy.mm.dd(hh24:mi)'),	-- 교육일정(끝)
        31,--1/2/4/8/16/32/64								-- 교육시간(요일)
        30,													-- 수강정원
        0													-- 교육비
	);
    
insert into SOLDESK_teacher values
    (
        1,													-- 고유번호
        '엄기흥',												-- 강사명			sc_teacher join
        'http://www.soldesk.co.kr/images/pt!tcUGH.png',		-- 강사사진
        '- 숭실 대학교 정보과학 대학원 공학 석사',						-- 경력사항
        '- 직업 능력 개발 훈련 교사(서울 고용 노동청: 정보처리/사무자동화/멀티미디어)'-- 자격증
    );
    
insert into SOLDESK_teacher values
    (
        2,													-- 고유번호
        '양기석',												-- 강사명			sc_teacher join
        'http://www.soldesk.co.kr/images/pt!tcYKS.png',		-- 강사사진
        '- (주) 한빛이엔아이 전임강사',								-- 경력사항
        '- 직업능력개발 훈련교사(정보기술 개발, 정보기술 운영, 정보기술 관리)'	-- 자격증
    );

insert into SOLDESK_contents_substance values
	(
		1,													-- 고유번호
		1,													-- 과정 고유번호		sc_no join
		1,													-- 소내용 순서
		'훈련목표',											-- 소내용 제목
		'- 자바 기반 머신러닝을 학습하여 실무 프로젝트를 수행 할 수 있는 능력 함양을 목표로 한다.'-- 소내용 내용
	);

insert into SOLDESK_contents_substance values
	(
		2,													-- 고유번호
		1,													-- 과정 고유번호		sc_no join
		2,													-- 소내용 순서
		'진출분야',											-- 소내용 제목
		'- 웹 프로그래밍 개발자'									-- 소내용 내용
	);
	
insert into SOLDESK_contents_substance values
	(
		3,													-- 고유번호
		1,													-- 과정 고유번호		sc_no join
		3,													-- 소내용 순서
		'강사 프로필',											-- 소내용 제목
		'[[[강사]]]'												-- 소내용 내용
	);

insert into SOLDESK_contents_substance values
	(
		4,													-- 고유번호
		1,													-- 과정 고유번호		sc_no join
		4,													-- 소내용 순서
		'BigData의 개요',											-- 소내용 제목
		'{{{http://www.soldesk.co.kr/images/img!Bigdata.png}}}'-- 소내용 내용
	);
	
select * from SOLDESK_CONTENTS;
select * from SOLDESK_CONTENTS_SUBSTANCE;
select * from SOLDESK_TEACHER;

UPDATE SOLDESK_contents_substance 
	SET 
		scs_info = '[[[강사]]]' 
	WHERE 
		scs_no = 3;

select * 
	from 
		SOLDESK_CONTENTS, 
		SOLDESK_CONTENTS_SUBSTANCE, 
		SOLDESK_TEACHER
	where 
		sc_no = scs_contents_no 
		and 
		sc_teacher = st_no
	order by scs_order;