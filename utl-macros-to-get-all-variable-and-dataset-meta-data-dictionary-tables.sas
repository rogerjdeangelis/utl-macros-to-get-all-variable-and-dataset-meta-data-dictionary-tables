%let pgm=utl-macros-to-get-all-variable-and-dataset-meta-data-dictionary-tables;

%stop_submission;

Macros to get all variable and dataset meta data dictionary tables

Instead of macro functions to return just one table or column attribute,
these two macros return all the 'usefull' meta atrributes.

Macros to get all variable and dataset meta data within post and in github


          SOLUTIONS (although I create global macro variables with a macro, may be it is ok for meta data)

            1 Macro table meta data macro -- utl_getTable
               section to reset enviroment -- for testing and rerunnig
            2 Macro colum meta data macro utl_getColumn(sashelp,class,sex)
               section to reset enviroment for testing and rerunnig

macros
https://tinyurl.com/y9nfugth
https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories

related
https://github.com/rogerjdeangelis/utl-wps-meta-data-dictionaries

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/

/**************************************************************************************************************************/
/*                                                         |                                 |                              */
/*           INPUT                                         |        PROCESS                  |         OUTPUT               */
/*                                                         |                                 |                              */
/*  SASHELP.VTABLE META FOR SASHELP.CLASS                  | Two macros table & column       |     MACRO VARIABLES          */
/*                                                         |                                 |                              */
/*                                                         |                                 |                              */
/*                                                         |                                 |                              */
/* SASHELP.VTABLE FOR CLASS DATASET                        | %utl_getTable(sashelp,class)    | MACRO VARIABLES              */
/* =================================                       |                                 |                              */
/*                                                         |                                 |                              */
/*                                                         |                                 | _LIBNAME       =  SASHELP    */
/* LIBNAME         C8    SASHELP     Library Name          |                                 | _MEMNAME       =  CLASS      */
/* MEMNAME         C32   CLASS       Member Name           |                                 | _MEMTYPE       =  DATA       */
/* MEMTYPE         C8    DATA        Member Type           |                                 | _MEMLABEL      =  StudentData*/
/* DBMS_MEMTYPE    C32               DBMS Member Type      |                                 | _TYPEMEM       =  DATA       */
/* MEMLABEL        C256  Student     Data Set Label        |                                 | _CRDATE        =  1912270570 */
/* TYPEMEM         C8    DATA        Data Set Type         |                                 | _MODATE        =  1912270570 */
/* PROTECT         C3    ---          Password Protection  |                                 | _NOBS          =  19         */
/* COMPRESS        C8    NO          Compression Routine   |                                 | _OBSLEN        =  40         */
/* ENCRYPT         C8    NO          Encryption            |                                 | _NVAR          =  5          */
/* REUSE           C3    no          Reuse Space           |                                 | _FILESIZE      =  131072     */
/* ATTR            C3    ON          Data Set Attributes   |                                 | _DELOBS        =  0          */
/* INDXTYPE        C9                Type of Indexes       |                                 | _NLOBS         =  19         */
/* DATAREP         C32   NATIVE      Data Representation   |                                 | _NUM_CHARACTER =  2          */
/* SORTNAME        C8                Collating Sequence    |                                 | _NUM_NUMERIC   =  3          */
/* SORTTYPE        C4                Sorting Type          |                                 |                              */
/* SORTCHAR        C8                Charset Sorted By     |                                 |                              */
/* REQVECTOR       C24               Requirements Vector   |                                 |                              */
/* DATAREPNAME     C170  WIN64       Representation Name   |                                 |                              */
/* ENCODING        C256  us-ascii    Data Encoding         |                                 |                              */
/* AUDIT           C3    no          Audit Trail Active?   |                                 |                              */
/* AUDIT_BEFORE    C3    no          Audit Before Image?   |                                 |                              */
/* AUDIT_ADMIN     C3    no          Audit Admin Image?    |                                 |                              */
/* AUDIT_ERROR     C3    no          Audit Error Image?    |                                 |                              */
/* AUDIT_DATA      C3    no          Audit Data Image?     |                                 |                              */
/* TOTOBS          C16   1           TOTOBS                |                                 |                              */
/*                                                         |                                 |                              */
/*  -- NUMERIC --                                          |                                 |                              */
/* CRDATE          N8   1912270570   Date Created          |                                 |                              */
/* MODATE          N8   1912270570   Date Modified         |                                 |                              */
/* NOBS            N8           19   Physical Observations |                                 |                              */
/* OBSLEN          N8           40   Observation Length    |                                 |                              */
/* NVAR            N8            5   Number of Variables   |                                 |                              */
/* NPAGE           N8            1   Number of Pages       |                                 |                              */
/* FILESIZE        N8       131072   Size of File          |                                 |                              */
/* PCOMPRESS       N8            0   Percent Compression   |                                 |                              */
/* BUFSIZE         N8        65536   Bufsize               |                                 |                              */
/* DELOBS          N8            0   Deleted Observations  |                                 |                              */
/* NLOBS           N8           19   Logical Observations  |                                 |                              */
/* MAXVAR          N8            6   Longest variable name |                                 |                              */
/* MAXLABEL        N8            0   Longest label         |                                 |                              */
/* MAXGEN          N8            0   Generations           |                                 |                              */
/* GEN             N8            .   Generation number     |                                 |                              */
/* NUM_CHARACTER   N8            2   Character Variables   |                                 |                              */
/* NUM_NUMERIC     N8            3   Numeric Variables     |                                 |                              */
/*                                                         |                                 |                              */
/* --------------------------------------------------------|-------------------------------  |------------------------------*/
/*                                                         |                                 |                              */
/*                                                         |                                 |                              */
/* SASHELP.VCOLUMN SAS SASHELP.CLASS COLUMN SEX            |%utl_getColumn(sashelp,class,sex)|  MACRO VARIABLES             */
/* =============================================           |                                 |                              */
/*                                                         |                                 |  _MEMNAME                    */
/* Variable         Typ    Value        Label              |                                 |  _NAME     = SEX             */
/*                                                         |                                 |  _TYPE     = CHAR            */
/* LIBNAME           C8    SASHELP   Library Name          |                                 |  _LENGTH   = 1               */
/* MEMNAME           C32   CLASS     Member Name           |                                 |  _NPOS     = 32              */
/* MEMTYPE           C8    DATA      Member Type           |                                 |  _VARNUM   = 2               */
/*                                                         |                                 |  _LABEL    =                 */
/* NAME              C32   SEX       Column Name           |                                 |  _FORMAT   =                 */
/*                                                         |                                 |  _INFORMAT =                 */
/* TYPE              C4    char      Column Type           |                                 |                              */
/* LABEL             C256            Column Label          |                                 |                              */
/* FORMAT            C49             Column Format         |                                 |                              */
/* INFORMAT          C49             Column Informat       |                                 |                              */
/* IDXUSAGE          C9              Column Index Type     |                                 |                              */
/* XTYPE             C12   char      Extended Type         |                                 |                              */
/* NOTNULL           C3    no        Not NULL?             |                                 |                              */
/* TRANSCODE         C3    yes       Transcoded?           |                                 |                              */
/*                                                         |                                 |                              */
/*                                                         |                                 |                              */
/*  -- NUMERIC --                                          |                                 |                              */
/* LENGTH            N8     1        Column Length         |                                 |                              */
/* NPOS              N8    32        Column Position       |                                 |                              */
/* VARNUM            N8     2        Column Number in Table|                                 |                              */
/* SORTEDBY          N8     0        Order in Key Sequence |                                 |                              */
/* PRECISION         N8     0        Precision             |                                 |                              */
/* SCALE             N8     .        Scale                 |                                 |                              */
/*                                                         |                                 |                              */
/*                                                         |                                 |                              */
/******************************************************************************************  ********************************/

/*   _        _     _                       _              _       _
/ | | |_ __ _| |__ | | ___   _ __ ___   ___| |_ __ _    __| | __ _| |_ __ _
| | | __/ _` | `_ \| |/ _ \ | `_ ` _ \ / _ \ __/ _` |  / _` |/ _` | __/ _` |
| | | || (_| | |_) | |  __/ | | | | | |  __/ || (_| | | (_| | (_| | || (_| |
|_|  \__\__,_|_.__/|_|\___| |_| |_| |_|\___|\__\__,_|  \__,_|\__,_|\__\__,_|
 _                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

SASHELP.VTABLE FOR CLASS DATASET

/**************************************************************************************************************************/
/*                                                                                                                        */
/* SASHELP.VTABLE FOR CLASS DATASET                                                                                       */
/* =================================                                                                                      */
/*                                                                                                                        */
/*                                                                                                                        */
/* LIBNAME         C8    SASHELP     Library Name                                                                         */
/* MEMNAME         C32   CLASS       Member Name                                                                          */
/* MEMTYPE         C8    DATA        Member Type                                                                          */
/* DBMS_MEMTYPE    C32               DBMS Member Type                                                                     */
/* MEMLABEL        C256  Student     Data Set Label                                                                       */
/* TYPEMEM         C8    DATA        Data Set Type                                                                        */
/* PROTECT         C3    ---          Password Protection                                                                 */
/* COMPRESS        C8    NO          Compression Routine                                                                  */
/* ENCRYPT         C8    NO          Encryption                                                                           */
/* REUSE           C3    no          Reuse Space                                                                          */
/* ATTR            C3    ON          Data Set Attributes                                                                  */
/* INDXTYPE        C9                Type of Indexes                                                                      */
/* DATAREP         C32   NATIVE      Data Representation                                                                  */
/* SORTNAME        C8                Collating Sequence                                                                   */
/* SORTTYPE        C4                Sorting Type                                                                         */
/* SORTCHAR        C8                Charset Sorted By                                                                    */
/* REQVECTOR       C24               Requirements Vector                                                                  */
/* DATAREPNAME     C170  WIN64       Representation Name                                                                  */
/* ENCODING        C256  us-ascii    Data Encoding                                                                        */
/* AUDIT           C3    no          Audit Trail Active?                                                                  */
/* AUDIT_BEFORE    C3    no          Audit Before Image?                                                                  */
/* AUDIT_ADMIN     C3    no          Audit Admin Image?                                                                   */
/* AUDIT_ERROR     C3    no          Audit Error Image?                                                                   */
/* AUDIT_DATA      C3    no          Audit Data Image?                                                                    */
/* TOTOBS          C16   1           TOTOBS                                                                               */
/*                                                                                                                        */
/*  -- NUMERIC --                                                                                                         */
/* CRDATE          N8   1912270570   Date Created                                                                         */
/* MODATE          N8   1912270570   Date Modified                                                                        */
/* NOBS            N8           19   Physical Observations                                                                */
/* OBSLEN          N8           40   Observation Length                                                                   */
/* NVAR            N8            5   Number of Variables                                                                  */
/* NPAGE           N8            1   Number of Pages                                                                      */
/* FILESIZE        N8       131072   Size of File                                                                         */
/* PCOMPRESS       N8            0   Percent Compression                                                                  */
/* BUFSIZE         N8        65536   Bufsize                                                                              */
/* DELOBS          N8            0   Deleted Observations                                                                 */
/* NLOBS           N8           19   Logical Observations                                                                 */
/* MAXVAR          N8            6   Longest variable name                                                                */
/* MAXLABEL        N8            0   Longest label                                                                        */
/* MAXGEN          N8            0   Generations                                                                          */
/* GEN             N8            .   Generation number                                                                    */
/* NUM_CHARACTER   N8            2   Character Variables                                                                  */
/* NUM_NUMERIC     N8            3   Numeric Variables                                                                    */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%utl_getTable(sashelp,class);

/*                                _            _                     _                                      _
 _ __ ___   __ _  ___ _ __ ___   | |_ ___  ___| |_   ___ _ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
| `_ ` _ \ / _` |/ __| `__/ _ \  | __/ _ \/ __| __| / _ \ `_ \ \ / / | `__/ _ \| `_ \| `_ ` _ \ / _ \ `_ \| __|
| | | | | | (_| | (__| | | (_) | | ||  __/\__ \ |_ |  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
|_| |_| |_|\__,_|\___|_|  \___/   \__\___||___/\__| \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|

*/

/*--- testing run the code below before running the macro ---*/

/*---  just for testing ---*/
%utl_close; /*-- helps if accidentally macro opened sas dataset ---*/

%symdel
  libname        _libname
  memname        _memname
  memtype        _memtype
  memlabel       _memlabel
  typemem        _typemem
  crdate         _crdate
  modate         _modate
  nobs           _nobs
  obslen         _obslen
  nvar           _nvar
  filesize       _filesize
  delobs         _delobs
  nlobs          _nlobs
  num_character  _num_character
  num_numeric    _num_numeric
/nowarn;

/*--- without nowarn to make sure non exist ---*/
%symdel
  libname        _libname
  memname        _memname
  memtype        _memtype
  memlabel       _memlabel
  typemem        _typemem
  crdate         _crdate
  modate         _modate
  nobs           _nobs
  obslen         _obslen
  nvar           _nvar
  filesize       _filesize
  delobs         _delobs
  nlobs          _nlobs
  num_character  _num_character
  num_numeric    _num_numeric
 ;

/*----
WARNING: Attempt to delete macro variable LIBNAME failed. Variable not found.
WARNING: Attempt to delete macro variable _LIBNAME failed. Variable not found.
WARNING: Attempt to delete macro variable MEMNAME failed. Variable not found.
...
WARNING: Attempt to delete macro variable _NUM_CHARACTER failed. Variable not found.
WARNING: Attempt to delete macro variable NUM_NUMERIC failed. Variable not found.
WARNING: Attempt to delete macro variable _NUM_NUMERIC failed. Variable not found.
----*/

/*
 ___  __ ___   _____   _ __ ___   __ _  ___ _ __ ___
/ __|/ _` \ \ / / _ \ | `_ ` _ \ / _` |/ __| `__/ _ \
\__ \ (_| |\ V /  __/ | | | | | | (_| | (__| | | (_) |
|___/\__,_| \_/ \___| |_| |_| |_|\__,_|\___|_|  \___/

*/
/*--- copy macro to your autocall folder ---*/

filename ft15f001 "c:/oto/utl_getTable.sas";
parmcards4;
%macro utl_getTable(sashelp,class)
    /des="get table attributes meta data";

/*--- OUTPUT MACRO VARIABLES

  _LIBNAME
  _MEMNAME
  _MEMTYPE
  _MEMLABEL
  _TYPEMEM
  _CRDATE
  _MODATE
  _NOBS
  _OBSLEN
  _NVAR
  _FILESIZE
  _DELOBS
  _NLOBS
  _NUM_CHARACTER
  _NUM_NUMERIC

---*/

 /*---
   for testing withou macro

   %let lib=sashelp;
   %let dsn=class;

 ---*/

  %global
     _libname
     _memname
     _memtype
     _memlabel
     _typemem
     _crdate
     _modate
     _nobs
     _obslen
     _nvar
     _filesize
     _delobs
     _nlobs
     _num_character
     _num_numeric ;

   %local
     libname
     memname
     memtype
     memlabel
     typemem
     crdate
     modate
     nobs
     obslen
     nvar
     filesize
     delobs
     nlobs
     num_character
     num_numeric ;

   %let dsid=%sysfunc(open(sashelp.vtable
     (where=(
          upcase("&lib") = upcase(libname)
      and upcase("&dsn") = memname)),i));

   %syscall set(dsid);
   %let rc=%sysfunc(fetchobs(&dsid,1));

   %let rc=%sysfunc(close(&dsid));

   %let _libname        = %qtrim(&libname      );
   %let _memname        = %qtrim(&memname      );
   %let _memtype        = %qtrim(&memtype      );
   %let _memlabel       = %qtrim(&memlabel     );
   %let _typemem        = %qtrim(&typemem      );
   %let _crdate         = %qtrim(&crdate       );
   %let _modate         = %qtrim(&modate       );
   %let _nobs           = %qtrim(&nobs         );
   %let _obslen         = %qtrim(&obslen       );
   %let _nvar           = %qtrim(&nvar         );
   %let _filesize       = %qtrim(&filesize     );
   %let _delobs         = %qtrim(&delobs       );
   %let _nlobs          = %qtrim(&nlobs        );
   %let _num_character  = %qtrim(&num_character);
   %let _num_numeric    = %qtrim(&num_numeric  );

   %put ---- inside &=_libname      ;
   %put ---- inside &=_memname      ;
   %put ---- inside &=_memtype      ;
   %put ---- inside &=_memlabel     ;
   %put ---- inside &=_typemem      ;
   %put ---- inside &=_crdate       ;
   %put ---- inside &=_modate       ;
   %put ---- inside &=_nobs         ;
   %put ---- inside &=_obslen       ;
   %put ---- inside &=_nvar         ;
   %put ---- inside &=_filesize     ;
   %put ---- inside &=_delobs       ;
   %put ---- inside &=_nlobs        ;
   %put ---- inside &=_num_character;
   %put ---- inside &=_num_numeric  ;


%mend utl_getTable;
;;;;
run;quit;

filename ft15f001 clear;


%utl_getTable(sashelp,class);

%utlnopts;
%put ---- outside &=_libname      ;
%put ---- outside &=_memname      ;
%put ---- outside &=_memtype      ;
%put ---- outside &=_memlabel     ;
%put ---- outside &=_typemem      ;
%put ---- outside &=_crdate       ;
%put ---- outside &=_modate       ;
%put ---- outside &=_nobs         ;
%put ---- outside &=_obslen       ;
%put ---- outside &=_nvar         ;
%put ---- outside &=_filesize     ;
%put ---- outside &=_delobs       ;
%put  ---- outside &=_nlobs        ;
%put ---- outside &=_num_character;
%put ---- outside &=_num_numeric  ;
%utlopts;

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

/**************************************************************************************************************************/
/*                                                                                                                        */
/*   MACRO VARIABLES                                                                                                      */
/*                                                                                                                        */
/*                                                                                                                        */
/*   _LIBNAME          =  SASHELP                                                                                         */
/*   _MEMNAME          =  CLASS                                                                                           */
/*   _MEMTYPE          =  DATA                                                                                            */
/*   _MEMLABEL         =  StudentData                                                                                     */
/*   _TYPEMEM          =  DATA                                                                                            */
/*   _CRDATE           =  1912270570                                                                                      */
/*   _MODATE           =  1912270570                                                                                      */
/*   _NOBS             =  19                                                                                              */
/*   _OBSLEN           =  40                                                                                              */
/*   _NVAR             =  5                                                                                               */
/*   _FILESIZE         =  131072                                                                                          */
/*   _DELOBS           =  0                                                                                               */
/*   _NLOBS            =  19                                                                                              */
/*   _NUM_CHARACTER    =  2                                                                                               */
/*   _NUM_NUMERIC      =  3                                                                                               */
/*                                                                                                                        */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*___              _                                        _             _       _
|___ \    ___ ___ | |_   _ _ __ ___  _ __    _ __ ___   ___| |_ __ _   __| | __ _| |_ __ _
  __) |  / __/ _ \| | | | | `_ ` _ \| `_ \  | `_ ` _ \ / _ \ __/ _` | / _` |/ _` | __/ _` |
 / __/  | (_| (_) | | |_| | | | | | | | | | | | | | | |  __/ || (_| || (_| | (_| | || (_| |
|_____|  \___\___/|_|\__,_|_| |_| |_|_| |_| |_| |_| |_|\___|\__\__,_| \__,_|\__,_|\__\__,_|
 _                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

SASHELP.VCOLUMN COLUMN=SEX

/**************************************************************************************************************************/
/*                                                                                                                        */
/* SASHELP.VCOLUMN COLUMN=SEX                                                                                             */
/*                                                                                                                        */
/*                                                                                                                        */
/* SASHELP.VCOLUMN SAS SASHELP.CLASS COLUMN SEX                                                                           */
/* =============================================                                                                          */
/*                                                                                                                        */
/*                                                                                                                        */
/*  -- CHARACTER --                                                                                                       */
/* Variable         Typ    Value        Label                                                                             */
/*                                                                                                                        */
/* LIBNAME           C8    SASHELP   Library Name                                                                         */
/* MEMNAME           C32   CLASS     Member Name                                                                          */
/* MEMTYPE           C8    DATA      Member Type                                                                          */
/*                                                                                                                        */
/* NAME              C32   SEX       Column Name                                                                          */
/*                                                                                                                        */
/* TYPE              C4    char      Column Type                                                                          */
/* LABEL             C256            Column Label                                                                         */
/* FORMAT            C49             Column Format                                                                        */
/* INFORMAT          C49             Column Informat                                                                      */
/* IDXUSAGE          C9              Column Index Type                                                                    */
/* XTYPE             C12   char      Extended Type                                                                        */
/* NOTNULL           C3    no        Not NULL?                                                                            */
/* TRANSCODE         C3    yes       Transcoded?                                                                          */
/*                                                                                                                        */
/*                                                                                                                        */
/*  -- NUMERIC --                                                                                                         */
/* LENGTH            N8     1        Column Length                                                                        */
/* NPOS              N8    32        Column Position                                                                      */
/* VARNUM            N8     2        Column Number in Table                                                               */
/* SORTEDBY          N8     0        Order in Key Sequence                                                                */
/* PRECISION         N8     0        Precision                                                                            */
/* SCALE             N8     .        Scale                                                                                */
/*                                                                                                                        */
/**************************************************************************************************************************/

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


%utl_getColumn(sashelp,class,sex);

/*                                _            _                     _                                      _
 _ __ ___   __ _  ___ _ __ ___   | |_ ___  ___| |_   ___ _ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
| `_ ` _ \ / _` |/ __| `__/ _ \  | __/ _ \/ __| __| / _ \ `_ \ \ / / | `__/ _ \| `_ \| `_ ` _ \ / _ \ `_ \| __|
| | | | | | (_| | (__| | | (_) | | ||  __/\__ \ |_ |  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
|_| |_| |_|\__,_|\___|_|  \___/   \__\___||___/\__| \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|

*/

/*----
WARNING: Attempt to delete macro variable MEMNAME failed. Variable not found.
WARNING: Attempt to delete macro variable NAME failed. Variable not found.
....
WARNING: Attempt to delete macro variable FORMAT failed. Variable not found.
WARNING: Attempt to delete macro variable INFORMAT failed. Variable not found.
----*/

/*---  just for testing rerunning ---*/

%utl_close; /*-- helps if accidentally macro opened sas dataset ---*/

%symdel
     _memname
     _name
     _type
     _length
     _npos
     _varnum
     _label
     _format
     _informat /nowarn;

%symdel
     _memname
     _name
     _type
     _length
     _npos
     _varnum
     _label
     _format
     _informat ;


/*----
WARNING: Attempt to delete macro variable MEMNAME failed. Variable not found.
WARNING: Attempt to delete macro variable NAME failed. Variable not found.
....
WARNING: Attempt to delete macro variable FORMAT failed. Variable not found.
WARNING: Attempt to delete macro variable INFORMAT failed. Variable not found.
----*/

/*
 ___  __ ___   _____   _ __ ___   __ _  ___ _ __ ___
/ __|/ _` \ \ / / _ \ | `_ ` _ \ / _` |/ __| `__/ _ \
\__ \ (_| |\ V /  __/ | | | | | | (_| | (__| | | (_) |
|___/\__,_| \_/ \___| |_| |_| |_|\__,_|\___|_|  \___/

*/

/*--- copy macro to your autocolumn folder ---*/

filename ft15f001 "c:/oto/utl_getColumn.sas";
parmcards4;
%macro utl_getcolumn(lib,dsn,col)
    /des="get variable attributes meta data";

/*---                  ---*/
/*--- OUTPUT MACRO     ---*/
/*--- VARIABLES        ---*/
/*---                  ---*/
/*---  _name           ---*/
/*---  _type           ---*/
/*---  _length         ---*/
/*---  _npos           ---*/
/*---  _varnum         ---*/
/*---  _label          ---*/
/*---  _format         ---*/
/*---  _informat       ---*/
/*---                  ---*/

  /*---
    %let lib=sashelp;
    %let dsn=class;
    %let col=sex;
  ---*/

   %global
     _memname
     _name
     _type
     _length
     _npos
     _varnum
     _label
     _format
     _informat ;

   %local
     memname
     name
     type
     length
     npos
     varnum
     label
     format
     informat /nowarn;

   %let dsid=%sysfunc(open(sashelp.vcolumn
     (where=(
          upcase("&lib") = upcase(libname)
      and upcase("&dsn") = upcase(memname)
      and upcase(name) = upcase("&col")
     ))
     ,i)) ;

   %syscall set(dsid);
   %let rc=%sysfunc(fetchobs(&dsid,1));

   %let rc=%sysfunc(close(&dsid));

   %let _memname        = %qtrim(&memname  );
   %let _name           = %qtrim(&name     );
   %let _type           = %qtrim(&type     );
   %let _length         = %qtrim(&length   );
   %let _npos           = %qtrim(&npos     );
   %let _varnum         = %qtrim(&varnum   );
   %let _label          = %qtrim(&label    );
   %let _format         = %qtrim(&format   );
   %let _informat       = %qtrim(&informat );


   %put ---- inside &=_memname ;
   %put ---- inside &=_name    ;
   %put ---- inside &=_type    ;
   %put ---- inside &=_length  ;
   %put ---- inside &=_npos    ;
   %put ---- inside &=_varnum  ;
   %put ---- inside &=_label   ;
   %put ---- inside &=_format  ;
   %put ---- inside &=_informat;


%mend utl_getcolumn;
;;;;
run;quit;

filename ft15f001 clear;

%utl_getColumn(sashelp,class,sex);

%put ---- outside &type ---;

%utlnopts;
%put ---- outside &=_memname   ;
%put ---- outside &=_name    ;
%put ---- outside &=_type    ;
%put ---- outside &=_length  ;
%put ---- outside &=_npos    ;
%put ---- outside &=_varnum  ;
%put ---- outside &=_label   ;
%put ---- outside &=_format  ;
%put ---- outside &=_informat;
%utlopts;


/**************************************************************************************************************************/
/*                                                                                                                        */
/* OUTPUT MACRO VARIABLES                                                                                                 */
/*                                                                                                                        */
/*    _MEMNAME                                                                                                            */
/*    _NAME     = SEX                                                                                                     */
/*    _TYPE     = CHAR                                                                                                    */
/*    _LENGTH   = 1                                                                                                       */
/*    _NPOS     = 32                                                                                                      */
/*    _VARNUM   = 2                                                                                                       */
/*    _LABEL    =                                                                                                         */
/*    _FORMAT   =                                                                                                         */
/*    _INFORMAT =                                                                                                         */
/*                                                                                                                        */
/**************************************************************************************************************************/


/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
