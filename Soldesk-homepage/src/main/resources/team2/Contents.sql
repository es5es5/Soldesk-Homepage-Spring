create table SOLDESK_contents
    (
    	sc_no number(10) primary key,						-- ������ȣ		scs_contents_no join
        sc_category number(10) not null,					-- �з�			ss join
        sc_title varchar2(50 char) not null,				-- ������
        sc_teacher number(10) not null,						-- ���������ȣ		st_no join
    	sc_schedule_START date not null,					-- ��������(����)
        sc_schedule_FINISH date not null,					-- ��������(��)
        -- �����Ⱓ�� ������������ ���������� �� ���� ����.
        
        sc_week number(3)not null,							-- �����ð�(����)
        -- ���������� �̿��ؼ� 7�� ������ ���������� �����ؼ� �� �� �ְԲ� ����
			-- �� ������ ���� �����.
			-- ���� ū ���� ���� 0���� ũ�� �ش� ���� ������ ǥ��.
			-- 0���� ������ �״��� ū ���� ��.
			-- 0�� �� ������ �ݺ�.
		-- ��:1, ȭ:2, ��:4, ��:8, ��:16, ��:32, ��:64
		-- ��� ������ ��, 127�� �����.
        sc_capacity number(3) not null,						-- ��������
        
        sc_expense number(10) not null						-- ������
    );
    
create table SOLDESK_contents_substance
	(
		scs_no number(10) primary key,						-- ������ȣ
		scs_contents_no number(10) not null,				-- ������ȣ		sc_no join
		scs_order number(2) not null,						-- �ҳ��� ����
		scs_title varchar2(20 char) not null,				-- �ҳ��� ����
		scs_info varchar2(4000) not null					-- �ҳ��� ����
	);

create table SOLDESK_teacher
    (
        st_no number(10) primary key,						-- ������ȣ
        st_name varchar2(10 char) not null,					-- �����			sc_teacher join
        st_photo varchar2(4000) not null,					-- �������
        st_resume varchar2(4000) not null,					-- ��»���
        st_certificate varchar2(4000) not null				-- �ڰ���
    );
    
create sequence SOLDESK_contents_seq;
create sequence SOLDESK_contents_substance_seq;
create sequence SOLDESK_teacher_seq;
    
insert into SOLDESK_contents values
	(
		1,													-- ������ȣ		scs_contents_no join
        1,													-- �з���ȣ		ss join
        '�ڹ� �����ڵ� �����Ͱ��� �缺����',							-- ������
        1,													-- ���������ȣ 		st_no join
    	to_date('2018.04.24(09:30)','yyyy.mm.dd(hh24:mi)'),	-- ��������(����)
    	to_date('2018.10.26(18:30)','yyyy.mm.dd(hh24:mi)'),	-- ��������(��)
        31,--1/2/4/8/16/32/64								-- �����ð�(����)
        30,													-- ��������
        0													-- ������
	);
    
insert into SOLDESK_teacher values
    (
        1,													-- ������ȣ
        '������',												-- �����			sc_teacher join
        'http://www.soldesk.co.kr/images/pt!tcUGH.png',		-- �������
        '- ���� ���б� �������� ���п� ���� ����',						-- ��»���
        '- ���� �ɷ� ���� �Ʒ� ����(���� ��� �뵿û: ����ó��/�繫�ڵ�ȭ/��Ƽ�̵��)'-- �ڰ���
    );
    
insert into SOLDESK_teacher values
    (
        2,													-- ������ȣ
        '��⼮',												-- �����			sc_teacher join
        'http://www.soldesk.co.kr/images/pt!tcYKS.png',		-- �������
        '- (��) �Ѻ��̿����� ���Ӱ���',								-- ��»���
        '- �����ɷ°��� �Ʒñ���(������� ����, ������� �, ������� ����)'	-- �ڰ���
    );

insert into SOLDESK_contents_substance values
	(
		1,													-- ������ȣ
		1,													-- ���� ������ȣ		sc_no join
		1,													-- �ҳ��� ����
		'�Ʒø�ǥ',											-- �ҳ��� ����
		'- �ڹ� ��� �ӽŷ����� �н��Ͽ� �ǹ� ������Ʈ�� ���� �� �� �ִ� �ɷ� �Ծ��� ��ǥ�� �Ѵ�.'-- �ҳ��� ����
	);

insert into SOLDESK_contents_substance values
	(
		2,													-- ������ȣ
		1,													-- ���� ������ȣ		sc_no join
		2,													-- �ҳ��� ����
		'����о�',											-- �ҳ��� ����
		'- �� ���α׷��� ������'									-- �ҳ��� ����
	);
	
insert into SOLDESK_contents_substance values
	(
		3,													-- ������ȣ
		1,													-- ���� ������ȣ		sc_no join
		3,													-- �ҳ��� ����
		'���� ������',											-- �ҳ��� ����
		'[[[����]]]'												-- �ҳ��� ����
	);

insert into SOLDESK_contents_substance values
	(
		4,													-- ������ȣ
		1,													-- ���� ������ȣ		sc_no join
		4,													-- �ҳ��� ����
		'BigData�� ����',											-- �ҳ��� ����
		'{{{http://www.soldesk.co.kr/images/img!Bigdata.png}}}'-- �ҳ��� ����
	);
	
select * from SOLDESK_CONTENTS;
select * from SOLDESK_CONTENTS_SUBSTANCE;
select * from SOLDESK_TEACHER;

UPDATE SOLDESK_contents_substance 
	SET 
		scs_info = '[[[����]]]' 
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