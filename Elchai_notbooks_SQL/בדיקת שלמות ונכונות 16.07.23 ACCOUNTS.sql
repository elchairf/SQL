--- בדיקת שלמות ונכונות פרוייקט חברה -----
--חשבונות---
---הסבת מערכת מידע-----
---בדיקות שלמות------


------------------------------------------------העברת נתונים במקור אל מול היעד---------

	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) ,B.[מספר תיק]) MIS_TIK,
	CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) AS  FMR ,B.[מספר תיק],H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table
    --INTO FINDINGS_בדיקה1
    --פקודה זאת תהיה במקרה שנרצה ליצור טבלה חדשה
	FROM [dbo].[FMR_MAKOR_NEW] as A  
    left Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
    ON CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
    Full outer Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B
	ON  CAST( H.[מספר תיק דנאל] AS nvarchar) = B.[מספר תיק]
     WHERE CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)  IS NOT NULL
	 AND B.[מספר תיק] IS  NULL

-------------------------------------העברת נתונים- ביעד אל מול המקור בדיקה 2-------------

    DROP table if exists FINDINGS_בדיקה1
	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק],H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table
    --INTO FINDINGS_בדיקה1
	FROM [dbo].[FMR_MAKOR_NEW] as A
    Left Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 ON CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
    Full outer Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B
	On CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]
    WHERE CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) IS NULL AND B.[מספר תיק] IS NOT NULL

  -----------------------העברת נתונים- במקור אל מול היעד בדיקה 1-----------------------------------

   DROP table if exists FINDINGS_בדיקה2
	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק],H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table			
    --INTO FINDINGS_בדיקה2
	FROM [dbo].[FMR_MAKOR_NEW] as A
    LEFT JOIN
		(SELECT [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 ON CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
   Full OUTER JOIN 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B
	ON CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]
	 WHERE CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) IS NOT NULL AND B.[מספר תיק] IS  NULL	 

	 --------------------העברת נתונים-טבלת המרה אל מול מקור- בדיקה 3----------------------------------

	 DROP table if exists FINDINGS_בדיקה3
	  SELECT  CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table
     --INTO FINDINGS_בדיקה3  
    FROM [PSAGOT_FMR].[dbo].[FMR_MAKOR_NEW] as A
    FULL OUTER Join
        (SELECT [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     ON CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
	 WHERE CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) IS NULL AND H.[מספר תיק אפ#אמ#אר] IS NOT NULL

---------------העברת נתונים-מקור אל מול טבלת המרה-בדיקה 4-----------------------

   DROP table if exists FINDINGS_בדיקה4
   SELECT  CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table
  --INTO FINDINGS_בדיקה4  
    FROM 
	(SELECT * FROM [PSAGOT_FMR_NEW].[dbo].[FMR_MAKOR_NEW] WHERE [מס. חשבון פסגות   (אפ.אמ.אר)] IS NOT NULL)as A
    FULL OUTER Join
        (SELECT [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
    ON CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
    WHERE CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) IS NOT NULL AND H.[מספר תיק אפ#אמ#אר] IS NULL

	 -------------------------העברת נתונים-טבלת המרה אל מול יעד בדיקה 5---------------

   DROP table if exists FINDINGS_בדיקה5 
   SELECT  H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table,CAST( H.[מספר תיק דנאל] AS nvarchar) danel_file_hamara_table,A.[מספר תיק]
   --INTO FINDINGS_בדיקה5  
    FROM  [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as A
    FULL OUTER Join
        (SELECT [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on A.[מספר תיק]=CAST( H.[מספר תיק דנאל] AS nvarchar)
	 WHERE A.[מספר תיק]IS  NULL AND CAST( H.[מספר תיק דנאל] AS nvarchar) IS NOT NULL

	 -------------------------העברת נתונים-יעד אל מול טבלת המרה בדיקה 6------------------------------

	   DROP table if exists FINDINGS_בדיקה6
	    SELECT  H.[מספר תיק אפ#אמ#אר] as fmr_file_hamara_table,CAST( H.[מספר תיק דנאל] AS nvarchar) danel_file_hamara_table,A.[מספר תיק]
   	--INTO FINDINGS_בדיקה6
    FROM  [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as A
    FULL OUTER Join
        (SELECT [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     ON A.[מספר תיק]=CAST( H.[מספר תיק דנאל] AS nvarchar)
	 WHERE A.[מספר תיק]IS NOT NULL AND CAST( H.[מספר תיק דנאל] AS nvarchar) IS  NULL

   -----------בדיקות נכונות---------------------

------------------------------------------------------------------לבסוף לא נבדק-----שם חשבון----------------------

    DROP table if exists FINDINGS_חשבון
	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK
			,*
    --INTO FINDINGS_חשבון
	FROM [dbo].[FMR_MAKOR_NEW] as A
    LEFT JOIN
		(SELECT [מספר תיק אפ#אמ#אר],[מספר תיק דנאל],[שם חשבון] as [חשבון]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 ON CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
    Full outer Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B
	ON CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]
	where 1=1
	and B.[מספר תיק] is not null 
	and CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) is not null
	and H.[חשבון]<>B.[שם חשבון]

	---------------------------------------------------------תאריך פתיחה---------------------

       DROP table if exists FINDINGS_פתיחה
	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.SDATE,B.[מספר תיק],B.[תאריך פתיחה]
  --INTO FINDINGS_פתיחה
	FROM (select * 
			,datefromparts(left([תאריך פתיחת חשבון (חובה)],4),substring([תאריך פתיחת חשבון (חובה)],5,2),right([תאריך פתיחת חשבון (חובה)],2)) as SDATE
			FROM [dbo].[FMR_MAKOR_NEW]) as A
      lLEFT JOIN
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	

	and  A.SDATE<>B.[תאריך פתיחה]

	-------------------------------------קוד סיווג ניירות ערך-------------לבדוק----------------------------------------

DROP table if exists FINDINGS_קוד_סיווג_ניירות_ערך



SELECT DISTINCT T.[מס. חשבון פסגות   (אפ.אמ.אר)],T.SIVUG,T.[קוד סיווג ני"ע  (חובה)],T.[מספר תיק],T.[קוד סיווג ני"ע]
FROM

(
SELECT CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) as [מס. חשבון פסגות   (אפ.אמ.אר)] ,A.SIVUG,A.[קוד סיווג ני"ע  (חובה)],B.[מספר תיק],B.[קוד סיווג ני"ע]
--INTO FINDINGS_קוד_סיווג_ניירות_ערך
	 
		FROM( select *
		,case
			when string='4' then N'טופס מסגרת נע"ז'
			when string='11' then N'הסכם מעו"ף (חדש 2016), טופס מסגרת נע"ז'
			when string>'20' then N'הסכם מעו"ף (חדש 2016), ניהול תיק - יפוי כח בני"ע ובמט"י (כולל ני"ע זרים והוראות קנייה ומכירה של מט"ח למסירה מיידית), ניהול תיק - יפוי כח במט"ח ובעסקאות עתידיות, ניהול תיק - יפוי כח במעוף ובחוזים עתידיים'
		End as SIVUG
	        FROM(SELECT *,len( [קוד סיווג ני"ע  (חובה)]) as string
                 FROM [PSAGOT_FMR_NEW].[dbo].[FMR_MAKOR_NEW]) as M )as A
	left Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	
	and ISNULL( A.SIVUG, 0) <>ISNULL(B.[קוד סיווג ני"ע],0)

	) AS T


	


		---------------------------------------------------------תוקף סיווג---------------------

DROP table if exists FINDINGS_ת_סיווג


	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.[תאריך תוקף סיווג (חובה)],B.[מספר תיק],B.T_SIVUG,B.[תאריך תוקף סיווג]
			

--INTO FINDINGS_ת_סיווג
	FROM (select * 	FROM [dbo].[FMR_MAKOR_NEW]) as A
left Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join 

	(select *
			, T_SIVUG= cast(year([תאריך תוקף סיווג]) as nvarchar) + cast(month([תאריך תוקף סיווג]) as nvarchar) + cast(day([תאריך תוקף סיווג])  as nvarchar)
			FROM [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3]) as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	
	

	and  ISNULL (A.[תאריך תוקף סיווג (חובה)],0)<>ISNULL(B.T_SIVUG,0)





	       -----------------------------------------------------------------------תאריך דיווח פטור----------------------

	DROP table if exists FINDINGS_תאריך_דיווח


    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.SDATE,A.[תאריך דיווח פטור של החשבון על ידי מס הכנסה (חובה לפטור)],B.[מספר תיק],B.[תאריך דיווח פטור ]
            

    --INTO FINDINGS_תאריך_דיווח

	    FROM (select *
            ,datefromparts(left([תאריך דיווח פטור של החשבון על ידי מס הכנסה (חובה לפטור)],4),substring([תאריך דיווח פטור של החשבון על ידי מס הכנסה (חובה לפטור)],5,2),right([תאריך דיווח פטור של החשבון על ידי מס הכנסה (חובה לפטור)],2)) AS SDATE
            FROM [dbo].[FMR_MAKOR_NEW]) as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

    Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
    
	   
	   and ISNULL( A.SDATE,'')<> ISNULL( B.[תאריך דיווח פטור ],'')


	-----------------------------------------------------------------------אחוז מס דיבידנד----------------------

DROP table if exists FINDINGS_דיבידנד


	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.[אחוז מס דיבנד (חובה)],B.[מספר תיק],B.[אחוז מס דיבידנד]
			

--INTO FINDINGS_דיבידנד
	FROM [dbo].[FMR_MAKOR_NEW] as A
left Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	

	and ISNULL(A.[אחוז מס דיבנד (חובה)],0)<>ISNULL(B.[אחוז מס דיבידנד],0)


		-----------------------------------------------------------------------אחוז מס ריבית----------------------


DROP table if exists FINDINGS_ריבית


	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK ,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.[אחוז מס ריבית (חובה)],B.[מספר תיק],B.[אחוז מס ריבית]
			

--INTO FINDINGS_ריבית
	FROM [dbo].[FMR_MAKOR_NEW] as A
Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	
	and ISNULL( A.[אחוז מס ריבית (חובה)],0)<>ISNULL(B.[אחוז מס ריבית],0)


			-----------------------------------------------------------------------אחוז מס תמורה----------------------


DROP table if exists FINDINGS_תמורה


	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK
			,*

--INTO FINDINGS_תמורה
	FROM [dbo].[FMR_MAKOR_NEW] as A
Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל],[שם חשבון] as [חשבון]
		FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	

	and ISNULL( A.[אחוז מס תמורה (חובה)],0)<>ISNULL(B.[אחוז מס תמורה],0)


	        

	-----------------------------------------------לא צריך------------------------חבר בורסה----------------------


DROP table if exists FINDINGS_בורסה


	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,*
			

INTO FINDINGS_בורסה
	FROM (select *
			,case	
				when [קוד חבר בורסה  (חובה)]='1' then 'פתיחת חשבון'
				end as HAVER 
				FROM[dbo].[FMR_MAKOR_NEW]) as A
Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל],[שם חשבון] as [חשבון]
		FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

Full outer Join 

	[PSAGOT_FMR].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	and B.[מספר תיק] is not null 
	and CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) is not null

	and A.HAVER<>B.[סטטוס חבר בורסה] 


				-----------------------------------------------------------------------חשבון במערכת סגורה----------------------


DROP table if exists FINDINGS_מערכת

  
SELECT DISTINCT T.[מס. חשבון פסגות   (אפ.אמ.אר)],T.MAAREHET,T.[חשבון במערכת סגורה (חובה)],T.[מספר תיק],T.[חשבון במערכת סגורה]
FROM

(

  SELECT *
	--SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) AS [מס. חשבון פסגות   (אפ.אמ.אר)] ,B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.MAAREHET,A.[חשבון במערכת סגורה (חובה)],B.[מספר תיק],B.[חשבון במערכת סגורה]
			

--INTO FINDINGS_מערכת
	FROM (select *
				,case
					when [חשבון במערכת סגורה (חובה)] ='0' then N'מערכת פתוחה'
					when [חשבון במערכת סגורה (חובה)] ='1' then N'מערכת סגורה'
				End as MAAREHET
			FROM [dbo].[FMR_MAKOR_NEW]) as A
Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	

	and ISNULL(A.MAAREHET,0)<>ISNULL(B.[חשבון במערכת סגורה],0)


	) AS T

					----------------------------------------------------------------------- נעשה ידנית קוד פקיד שומה----------------------





DROP table if exists FINDINGS_שומה


	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK
			

--INTO FINDINGS_שומה

	FROM 
	
	
	[dbo].[FMR_MAKOR_NEW] as A

Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]


 Join 

	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

	where 1=1
	

	and isnull(A.[קוד פקיד שומה (חובה לפטור)],0)<>ISNULL(B.[קוד פקיד שומה],0) 




	-----------------------------------------------------------------------אינדיקציה מלכ"ר----------------------



    DROP table if exists FINDINGS_חשבון

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.MALKAR,[אינדיקציה מלכ"ר (חובה)],B.[מספר תיק],B.[אינדיקציה מלכ"ר]
    --INTO FINDINGS_חשבון

	FROM (select *
				,case
					when [אינדיקציה מלכ"ר (חובה)] =N'לא מלכ"ר' then N'אינו מלכ"ר'
					else [אינדיקציה מלכ"ר (חובה)]
				End as MALKAR
			FROM [dbo].[FMR_MAKOR_NEW]) as A

Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
    
    and ISNULL(A.MALKAR,'')<>ISNULL(B.[אינדיקציה מלכ"ר],'')


		-----------------------------------------------------------------------תיק מס הכנס/מעמ----------------------
	

   DROP table if exists FINDINGS_חשבון

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) ,A.[תיק מס הכנסה / מע"מ (חובה לפטור)],B.[מספר תיק],B.[תיק מס הכנסה/מעמ]

    --INTO FINDINGS_חשבון
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
   
    and ISNULL (A.[תיק מס הכנסה / מע"מ (חובה לפטור)],0)<>ISNULL(B.[תיק מס הכנסה/מעמ],0)


	-----------------------------------------------------------------------סיווג לקוח למס (חובה)----------------------


	DROP table if exists FINDINGS_סיווג

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.SIVUG,A.[סיווג לקוח למס (חובה)],B.[מספר תיק],B.[סיווג לקוח למס]
	
  
  --INTO FINDINGS_סיווג
    FROM(select *
				,case 
					when [סיווג לקוח למס (חובה)]= '10' then N'יחיד תושב הארץ/עולה חדש'
					when [סיווג לקוח למס (חובה)]= '20' then N'תאגיד תושב הארץ'
					when [סיווג לקוח למס (חובה)]= '30' then N'יחיד תושב חוץ'
					when [סיווג לקוח למס (חובה)]= '40' then N'תאגיד תושב חוץ'
					when [סיווג לקוח למס (חובה)]= '100' then N'רשות מקומית: עירייה, איגוד ערים, מועצה דתית/חברת ביטול, מוסד לאומי: הסוכנות היהודית, ההסתדרות הציונית העולמית, הקרן הקיימת, קרן היסוד'
				End as SIVUG
		FROM [dbo].[FMR_MAKOR_NEW] )as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
 
    and ISNULL( A.SIVUG ,0) <> ISNULL(  B.[סיווג לקוח למס],0) 


	----------------------------------------------------------חתם חל 66-------------עסקאות במטבע----------------------


	DROP table if exists FINDINGS_עסקאות

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.ISKA,A.[עסקאות במטבע (עסקאות בנגרים) (חובה)],B.[מספר תיק],B.[עסקאות במטבע]
	
  
   --INTO FINDINGS_עסקאות
    FROM
		(select *
				,case 
					when [עסקאות במטבע (עסקאות בנגרים) (חובה)]= '0' then N'לא חתם על חל 66'
					when [עסקאות במטבע (עסקאות בנגרים) (חובה)]= '1' then N'חתם על חל 66'
				
				End as ISKA	
				FROM [dbo].[FMR_MAKOR_NEW] ) as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
    
    and ISNULL( A.ISKA,0) <>isnull(B.[עסקאות במטבע],0)


	-----------------------------------------------------------------------סוג חשבון----------------------


	DROP table if exists FINDINGS_סוג

	SELECT DISTINCT T.[מס. חשבון פסגות   (אפ.אמ.אר)],T.SUG,T.[סוג חשבון    (חובה)],T.[מספר תיק],T.[סוג חשבון]

	FROM

	(

	SELECT *
    --SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.SUG,A.[סוג חשבון    (חובה)],B.[מספר תיק],B.[סוג חשבון]
	
  
    --INTO FINDINGS_סוג
    
	FROM (select *
				,case 
					when [סוג חשבון    (חובה)]= '1' then N'רגיל'
					when [סוג חשבון    (חובה)]= '2' then N'מנוהל'
					when [סוג חשבון    (חובה)]= '3' then N'מוסדי'
					when [סוג חשבון    (חובה)]= '4' then N'ללא פעילות ני"ע'
					when [סוג חשבון    (חובה)]= '5' then N'נוסטרו'
				
				End as SUG	
				FROM [dbo].[FMR_MAKOR_NEW]) as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
 
    and ISNULL(A.SUG,0) <>ISNULL(B.[סוג חשבון],0)

	)

	AS T

-----------------------------------------------------------------------מסגרת בשקלים----------------------



	DROP table if exists FINDINGS_מסגרת_שקל

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.[מסגרת בשקלים (חובה)],B.[מספר תיק],B.[מסגרת בשקלים]

  
    --INTO FINDINGS_מסגרת_שקל
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1

    and ISNULL( A.[מסגרת בשקלים (חובה)],0) <> ISNULL( B.[מסגרת בשקלים],0)



-----------------------------------------------------------------------מסגרת בדולר----------------------


	DROP table if exists FINDINGS_מסגרת_דולר

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק],A.[מסגרת בדולרים (חובה)] ,B.[מסגרת בדולרים]
	
  
   --into  FINDINGS_מסגרת_דולר
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM [PSAGOT_FMR].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
  
    and  ISNULL(cast(A.[מסגרת בדולרים (חובה)] as nvarchar),0) <>ISNULL(B.[מסגרת בדולרים],0)

				-----------------------------------------------------------------------אישור ניכוי----------------------


	DROP table if exists FINDINGS_ניכוי

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) ,A.[אישור ניכוי (חובה לפטור)] ,A.[אישור ניכוי (חובה לפטור)] as nvarchar,B.[מספר תיק],B.[אישור ניכוי]
	
  
    --into FINDINGS_ניכוי
    FROM [dbo].[FMR_MAKOR_NEW] as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
  
    and ISNULL( cast(A.[אישור ניכוי (חובה לפטור)] as nvarchar),0)<>ISNULL(B.[אישור ניכוי],0)

	AND( [אישור ניכוי (חובה לפטור)] IS NULL AND B.[אישור ניכוי]='אין אישור')


				-----------------------------------------------------------------------פטור ממס----------------------


	DROP table if exists FINDINGS_פטור_מס

	SELECT DISTINCT T.[מס. חשבון פסגות   (אפ.אמ.אר)],T.PTOR,[האם קיים פטור מאירועי מס בנושא ריט (נושא 2000 סוג תשואה 7) (חובה)],T.[מספר תיק],T.[האם קיים פטור ממס]
	FROM 
	(

    --SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.PTOR,[האם קיים פטור מאירועי מס בנושא ריט (נושא 2000 סוג תשואה 7) (חובה)],B.[מספר תיק],B.[האם קיים פטור ממס]
	SELECT *
  
    --into FINDINGS_פטור_מס
    FROM (select *
				,case 
					when [האם קיים פטור מאירועי מס בנושא ריט (נושא 2000 סוג תשואה 7) (חובה)]= '00' then N'אין פטור'
					when [האם קיים פטור מאירועי מס בנושא ריט (נושא 2000 סוג תשואה 7) (חובה)]= '99' then N'פטור מלא'
				
				End as PTOR
				FROM [dbo].[FMR_MAKOR_NEW] ) as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
  
    and ISNULL( A.PTOR,0) <>ISNULL(B.[האם קיים פטור ממס],0)
	) AS T

					-----------------------------------------------------------------------סוג פטור----------------------


	DROP table if exists FINDINGS_סוג_פטור

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.PTOR,A.[סוג פטור (מכל הנושאים למעט ריט) (חובה)],B.[מספר תיק],B.[סוג פטור]
	
  
    --into FINDINGS_סוג_פטור
    FROM (select *
				,case 
					when [סוג פטור (מכל הנושאים למעט ריט) (חובה)]= '00' then N'אין פטור'
					when [סוג פטור (מכל הנושאים למעט ריט) (חובה)]= '99' then N'פטור מלא'
				
				End as PTOR
				FROM [dbo].[FMR_MAKOR_NEW] ) as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

 Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
   
    and ISNULL( A.PTOR,0) <>ISNULL(B.[סוג פטור],0)

	
					-----------------------------------------------------------------------סיום פטור----------------------


	DROP table if exists FINDINGS_סיום_פטור

    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK ,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.[תאריך סיום פטור של החשבון (חובה לפטור)],A.ENDDATE,B.[מספר תיק],B.[תאריך סיום פטור]
	
  
 --into FINDINGS_סיום_פטור
    FROM (select * 
			,datefromparts(left([תאריך סיום פטור של החשבון (חובה לפטור)],4),substring([תאריך סיום פטור של החשבון (חובה לפטור)],5,2),right([תאריך סיום פטור של החשבון (חובה לפטור)],2)) as ENDDATE
			FROM [dbo].[FMR_MAKOR_NEW])  as A
Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]

Full outer Join

   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B

   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]

   where 1=1
    and B.[מספר תיק] is not null
    and CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) is not null
   
   and ISNULL(A.ENDDATE,'') <>ISNULL(B.[תאריך סיום פטור],'')


   
					-----------------------------------------------------------------------תחילת פטור----------------------

	DROP table if exists FINDINGS_תחילת_פטור
    SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),A.[תאריך תחילת פטור של החשבון (חובה לפטור)],A.SDATE,B.[מספר תיק],B.[תאריך תחילת פטור]
	  
 --into FINDINGS_תחילת_פטור
    FROM (select * 
			,datefromparts(left([תאריך תחילת פטור של החשבון (חובה לפטור)],4),substring([תאריך תחילת פטור של החשבון (חובה לפטור)],5,2),right([תאריך תחילת פטור של החשבון (חובה לפטור)],2)) as SDATE
			FROM [dbo].[FMR_MAKOR_NEW])  as A
    Join
        (select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
        FROM[PSAGOT_FMR].[dbo].[KEYS] ) as H
     on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
   Full outer Join
   [PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B
   on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]
   where 1=1
    and B.[מספר תיק] is not null
    and CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) is not null
   
   and ISNULL(A.SDATE,'') <>ISNULL(B.[תאריך תחילת פטור],'')


		---------------------------------------------------------תאריך סגירה---------------------

    DROP table if exists FINDINGS_סגירה
	SELECT isnull(CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar),B.[מספר תיק]) MIS_TIK,CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar) AS FMR ,A.SDATE,A.[תאריך סגירת חשבון],B.[מספר תיק],B.[תאריך סגירה]
--INTO FINDINGS_סגירה
	FROM (select * 
			,datefromparts(left([תאריך סגירת חשבון],4),substring([תאריך סגירת חשבון],5,2),right([תאריך סגירת חשבון],2)) as SDATE
			FROM [dbo].[FMR_MAKOR_NEW]) as A
left Join
		(select [מספר תיק אפ#אמ#אר],[מספר תיק דנאל]
		FROM[PSAGOT_FMR_NEW].[dbo].[KEYS] ) as H
	 on CAST (A.[מס. חשבון פסגות   (אפ.אמ.אר)] AS nvarchar)=H.[מספר תיק אפ#אמ#אר]
 Join 
	[PSAGOT_FMR_NEW].[dbo].[FMR_ACCOUNTS_3] as B
	on CAST( H.[מספר תיק דנאל] AS nvarchar)=B.[מספר תיק]
	where 1=1
	and  A.SDATE<>B.[תאריך סגירה]
