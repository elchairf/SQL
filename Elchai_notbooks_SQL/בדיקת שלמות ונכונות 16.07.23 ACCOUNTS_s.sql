--- ����� ����� ������� ������� ���� -----
--�������---
---���� ����� ����-----
---������ �����------
--����� ����� ����� ����� ���� ������ ���� ��� ����� ������ ����� �� ������� ���� ���� ������� �� ����� ���� ���� ���� ����� ����� ����

------------------------------------------------����� ������ ����� �� ��� ����---------

	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) ,B.[���� ���]) MIS_TIK,
	CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) AS  FMR ,B.[���� ���],H.[���� ��� ����#������#����] as fmr_file_hamara_table
    --INTO FINDINGS_�����1
    --����� ��� ���� ����� ����� ����� ���� ����
	FROM [dbo].[FMR_MAKOR_NEW] as A  
    left Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
    ON CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
    Full outer Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B
	ON  CAST( H.[���� ��� ���� ������ ���] AS nvarchar) = B.[���� ���]
     WHERE CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)  IS NOT NULL
	 AND B.[���� ���] IS  NULL

-------------------------------------����� ������- ���� �� ��� ����� ����� 2-------------

    DROP table if exists FINDINGS_�����1
	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���],H.[���� ��� ����#������#����] as fmr_file_hamara_table
    --INTO FINDINGS_�����1
	FROM [dbo].[FMR_MAKOR_NEW] as A
    Left Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 ON CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
    Full outer Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B
	On CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]
    WHERE CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) IS NULL AND B.[���� ���] IS NOT NULL

  -----------------------����� ������- ����� �� ��� ���� ����� 1-----------------------------------

   DROP table if exists FINDINGS_�����2
	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���],H.[���� ��� ����#������#����] as fmr_file_hamara_table			
    --INTO FINDINGS_�����2
	FROM [dbo].[FMR_MAKOR_NEW] as A
    LEFT JOIN
		(SELECT [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 ON CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
   Full OUTER JOIN 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B
	ON CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]
	 WHERE CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) IS NOT NULL AND B.[���� ���] IS  NULL	 

	 --------------------����� ������-���� ���� �� ��� ����- ����� 3----------------------------------

	 DROP table if exists FINDINGS_�����3
	  SELECT  CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),H.[���� ��� ����#������#����] as fmr_file_hamara_table
     --INTO FINDINGS_�����3  
    FROM [PSAGOT_FMR].[dbo].[FMR_MAKOR_NEW] as A
    FULL OUTER Join
        (SELECT [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     ON CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
	 WHERE CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) IS NULL AND H.[���� ��� ����#������#����] IS NOT NULL

---------------����� ������-���� �� ��� ���� ����-����� 4-----------------------

   DROP table if exists FINDINGS_�����4
   SELECT  CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),H.[���� ��� ����#������#����] as fmr_file_hamara_table
  --INTO FINDINGS_�����4  
    FROM 
	(SELECT * FROM [PSAGOT_FMR_NEW].[dbo].[FMR_MAKOR_NEW] WHERE [��. ����� ���� ������   (���� ����)] IS NOT NULL)as A
    FULL OUTER Join
        (SELECT [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
    ON CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
    WHERE CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) IS NOT NULL AND H.[���� ��� ����#������#����] IS NULL

	 -------------------------����� ������-���� ���� �� ��� ��� ����� 5---------------

   DROP table if exists FINDINGS_�����5 
   SELECT  H.[���� ��� ����#������#����] as fmr_file_hamara_table,CAST( H.[���� ��� ���� ������ ���] AS nvarchar) danel_file_hamara_table,A.[���� ���]
   --INTO FINDINGS_�����5  
    FROM  [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as A
    FULL OUTER Join
        (SELECT [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on A.[���� ���]=CAST( H.[���� ��� ���� ������ ���] AS nvarchar)
	 WHERE A.[���� ���]IS  NULL AND CAST( H.[���� ��� ���� ������ ���] AS nvarchar) IS NOT NULL

	 -------------------------����� ������-��� �� ��� ���� ���� ����� 6------------------------------

	   DROP table if exists FINDINGS_�����6
	    SELECT  H.[���� ��� ����#������#����] as fmr_file_hamara_table,CAST( H.[���� ��� ���� ������ ���] AS nvarchar) danel_file_hamara_table,A.[���� ���]
   	--INTO FINDINGS_�����6
    FROM  [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as A
    FULL OUTER Join
        (SELECT [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     ON A.[���� ���]=CAST( H.[���� ��� ���� ������ ���] AS nvarchar)
	 WHERE A.[���� ���]IS NOT NULL AND CAST( H.[���� ��� ���� ������ ���] AS nvarchar) IS  NULL

   -----------������ ������---------------------

------------------------------------------------------------------����� �� ����-----�� �����----------------------

    DROP table if exists FINDINGS_�����
	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK
			,*
    --INTO FINDINGS_�����
	FROM [dbo].[FMR_MAKOR_NEW] as A
    LEFT JOIN
		(SELECT [���� ��� ����#������#����],[���� ��� ���� ������ ���],[�� �����] as [�����]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 ON CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
    Full outer Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B
	ON CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]
	where 1=1
	and B.[���� ���] is not null 
	and CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) is not null
	and H.[�����]<>B.[�� �����]

	---------------------------------------------------------����� �����---------------------

       DROP table if exists FINDINGS_�����
	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.SDATE,B.[���� ���],B.[����� �����]
  --INTO FINDINGS_�����
	FROM (select * 
			,datefromparts(left([����� ����� ����� (����)],4),substring([����� ����� ����� (����)],5,2),right([����� ����� ����� (����)],2)) as SDATE
			FROM [dbo].[FMR_MAKOR_NEW]) as A
      lLEFT JOIN
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	

	and  A.SDATE<>B.[����� �����]

	-------------------------------------��� ����� ������ ���-------------�����----------------------------------------

DROP table if exists FINDINGS_���_�����_������_���



SELECT DISTINCT T.[��. ����� ���� ������   (���� ����)],T.SIVUG,T.[��� ����� ��"�  (����)],T.[���� ���],T.[��� ����� ��"�]
FROM

(
SELECT CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) as [��. ����� ���� ������   (���� ����)] ,A.SIVUG,A.[��� ����� ��"�  (����)],B.[���� ���],B.[��� ����� ��"�]
--INTO FINDINGS_���_�����_������_���
	 
		FROM( select *
		,case
			when string='4' then N'���� ����� ��"�'
			when string='11' then N'���� ���"� (��� 2016), ���� ����� ��"�'
			when string>'20' then N'���� ���"� (��� 2016), ����� ��� - ���� �� ���"� ����"� (���� ��"� ���� ������� ����� ������ �� ��"� ������ ������), ����� ��� - ���� �� ���"� �������� �������, ����� ��� - ���� �� ����� ������� �������'
		End as SIVUG
	        FROM(SELECT *,len( [��� ����� ��"�  (����)]) as string
                 FROM [PSAGOT_FMR_NEW].[dbo].[FMR_MAKOR_NEW]) as M )as A
	left Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	
	and ISNULL( A.SIVUG, 0) <>ISNULL(B.[��� ����� ��"�],0)

	) AS T

		---------------------------------------------------------���� �����---------------------
     DROP table if exists FINDINGS_�_�����
     SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.[����� ���� ����� (����)],B.[���� ���],B.T_SIVUG,B.[����� ���� �����]			
    --INTO FINDINGS_�_�����
	FROM (select * 	FROM [dbo].[FMR_MAKOR_NEW]) as A
      left Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
       Join 
	(select *
			, T_SIVUG= cast(year([����� ���� �����]) as nvarchar) + cast(month([����� ���� �����]) as nvarchar) + cast(day([����� ���� �����])  as nvarchar)
			FROM [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3]) as B
	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]
	where 1=1
	and  ISNULL (A.[����� ���� ����� (����)],0)<>ISNULL(B.T_SIVUG,0)

	       -----------------------------------------------------------------------����� ����� ����----------------------

	DROP table if exists FINDINGS_�����_�����


    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.SDATE,A.[����� ����� ���� �� ������ �� ��� �� ����� (���� �����)],B.[���� ���],B.[����� ����� ���� ]
            

    --INTO FINDINGS_�����_�����

	    FROM (select *
            ,datefromparts(left([����� ����� ���� �� ������ �� ��� �� ����� (���� �����)],4),substring([����� ����� ���� �� ������ �� ��� �� ����� (���� �����)],5,2),right([����� ����� ���� �� ������ �� ��� �� ����� (���� �����)],2)) AS SDATE
            FROM [dbo].[FMR_MAKOR_NEW]) as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

    Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
    
	   
	   and ISNULL( A.SDATE,'')<> ISNULL( B.[����� ����� ���� ],'')


	-----------------------------------------------------------------------���� �� �������----------------------

DROP table if exists FINDINGS_�������


	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.[���� �� ����� (����)],B.[���� ���],B.[���� �� �������]
			

--INTO FINDINGS_�������
	FROM [dbo].[FMR_MAKOR_NEW] as A
left Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	

	and ISNULL(A.[���� �� ����� (����)],0)<>ISNULL(B.[���� �� �������],0)


		-----------------------------------------------------------------------���� �� �����----------------------


DROP table if exists FINDINGS_�����


	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK ,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.[���� �� ����� (����)],B.[���� ���],B.[���� �� �����]
			

--INTO FINDINGS_�����
	FROM [dbo].[FMR_MAKOR_NEW] as A
Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	
	and ISNULL( A.[���� �� ����� (����)],0)<>ISNULL(B.[���� �� �����],0)


			-----------------------------------------------------------------------���� �� �����----------------------


DROP table if exists FINDINGS_�����


	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK
			,*

--INTO FINDINGS_�����
	FROM [dbo].[FMR_MAKOR_NEW] as A
Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���],[�� �����] as [�����]
		FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	

	and ISNULL( A.[���� �� ����� (����)],0)<>ISNULL(B.[���� �� �����],0)


	        

	-----------------------------------------------�� ����------------------------��� �����----------------------


DROP table if exists FINDINGS_�����


	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,*
			

INTO FINDINGS_�����
	FROM (select *
			,case	
				when [��� ��� �����  (����)]='1' then '����� �����'
				end as HAVER 
				FROM[dbo].[FMR_MAKOR_NEW]) as A
Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���],[�� �����] as [�����]
		FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

Full outer Join 

	[PSAGOT_FMR].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	and B.[���� ���] is not null 
	and CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) is not null

	and A.HAVER<>B.[����� ��� �����] 


				-----------------------------------------------------------------------����� ������ �����----------------------


DROP table if exists FINDINGS_�����

  
SELECT DISTINCT T.[��. ����� ���� ������   (���� ����)],T.MAAREHET,T.[����� ������ ����� (����)],T.[���� ���],T.[����� ������ �����]
FROM

(

  SELECT *
	--SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) AS [��. ����� ���� ������   (���� ����)] ,B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.MAAREHET,A.[����� ������ ����� (����)],B.[���� ���],B.[����� ������ �����]
			

--INTO FINDINGS_�����
	FROM (select *
				,case
					when [����� ������ ����� (����)] ='0' then N'����� �����'
					when [����� ������ ����� (����)] ='1' then N'����� �����'
				End as MAAREHET
			FROM [dbo].[FMR_MAKOR_NEW]) as A
Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	

	and ISNULL(A.MAAREHET,0)<>ISNULL(B.[����� ������ �����],0)


	) AS T

					----------------------------------------------------------------------- ���� ����� ��� ���� ����----------------------





DROP table if exists FINDINGS_����


	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK
			

--INTO FINDINGS_����

	FROM 
	
	
	[dbo].[FMR_MAKOR_NEW] as A

Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]


 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

	where 1=1
	

	and isnull(A.[��� ���� ���� (���� �����)],0)<>ISNULL(B.[��� ���� ����],0) 




	-----------------------------------------------------------------------��������� ���"�----------------------



    DROP table if exists FINDINGS_�����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.MALKAR,[��������� ���"� (����)],B.[���� ���],B.[��������� ���"�]
    --INTO FINDINGS_�����

	FROM (select *
				,case
					when [��������� ���"� (����)] =N'�� ���"�' then N'���� ���"�'
					else [��������� ���"� (����)]
				End as MALKAR
			FROM [dbo].[FMR_MAKOR_NEW]) as A

Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
    
    and ISNULL(A.MALKAR,'')<>ISNULL(B.[��������� ���"�],'')


		-----------------------------------------------------------------------��� �� ����/���----------------------
	

   DROP table if exists FINDINGS_�����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) ,A.[��� �� ����� / ��"� (���� �����)],B.[���� ���],B.[��� �� �����/���]

    --INTO FINDINGS_�����
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
   
    and ISNULL (A.[��� �� ����� / ��"� (���� �����)],0)<>ISNULL(B.[��� �� �����/���],0)


	-----------------------------------------------------------------------����� ���� ��� (����)----------------------


	DROP table if exists FINDINGS_�����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.SIVUG,A.[����� ���� ��� (����)],B.[���� ���],B.[����� ���� ���]
	
  
  --INTO FINDINGS_�����
    FROM(select *
				,case 
					when [����� ���� ��� (����)]= '10' then N'���� ���� ����/���� ���'
					when [����� ���� ��� (����)]= '20' then N'����� ���� ����'
					when [����� ���� ��� (����)]= '30' then N'���� ���� ���'
					when [����� ���� ��� (����)]= '40' then N'����� ���� ���'
					when [����� ���� ��� (����)]= '100' then N'���� ������: ������, ����� ����, ����� ����/���� �����, ���� �����: ������� �������, �������� ������� �������, ���� ������, ��� �����'
				End as SIVUG
		FROM [dbo].[FMR_MAKOR_NEW] )as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
 
    and ISNULL( A.SIVUG ,0) <> ISNULL(  B.[����� ���� ���],0) 


	----------------------------------------------------------��� �� 66-------------������ �����----------------------


	DROP table if exists FINDINGS_������

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.ISKA,A.[������ ����� (������ ������) (����)],B.[���� ���],B.[������ �����]
	
  
   --INTO FINDINGS_������
    FROM
		(select *
				,case 
					when [������ ����� (������ ������) (����)]= '0' then N'�� ��� �� �� 66'
					when [������ ����� (������ ������) (����)]= '1' then N'��� �� �� 66'
				
				End as ISKA	
				FROM [dbo].[FMR_MAKOR_NEW] ) as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
    
    and ISNULL( A.ISKA,0) <>isnull(B.[������ �����],0)


	-----------------------------------------------------------------------��� �����----------------------


	DROP table if exists FINDINGS_���

	SELECT DISTINCT T.[��. ����� ���� ������   (���� ����)],T.SUG,T.[��� �����    (����)],T.[���� ���],T.[��� �����]

	FROM

	(

	SELECT *
    --SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.SUG,A.[��� �����    (����)],B.[���� ���],B.[��� �����]
	
  
    --INTO FINDINGS_���
    
	FROM (select *
				,case 
					when [��� �����    (����)]= '1' then N'����'
					when [��� �����    (����)]= '2' then N'�����'
					when [��� �����    (����)]= '3' then N'�����'
					when [��� �����    (����)]= '4' then N'��� ������ ��"�'
					when [��� �����    (����)]= '5' then N'������'
				
				End as SUG	
				FROM [dbo].[FMR_MAKOR_NEW]) as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
 
    and ISNULL(A.SUG,0) <>ISNULL(B.[��� �����],0)

	)

	AS T

-----------------------------------------------------------------------����� ������----------------------



	DROP table if exists FINDINGS_�����_���

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.[����� ������ (����)],B.[���� ���],B.[����� ������]

  
    --INTO FINDINGS_�����_���
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1

    and ISNULL( A.[����� ������ (����)],0) <> ISNULL( B.[����� ������],0)



-----------------------------------------------------------------------����� �����----------------------


	DROP table if exists FINDINGS_�����_����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���],A.[����� ������� (����)] ,B.[����� �������]
	
  
   --into  FINDINGS_�����_����
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM [PSAGOT_FMR].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
  
    and  ISNULL(cast(A.[����� ������� (����)] as nvarchar),0) <>ISNULL(B.[����� �������],0)

				-----------------------------------------------------------------------����� �����----------------------


	DROP table if exists FINDINGS_�����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) ,A.[����� ����� (���� �����)] ,A.[����� ����� (���� �����)] as nvarchar,B.[���� ���],B.[����� �����]
	
  
    --into FINDINGS_�����
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
  
    and ISNULL( cast(A.[����� ����� (���� �����)] as nvarchar),0)<>ISNULL(B.[����� �����],0)

	AND( [����� ����� (���� �����)] IS NULL AND B.[����� �����]='��� �����')


				-----------------------------------------------------------------------���� ���----------------------


	DROP table if exists FINDINGS_����_��

	SELECT DISTINCT T.[��. ����� ���� ������   (���� ����)],T.PTOR,[��� ���� ���� ������� �� ����� ��� (���� 2000 ��� ����� 7) (����)],T.[���� ���],T.[��� ���� ���� ���]
	FROM 
	(

    --SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.PTOR,[��� ���� ���� ������� �� ����� ��� (���� 2000 ��� ����� 7) (����)],B.[���� ���],B.[��� ���� ���� ���]
	SELECT *
  
    --into FINDINGS_����_��
    FROM (select *
				,case 
					when [��� ���� ���� ������� �� ����� ��� (���� 2000 ��� ����� 7) (����)]= '00' then N'��� ����'
					when [��� ���� ���� ������� �� ����� ��� (���� 2000 ��� ����� 7) (����)]= '99' then N'���� ���'
				
				End as PTOR
				FROM [dbo].[FMR_MAKOR_NEW] ) as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
  
    and ISNULL( A.PTOR,0) <>ISNULL(B.[��� ���� ���� ���],0)
	) AS T

					-----------------------------------------------------------------------��� ����----------------------


	DROP table if exists FINDINGS_���_����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.PTOR,A.[��� ���� (��� ������� ���� ���) (����)],B.[���� ���],B.[��� ����]
	
  
    --into FINDINGS_���_����
    FROM (select *
				,case 
					when [��� ���� (��� ������� ���� ���) (����)]= '00' then N'��� ����'
					when [��� ���� (��� ������� ���� ���) (����)]= '99' then N'���� ���'
				
				End as PTOR
				FROM [dbo].[FMR_MAKOR_NEW] ) as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
   
    and ISNULL( A.PTOR,0) <>ISNULL(B.[��� ����],0)

	
					-----------------------------------------------------------------------���� ����----------------------


	DROP table if exists FINDINGS_����_����

    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK ,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.[����� ���� ���� �� ������ (���� �����)],A.ENDDATE,B.[���� ���],B.[����� ���� ����]
	
  
 --into FINDINGS_����_����
    FROM (select * 
			,datefromparts(left([����� ���� ���� �� ������ (���� �����)],4),substring([����� ���� ���� �� ������ (���� �����)],5,2),right([����� ���� ���� �� ������ (���� �����)],2)) as ENDDATE
			FROM [dbo].[FMR_MAKOR_NEW])  as A
Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]

Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]

   where 1=1
    and B.[���� ���] is not null
    and CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) is not null
   
   and ISNULL(A.ENDDATE,'') <>ISNULL(B.[����� ���� ����],'')


   
					-----------------------------------------------------------------------����� ����----------------------

	DROP table if exists FINDINGS_�����_����
    SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),A.[����� ����� ���� �� ������ (���� �����)],A.SDATE,B.[���� ���],B.[����� ����� ����]
	  
 --into FINDINGS_�����_����
    FROM (select * 
			,datefromparts(left([����� ����� ���� �� ������ (���� �����)],4),substring([����� ����� ���� �� ������ (���� �����)],5,2),right([����� ����� ���� �� ������ (���� �����)],2)) as SDATE
			FROM [dbo].[FMR_MAKOR_NEW])  as A
    Join
        (select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
        FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
     on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
   Full outer Join
   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B
   on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]
   where 1=1
    and B.[���� ���] is not null
    and CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) is not null
   
   and ISNULL(A.SDATE,'') <>ISNULL(B.[����� ����� ����],'')


		---------------------------------------------------------����� �����---------------------

    DROP table if exists FINDINGS_�����
	SELECT isnull(CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar),B.[���� ���]) MIS_TIK,CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar) AS FMR ,A.SDATE,A.[����� ����� �����],B.[���� ���],B.[����� �����]
--INTO FINDINGS_�����
	FROM (select * 
			,datefromparts(left([����� ����� �����],4),substring([����� ����� �����],5,2),right([����� ����� �����],2)) as SDATE
			FROM [dbo].[FMR_MAKOR_NEW]) as A
left Join
		(select [���� ��� ����#������#����],[���� ��� ���� ������ ���]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[��. ����� ���� ������   (���� ����)] AS nvarchar)=H.[���� ��� ����#������#����]
 Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B
	on CAST( H.[���� ��� ���� ������ ���] AS nvarchar)=B.[���� ���]
	where 1=1
	and  A.SDATE<>B.[����� �����]
