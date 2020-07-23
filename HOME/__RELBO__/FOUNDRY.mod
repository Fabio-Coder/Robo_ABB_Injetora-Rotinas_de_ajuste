MODULE FOUNDRY

!***********************************************************************************
!*Project:   customer			: CIE Autocom (BR)
!*           robot s/n			: 8156
!*
!*Robot:     Robot System		: IRC5 6.04.01.00
!*           Robot NR.			: 109474
!*           Robot Option		: 
!*           Robot Type			: IRB 6700-205/2.80
!*           Robot Software		: 
!*           TP Language		: ESPANOL
!*
!*Periferie: DCM type			: COLOSIO PFO2000
!*           cooling device		: vasca (cliente)
!*           photosensors		: SI (collegati a controller robot)
!*           conveyor belt		: SI
!*           spraying			: NO
!*           trimming press		: SI (collegata a controller robot)I
!*
!*Created:	 2017-02-17
!*Author:    A.Roberti   
!*Company:   RELBO srl
!*
!*THIS MODULE MUST BE USED WITH "TEXT", "UTILITY" AND "WLDZONES" MODULES.
!***********************************************************************************

!===================================================================================
! EJES 0° PARA VERIFICAR CALIBRACION
CONST jointtarget jposCalib := [[-0.00450242,-0.00140302,-0.000256165,0.000606869,-0.00010721,0.00162044],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
! POSICIÓN DE TRANSPORTE
CONST jointtarget jposTransporte := [[0.737591,-45.0079,64.987,0.722563,-115.494,7.49436],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! HOME POSICIÓN (POSICIÓN INICIAL)
CONST robtarget ROB_pHome:=[[-300.08,-925.35,1318.04],[0.134893,-0.694146,-0.694094,-0.134904],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! MÁQUINA DE FUNDICIÓN (MDF): ESPERA
CONST robtarget MDF_pEspera:=[[479.62,-300.02,1574.03],[0.130577,1.86104E-05,0.991438,-4.89667E-06],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! MÁQUINA DE FUNDICIÓN (MDF): ENTRADA
CONST robtarget MDF_p01 := [[2373.93,-299.91,1461.99],[0.596392,-6.67991E-05,0.802693,-2.09958E-05],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p02:=[[2699.99,-299.83,1090.09],[0.707123,-8.78437E-05,0.707091,-8.08801E-06],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p03:=[[2699.97,-503.39,1090.10],[0.707127,-6.39574E-05,0.707087,-3.24507E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pRecog:=[[2699.95,-650.02,1090.09],[0.707124,-4.69501E-05,0.707089,-4.40933E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget MDF_pTemp:=[[2698.64,-655.491,1090.08],[0.707107,0.000638553,0.707106,-0.000746015],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p04:=[[2699.96,-503.39,1090.09],[0.707125,-6.31866E-05,0.707089,-3.13872E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! MÁQUINA DE FUNDICIÓN (MDF): SALIDA
CONST robtarget MDF_p10 := [[2699.99,-299.84,1090.08],[0.707121,-8.573E-05,0.707092,-8.44459E-06],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p11:=[[1664.67,-299.84,1090.08],[0.707123,-8.29815E-05,0.707091,-1.51904E-05],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p12:=[[1465.70,-299.85,1549.16],[0.823594,-6.85768E-05,0.56718,-1.53488E-05],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p20 := [[1478.44,-419.83,1666.61],[0.824949,-0.000290184,0.565178,0.00574136],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p21:=[[1465.69,-508.52,1751.60],[0.823585,-7.60914E-05,0.567193,-1.23276E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pControl:=[[1465.70,-567.15,1751.59],[0.823585,-6.72245E-05,0.567193,-1.6482E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p30:=[[1465.69,-508.53,1751.60],[0.823585,-7.44876E-05,0.567193,-1.33299E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p31:=[[1294.42,-424.39,1899.73],[0.891699,-0.0188322,0.452211,0.00486094],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p13:=[[523.40,-299.95,2053.13],[0.999936,-9.50662E-07,0.011294,-2.22787E-05],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p14:=[[158.02,-582.19,2053.13],[0.923817,0.00431933,0.0104368,-0.382667],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! SENSORES
CONST robtarget SNS_p01 := [[-175.36,-1293.82,1650.84],[0.696487,0.228308,0.251673,-0.632014],[0,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_p02 := [[631.49,-1887.86,896.33],[0.710799,-0.0421246,0.700424,0.0489567],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl1 := [[678.27,-2248.47,893.16],[0.710799,-0.0421246,0.700424,0.0489575],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl2 := [[678.26,-2248.47,893.16],[0.710799,-0.0421241,0.700424,0.0489568],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl3 := [[678.26,-2248.48,893.16],[0.710799,-0.0421233,0.700424,0.0489561],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl4 := [[678.26,-2248.47,893.17],[0.710799,-0.0421247,0.700424,0.048956],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_p10 := [[631.49,-1887.87,896.33],[0.710799,-0.042125,0.700424,0.0489576],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_p11 := [[253.19,-1470.40,1334.92],[0.71814,0.0885799,0.689909,-0.02129],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!=====================================================================================
! CUBA DE AGUA
CONST robtarget ENF_p01 := [[253.19,-1470.40,1334.92],[0.71814,0.0885787,0.689909,-0.0212899],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p02 := [[204.74,-1708.64,1098.11],[0.682321,0.228473,0.668075,0.189508],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p03 := [[116.48,-1855.06,764.64],[0.580307,0.371812,0.603054,0.401653],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p04 := [[29.46,-1884.57,501.57],[0.467878,0.462574,0.530746,0.534251],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_pCuba := [[-186.04,-2096.21,296.50],[0.460432,0.455095,0.537203,0.540651],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p10 := [[29.46,-1884.56,501.57],[0.460848,0.455506,0.536855,0.540296],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p11 := [[29.45,-1884.55,501.56],[0.159296,0.628087,0.738778,0.185306],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p12 := [[29.47,-1884.57,501.58],[0.106643,-0.639134,-0.750945,0.127342],[0,-3,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p20 := [[29.47,-1884.56,501.57],[0.223572,-0.608178,-0.714197,0.264685],[0,-3,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p21 := [[28.13,-1884.39,650.31],[0.460849,0.455507,0.536856,0.540294],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p22 := [[361.13,-1491.49,1595.63],[0.837214,0.137406,0.397683,0.349343],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p23 := [[-156.53,-1515.40,1959.25],[0.997691,0.0381915,-0.00466663,-0.0559739],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZA EN UTIL INTERMEDIO
CONST robtarget UTL_p01 := [[-837.45,-1272.64,1959.25],[0.955924,0.0359925,-0.013594,-0.291083],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p02 := [[-767.12,-1572.58,1446.70],[0.913954,0.360498,0.1817,-0.0414022],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p03 := [[-752.93,-1401.80,807.68],[0.681567,0.629269,0.315441,0.199959],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p04 := [[-1032.28,-1682.45,311.36],[0.661462,0.654657,0.264521,0.252826],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_pColoc := [[-1034.12,-1684.77,155.24],[0.661459,0.654661,0.264514,0.252831],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p10 := [[-1032.27,-1682.43,311.35],[0.66146,0.654659,0.264518,0.252828],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p11 := [[-789.08,-1438.12,683.99],[0.671504,0.643174,0.288819,0.228019],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p12 := [[-1239.24,-1252.68,1062.45],[0.790768,0.482578,-0.192109,-0.323881],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! RECOGIDA PIEZA DE UTIL INTERMEDIO
CONST robtarget UTL_p51 := [[-1105.63,-1398.20,897.81],[0.72489,0.576154,-0.249004,-0.283861],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p52 := [[-1154.48,-1464.84,744.75],[0.69714,0.608846,-0.257587,-0.277402],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p53 := [[-1174.64,-1492.34,662.75],[0.683007,0.624471,-0.261619,-0.27403],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p54 := [[-1361.62,-1747.31,264.62],[0.652558,0.656046,-0.26962,-0.266603],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_pRecog := [[-1360.52,-1746.82,81.02],[0.652565,0.656046,-0.269608,-0.266597],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p60 := [[-1361.61,-1747.34,264.64],[0.652563,0.656044,-0.269615,-0.2666],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p61 := [[-1049.59,-1321.77,674.15],[0.669314,0.63901,-0.265326,-0.270716],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p62 := [[-884.27,-635.46,1244.81],[0.0432305,0.899262,-0.434706,-0.0221146],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! PRENSA: COLOCACIÓN
CONST robtarget PRN_p01 := [[-1088.85,11.63,1244.81],[0.0341874,0.719018,-0.693293,-0.0344839],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p02 := [[-1442.06,5.17,934.25],[0.323385,0.632075,-0.622899,-0.328482],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p03 := [[-1581.51,0.07,961.05],[0.498137,0.501818,-0.501849,-0.498182],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p04 := [[-1749.96,0.08,959.83],[0.498142,0.501814,-0.501845,-0.498186],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p05 := [[-2016.63,0.10,902.29],[0.498144,0.501812,-0.501843,-0.498188],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p06 := [[-2301.35,0.12,900.18],[0.498141,0.501814,-0.501846,-0.498185],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_pColoc := [[-2300.22,0.12,746.61],[0.498142,0.501813,-0.501844,-0.498187],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p10 := [[-2301.35,0.12,900.18],[0.498142,0.501814,-0.501845,-0.498185],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p11 := [[-2016.63,0.10,902.29],[0.498144,0.501812,-0.501843,-0.498188],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p12 := [[-1749.96,0.08,959.83],[0.498143,0.501812,-0.501844,-0.498187],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p13 := [[-1442.07,5.18,934.26],[0.323386,0.632072,-0.6229,-0.328484],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p14 := [[-1088.85,11.63,1244.81],[0.0341865,0.719018,-0.693293,-0.0344828],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! PRENSA: RECOGIDA
CONST robtarget PRN_p50 := [[-1802.25,4.82,1525.24],[0.497512,-0.502436,-0.499376,0.500664],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p51 := [[-1802.25,4.82,1525.24],[0.497512,-0.502436,-0.499376,0.500664],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p52 := [[-1881.58,5.03,1258.22],[0.49637,-0.5034,-0.5002,0.500005],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p53 := [[-2172.00,3.91,1112.75],[0.496371,-0.503398,-0.500199,0.500007],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p54 := [[-2431.17,2.85,973.59],[0.496371,-0.503398,-0.5002,0.500007],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_pRecog := [[-2430.17,1.91,835.59],[0.49637,-0.503399,-0.500199,0.500007],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p60 := [[-2431.17,2.86,973.59],[0.496371,-0.503399,-0.500199,0.500007],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget PRN_pTemp:=[[-2430.17,0.752304,835.637],[0.496282,-0.503268,-0.500293,0.500132],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p61 := [[-2149.91,4.32,1169.39],[0.496373,-0.503397,-0.500198,0.500008],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p62 := [[-1790.62,5.83,1367.11],[0.496372,-0.503401,-0.500196,0.500007],[-1,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p63 := [[-1383.82,0.34,1044.31],[0.00217416,0.70858,0.705613,0.00446631],[-1,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p64 := [[-1333.09,-316.14,1094.55],[0.0130118,-0.621639,-0.783071,0.0140145],[-1,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZAS PRENSADAS
CONST robtarget PRD_p01 := [[1.04,-1370.06,1094.55],[0.00151163,-0.00162301,-0.999816,0.0190642],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p02 := [[11.25,-2056.39,846.90],[0.00373859,0.000108878,0.812739,-0.582616],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p03 := [[11.26,-2055.33,843.52],[0.0037561,0.00011071,0.810027,-0.58638],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p04 := [[12.15,-1979.73,724.69],[0.00422282,-3.02035E-05,0.711046,-0.703133],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p05 := [[13.69,-1976.80,462.58],[0.00421996,-2.94087E-05,0.711045,-0.703134],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_pColoc := [[15.85,-2334.78,458.58],[0.00422123,-2.88861E-05,0.711047,-0.703132],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p10 := [[14.37,-2337.60,709.58],[0.00422252,-2.80671E-05,0.711047,-0.703132],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p11 := [[10.76,-1983.32,959.98],[0.00421822,-3.10169E-05,0.711044,-0.703135],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p12 := [[6.40,-1274.61,541.66],[0.000397187,9.47189E-05,-0.99693,-0.0782924],[0,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p13 := [[303.34,-1000.27,830.10],[0.079324,-0.730989,0.673755,0.0735925],[0,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p14 := [[-300.08,-925.36,1318.02],[0.134901,-0.694143,-0.694093,-0.134912],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZAS BUENAS NO PRENSADAS
CONST robtarget BUE_p01 := [[-759.39,780.44,1244.81],[0.0183214,0.397609,-0.916269,-0.0449719],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p02 := [[-918.53,941.80,1036.22],[0.080713,0.387899,-0.894769,-0.205931],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p03 := [[-1140.75,1167.72,845.46],[0.171278,0.350475,-0.809145,-0.43945],[-2,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p04 := [[-1293.84,1323.78,810.18],[0.253843,0.283963,-0.655767,-0.651843],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p05 := [[-1281.49,1327.09,512.95],[0.253841,0.283961,-0.655766,-0.651845],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_pColoc := [[-1483.59,1531.37,506.82],[0.253843,0.283965,-0.655765,-0.651843],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p10 := [[-1491.99,1529.14,708.73],[0.253844,0.283965,-0.655763,-0.651845],[-2,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p11 := [[-1144.50,1170.18,864.74],[0.253841,0.283965,-0.655765,-0.651845],[-2,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p12 := [[-1219.88,966.89,1240.48],[0.335406,0.274984,-0.53906,-0.722012],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p13 := [[-965.08,738.21,1143.57],[0.0478304,0.769162,-0.528181,-0.356549],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p14 := [[-744.00,535.82,1377.81],[0.0202368,0.979753,-0.143469,0.138169],[-1,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZAS RECHAZADAS: START-UP/RECHAZADA DE MÁQUINA/INCOMPLETA
CONST robtarget RCZ_p01 := [[-138.69,-1485.58,1334.92],[0.709111,0.178478,0.672287,-0.115484],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p02 := [[-137.24,-1546.98,1090.98],[0.671804,0.384856,0.592911,0.221409],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p03 := [[-185.67,-1451.96,929.56],[0.445261,0.579921,0.414932,0.541539],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p04 := [[-185.67,-1451.96,929.56],[0.445261,0.579922,0.414932,0.54154],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p05 := [[-655.72,-1773.76,449.21],[0.445253,0.579925,0.414934,0.541541],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_pColoc := [[-679.14,-2100.17,361.59],[0.445253,0.579925,0.414933,0.541542],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p10 := [[-679.39,-2166.56,609.01],[0.445252,0.579925,0.414932,0.541544],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p11 := [[-386.49,-1594.54,1100.59],[0.439065,0.582618,0.402066,0.553282],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p12 := [[-785.87,-1851.28,1333.34],[0.594454,0.693706,0.353744,-0.200652],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p13 := [[-819.31,-1045.44,1426.39],[0.051821,0.882632,0.390107,-0.257083],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p14 := [[-570.94,-787.63,1318.04],[0.112167,-0.794032,-0.577165,-0.154315],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!=====================================================================================
! MONTAJE MOLDES
CONST robtarget MMD_p01 := [[-192.77,-816.33,904.35],[0.00260453,0.707148,0.707053,0.00338157],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MMD_p02 := [[-192.77,-816.33,904.35],[0.00260554,0.707147,0.707054,0.00338055],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!=====================================================================================
! POSICIONES PARA RECUPERACIÓN SEMI-AUTOMATICA DE LA POSICIÓN INICIAL
VAR robtarget ROB_pStartHoming;
VAR jointtarget ROB_jStartHoming;
!===================================================================================
VAR bool bErrCtrl1:=FALSE;
VAR bool bErrCtrl2:=FALSE;
VAR bool bErrCtrl3:=FALSE;
VAR bool bErrCtrl4:=FALSE;
VAR bool bAnomSnsPulver:=FALSE;
VAR bool bErrCtrlSns:=FALSE;
VAR bool bPzIncompleta:=FALSE;
VAR bool bPzRechazoDeMdf:=FALSE;
VAR bool bSnsDefect:=FALSE;
VAR bool bPzBuenaDeMdf:=FALSE;
VAR bool bMassaloteKo:=FALSE;
VAR bool bErrSnsPulver:=FALSE;
VAR bool bEyeccionKo:=FALSE;
VAR bool bPzColocada:=FALSE;
VAR bool bErrSnsIntColoc:=FALSE;
VAR bool bPrnOkColoc:=FALSE;
VAR bool bPrnOkRecog:=FALSE;
VAR bool bPrnErrStart1:=FALSE;
VAR bool bPrnErrStart2:=FALSE;
VAR bool bCalidad:=FALSE;
VAR bool bRecogCtrlMdf:=FALSE;
!===================================================================================
VAR num nSnsAusentes{10}:=[0,0,0,0,0,0,0,0,0,0];
VAR num nSnsDefect{10}:=[0,0,0,0,0,0,0,0,0,0];
VAR num ROB_nPosRobot;
VAR num nMaxRobSpeed:=0;
!===================================================================================
VAR clock timerMDF;
VAR clock timerEXT;
VAR clock timerROB;
!===================================================================================
VAR intnum intCalidad:=0;
VAR intnum intVel0:=0;
VAR intnum intVelStd:=0;
VAR intnum intMslKo:=0;
!===================================================================================
PERS bool bHbltcSnsAntPulver:=TRUE;
PERS bool bHbltcSns01:=FALSE;
PERS bool bHbltcSns02:=FALSE;
PERS bool bHbltcSns03:=FALSE;
PERS bool bHbltcSns04:=FALSE;
PERS bool bHbltcSns05:=TRUE;
PERS bool bHbltcSns06:=TRUE;
PERS bool bHbltcSns07:=FALSE;
PERS bool bHbltcSns08:=FALSE;
PERS bool bHbltcSns09:=FALSE;
PERS bool bHbltcSns10:=FALSE;
PERS bool bHbltcSns11:=FALSE;
PERS bool bHbltcSns12:=FALSE;
PERS bool bHbltcSns13:=FALSE;
PERS bool bHbltcSns14:=FALSE;
PERS bool bHbltcSns15:=FALSE;
PERS bool bHbltcSns16:=FALSE;
PERS bool bHbltcSoftservo:=TRUE;
PERS bool bHbltcGuardarIncompl:=FALSE;
PERS bool bHbltcEnfriamiento:=TRUE;
PERS bool bHbltcEnfriaRechazo:=FALSE;
PERS bool bHbltcUtilInt:=TRUE;
PERS bool bHbltcSnsUtilInt:=FALSE;
PERS bool bHbltcPrensaColoc:=TRUE;
PERS bool bHbltcPrensaRecog:=TRUE;
PERS bool bHbltcPrnRecogSoft:=TRUE;
PERS bool bHbltcStopPrensaNoAuto:=TRUE;
PERS bool bHbltcStopUtilSns:=FALSE;
PERS bool bHbltcCicloSpec:=TRUE;
PERS bool bHbltcCtrlMoldeAbierto:=TRUE;
!===================================================================================
PERS num nHbltcMensajes:=2;
PERS num nTipoPzEnPinza:=0;
PERS num nPass:=1234;
PERS num nTiempoEnfriam:=2;
PERS num nTiempoGoteo:=2;
PERS num nTiempoMaxDIPrnColoc:=20;
PERS num nTiempoMaxDIPrnRecog:=20;
PERS num nTiempPulsoCinta:=2;
PERS num nTiempoMaxDIAire:=2;
PERS num nTiempoMaxDIEyecAdel:=10;
PERS num nTiempoMaxDIPrnFinCiclo:=60;
PERS num nTiempoPinzaCerrar:=0.7;
PERS num nTiempoPinzaAbrir:=0.7;
PERS num nTiempoMensAnom:=5;
PERS num nVelMax:=2000;
PERS num nOverVel:=100;
PERS num ROB_ntimerMDF:=74.023;
PERS num ROB_nTimerEXT:=10.494;
PERS num ROB_nTimerROB:=56.328;
PERS num ROB_nPzTotal:=348;
PERS num ROB_nPzBuona:=322;
PERS num ROB_nPzRechazo:=26;
!===================================================================================
PERS loaddata loadPieza:=[4,[0,-10,300],[1,0,0,0],0,0,0];
!===================================================================================
! ANGULOS (EJE 1) LIMITES DE LOS DISPOSITIVOS PERIFERICOS
CONST num njRampaMin:=-180;
CONST num njRampaMax:=-90;
CONST num njPrensaMin:=-90;
CONST num njPrensaMax:=-30;
CONST num njUtilMin:=-30;
CONST num njUtilMax:=10;
CONST num njCubaMin:=10;
CONST num njCubaMax:=90;
CONST num njMdfMin:=90;
CONST num njMdfMax:=180;
!===================================================================================
	CONST robtarget p01 := [[2473.51,738.92,438.42],[0.454099,0.457405,0.552238,0.528779],[1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p02 := [[2460.24,732.08,-92.92],[0.449187,0.452046,0.556362,0.533242],[1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	PERS robtarget pTemp := [[2468.78,703.01,-92.8363],[0.452338,0.45528,0.553646,0.530647],[1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p04 := [[2373.93,-299.91,1461.99],[0.596392,-6.67991E-05,0.802693,-2.09958E-05],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p05 := [[2373.93,-299.91,1461.99],[0.596392,-6.67991E-05,0.802693,-2.09958E-05],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST robtarget p06 := [[2373.93,-299.91,1461.99],[0.596392,-6.67991E-05,0.802693,-2.09958E-05],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!*********************************************************
! Routine:  Main()
!*********************************************************
PROC Main()
	
	ROB_Reset;
	ROB_Interrupt;
	ConfL\On;
	USR_Print(s_LineaVuota{nIdioma});
	ROB_Homing;
	ROB_SetFueraArea;
	ROB_Setup;
	nMaxRobSpeed:=MaxRobSpeed();

	WHILE TRUE DO
		ROB_ControlAire;
		Set DO_W09_PinzaAbre;
		nTipoPzEnPinza:=0;
		bPzColocada:=TRUE;
		IF DI_P016_MdfFinCiclo=1 THEN
			ROB_FinCiclo;
		ENDIF
		ROB_SetFueraArea;
		MDF_EsperaInsAutIny;
		Velset nOverVel, nVelMax;
		mMDF_Espera;
		MDF_EsperaEntrada;
		IF bMassaloteKo=FALSE THEN
			mMDF_Recogida;
            IF bEyeccionKo=FALSE THEN
                mMDF_Salida;
            ELSE
                mMDF_ErrSalida;
            ENDIF
		ENDIF
		IF bMassaloteKo=FALSE AND bEyeccionKo=FALSE THEN
			mSNS_ControlPz;
			IF bHbltcCicloSpec=FALSE THEN
				DEP_GestColocStd;
			ELSE
				DEP_GestColocNonStd;
			ENDIF
		ENDIF
		mROB_Home;
		IF bMassaloteKo=TRUE OR bEyeccionKo=TRUE THEN
			MDF_AnomaliaExtraccion;
		ENDIF
		USR_Print(s_LineaVuota{nIdioma});
	ENDWHILE

ENDPROC

!*********************************************************
! Routine:  DEP_GestColocStd()
!*********************************************************
PROC DEP_GestColocStd()

	IF bHbltcEnfriamiento=TRUE AND ((bPzBuenaDeMdf=TRUE AND bPzIncompleta=FALSE) OR bHbltcEnfriaRechazo=TRUE) THEN
		mENF_Cuba;
	ENDIF
	
	bErrSnsIntColoc:=FALSE;
	IF (bHbltcUtilInt=TRUE AND bHbltcSnsUtilInt=TRUE AND DI_W17_SnsUtilIntermedio=1) THEN
		bErrSnsIntColoc:=TRUE;
		ROB_AlarmaAcustica(2);
		USR_Print(s_UtilOccupato{nIdioma});
		WaitTime nTiempoMensAnom;
	ENDIF
	
	IF (bPzRechazoDeMdf=FALSE AND bPzIncompleta=FALSE AND bErrSnsIntColoc=FALSE) THEN
		
		IF bHbltcUtilInt=TRUE THEN
			mDEP_UtilIntColoc;
			mDEP_UtilIntRecog;
		ENDIF
		
		IF (bHbltcPrensaColoc=TRUE AND bCalidad=FALSE AND bErrSnsIntColoc=FALSE) THEN
			USR_Print(s_CicloTrancia{nIdioma});
			IF DI_P309_05_HbltcPrensa=1 THEN
				bPrnOkColoc:=PrensaCtrlColoc();
				IF bPrnOkColoc=TRUE THEN
					mDEP_PrnColoc;
					IF (bHbltcPrensaRecog=TRUE AND bPrnOkColoc=TRUE AND bPrnErrStart1=FALSE) THEN
						bPrnOkRecog:=PrensaCtrlRecog();
						IF bPrnOkRecog=TRUE THEN
							mDEP_PrnRecog;
							mDEP_PzPrensadaColoc;
						ENDIF
					ENDIF
				ENDIF
			ENDIF
		ENDIF
		
		IF (bHbltcPrensaColoc=TRUE AND bCalidad=FALSE AND DI_P309_05_HbltcPrensa=0) THEN
			ROB_AlarmaAcustica(2);
			USR_Print(s_TranciaNonInserito{nIdioma});
		ENDIF
		
		IF bPzColocada=FALSE THEN
			mDEP_PzBuenaColoc;
		ENDIF
		
    ELSE
        mDEP_PzRechazoColoc;
    ENDIF
	
ENDPROC

!*********************************************************
! Routine:  DEP_GestColocNonStd()
! Nota:		solamente con bHbltcPrensaRecog y bHbltcUtilInt
!*********************************************************
PROC DEP_GestColocNonStd()

	IF bHbltcEnfriamiento=TRUE AND ((bPzBuenaDeMdf=TRUE AND bPzIncompleta=FALSE) OR bHbltcEnfriaRechazo=TRUE) THEN
		mENF_Cuba;
	ENDIF
	
	bErrSnsIntColoc:=FALSE;
	IF (bHbltcUtilInt=TRUE AND bHbltcSnsUtilInt=TRUE AND DI_W17_SnsUtilIntermedio=1) THEN
		bErrSnsIntColoc:=TRUE;
		ROB_AlarmaAcustica(2);
		USR_Print(s_UtilOccupato{nIdioma});
		WaitTime nTiempoMensAnom;
	ENDIF
	
	IF (bPzRechazoDeMdf=FALSE AND bPzIncompleta=FALSE AND bErrSnsIntColoc=FALSE) THEN
	
		mDEP_UtilIntColoc;
		
		IF (bHbltcPrensaRecog=TRUE AND DI_P309_05_HbltcPrensa=1) THEN
			USR_Print(s_CicloTrancia{nIdioma});
			bPrnOkRecog:=PrensaCtrlRecog();
			IF bPrnOkRecog=TRUE THEN
				mDEP_PrnRecog;
				mDEP_PzPrensadaColoc;
			ENDIF
		ENDIF
		
		mDEP_UtilIntRecog;
		
		IF (bHbltcPrensaColoc=TRUE AND bCalidad=FALSE) THEN
			USR_Print(s_CicloTrancia{nIdioma});
			IF DI_P309_05_HbltcPrensa=1 THEN
				bPrnOkColoc:=PrensaCtrlColoc();
				IF bPrnOkColoc=TRUE THEN
					mDEP_PrnColoc;
				ENDIF
			ENDIF
		ENDIF
		
		IF (bHbltcPrensaColoc=TRUE AND bCalidad=FALSE AND DI_P309_05_HbltcPrensa=0) THEN
			ROB_AlarmaAcustica(2);
			USR_Print(s_TranciaNonInserito{nIdioma});
		ENDIF
		
		IF bPzColocada=FALSE THEN
			mDEP_PzBuenaColoc;
		ENDIF
		
    ELSE
        mDEP_PzRechazoColoc;
    ENDIF
	
ENDPROC

!*********************************************************
! Routine:  ROB_Interrupt()
!*********************************************************
PROC ROB_Interrupt()
	
	IDelete intVel0;
	IDelete intVelStd;
	IDelete intMslKo;
	
	IDelete intCalidad;
	CONNECT intCalidad WITH TR_Calidad;
	ISignalDI DI_V02_ReqCalidad, 1, intCalidad;
	
ENDPROC  
  
	TRAP TR_Calidad
		bCalidad:=TRUE;
		Set DO_W02_LuzAmarillo;
		ROB_AlarmaAcustica(2);
		USR_Print(s_ReqQualita{nIdioma});
	ENDTRAP

!*********************************************************
! Routine:  ROB_HomingInterrupt()
!*********************************************************
PROC ROB_HomingInterrupt()

	IDelete intVel0;
	CONNECT intVel0 WITH TR_Vel0;
	ISignalDI DI_P305_01_StartCiclo, 0, intVel0;
	
	IDelete intVelStd;
	CONNECT intVelStd WITH TR_VelStd;
	ISignalDI DI_P305_01_StartCiclo, 1, intVelStd;
	
	SpeedRefresh 0;
	
ENDPROC        
    
	TRAP TR_Vel0
		SpeedRefresh 0;
        IF (bRecogCtrlMdf=TRUE AND DI_P006_MoldeAbierto=0) THEN
			USR_Print(s_MancaStampoAPerto{nIdioma});
		ENDIF
	ENDTRAP

	TRAP TR_VelStd
		SpeedRefresh 100;
	ENDTRAP
  
!*********************************************************
! Routine:  ROB_Reset()
!*********************************************************
PROC ROB_Reset()

	Reset DO_P003_StartPulver;
	Reset DO_P006_AnomaliaRobot;
	Reset DO_P007_StartExpulsAdel;
	Reset DO_P008_StartExpulsAtras;
	Reset DO_P010_PrgCargado;
	Reset DO_P011_PrgExistente;
	Reset DO_P012_PrgAusente;
	Reset DO_P013_OkCerrarMdf;
	Reset DO_P014_PulverRadPM;
	Reset DO_P015_PzIncompleta;
	Reset DO_P017_PrgGuardado;
	Reset DO_P018_PulverEmbolo;
	Reset DO_P019_PulverRadPF;
	Reset DO_P021_ErrSnsStartPulver;
	Reset DO_P022_FinCiclo;
	Reset DO_P064_FinCicloInsertos;
	Reset DO_P242_PrnStartDespColoc;
	Reset DO_P243_PrnStartDespRecog;
	Reset DO_W02_LuzAmarillo;
	Reset DO_W03_AlarmaAcustica;
	Reset DO_W08_StartCintaBuena;
	Reset DO_V05_MdfFueraAreaTrab_User;
	Reset DO_V06_PrensaFueraAreaTrab_User;
	Reset DO_V08_LuzRoja;

	bCalidad:=FALSE;
	bPzIncompleta:=FALSE;
	bPzRechazoDeMdf:=FALSE;
	bPzBuenaDeMdf:=FALSE;
	bEyeccionKo:=FALSE;
	bPzColocada:=TRUE;
	bPrnOkColoc:=FALSE;
	bPrnOkRecog:=FALSE;
	bRecogCtrlMdf:=FALSE;
	
	ClkReset timerEXT;
	ClkReset timerROB;
	ClkReset timerMDF;
	
	nTipoPzEnPinza:=0;
	
	FOR i FROM 1 TO 11 DO
		stVideo{i}:=" ";
	ENDFOR
		
ENDPROC
	
!*********************************************************
! Routine:  ROB_Homing()
!*********************************************************
PROC ROB_Homing()
    
    VAR bool bRobEnHome;
    VAR bool bRobEnEspera;

    ROB_HomingInterrupt;

 aaa:
    USR_toolRestore:=CTool();
    ROB_pStartHoming:=CRobT(\Tool:=USR_toolRestore\WObj:=wobjMDF);
    ROB_jStartHoming:=CJointT();
    
    bRobEnHome:=CtrlRobPos(ROB_pHome);
    bRobEnEspera:=CtrlRobPos(MDF_pEspera);
    
    IF (bRobEnHome=FALSE) AND (bRobEnEspera=FALSE) THEN
        USR_Print(s_LineaVuota{nIdioma});
        USR_Print(s_PremiStart1{nIdioma});
        USR_Print(s_PremiStart2{nIdioma});
    ENDIF
    
	WaitTime \InPos, 0;
	SoftDeact;
	ROB_PinzaCerrar;
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	IF bRobEnHome OR bRobEnEspera THEN
		ROB_nPosRobot:=0;
	ELSEIF ROB_jStartHoming.robax.rax_1>=(njMdfMin) AND ROB_jStartHoming.robax.rax_1<(njMdfMax) THEN
		ROB_nPosRobot:=1;
		USR_Print(s_RiprPfo{nIdioma});
	ELSEIF ROB_jStartHoming.robax.rax_1>=(njUtilMin) AND ROB_jStartHoming.robax.rax_1<(njUtilMax) THEN
		ROB_nPosRobot:=2;
		USR_Print(s_RiprUtil{nIdioma});
	ELSEIF ROB_jStartHoming.robax.rax_1>=(njCubaMin) AND ROB_jStartHoming.robax.rax_1<(njCubaMax) THEN
		ROB_nPosRobot:=3;
		USR_Print(s_RiprRaffr{nIdioma});
	ELSEIF ROB_jStartHoming.robax.rax_1>=(njRampaMin) AND ROB_jStartHoming.robax.rax_1<(njRampaMax) THEN
		ROB_nPosRobot:=4;
		USR_Print(s_RiprBuoni{nIdioma});
	ELSEIF ROB_jStartHoming.robax.rax_1>=(njPrensaMin) AND ROB_jStartHoming.robax.rax_1<(njPrensaMax) THEN
		ROB_nPosRobot:=5;
		USR_Print(s_RiprTrancia{nIdioma});
    ELSE
		USR_Print(s_RiprErrore{nIdioma});
        WaitTime 3;
        ROB_nPosRobot:=99;
	ENDIF
	
	TEST ROB_nPosRobot
	CASE 0:
		! HOME POSITION // ESPERA ENTRADA
		IDelete intVel0;
		IDelete intVelStd;
		SpeedRefresh 25;
		MoveL ROB_pHome,v1000,fine,USR_toolRestore\wobj:=wobjMDF;
		SpeedRefresh 100;
	CASE 1:
		! MDF (Máquina De Fundición inyectada)
		IF ROB_jStartHoming.robax.rax_2>0 THEN
			MoveL RelTool(ROB_pStartHoming,0,80,0),v100,z1,USR_toolRestore\wobj:=wobjMDF;
			MoveL MDF_p02,v100,z1,USR_toolRestore\wobj:=wobjMDF;
			MoveJ MDF_p01, v100, z1, USR_toolPinza\WObj:=wobjMDF;
        ENDIF
		MoveJ MDF_pEspera,v100,z1,USR_toolRestore\wobj:=wobjMDF;
		MoveL ROB_pHome,v100,fine,USR_toolRestore\wobj:=wobjMDF;
	    WaitDI DI_P305_01_StartCiclo,0;
        WaitDI DI_P305_01_StartCiclo,1;
	CASE 2:
		! UTIL
		MoveJ UTL_p62, v100, z1, USR_toolPinza\WObj:=wobjMDF;
		MoveJ ROB_pHome,v100,fine,USR_toolRestore\wobj:=wobjMDF;
	    WaitDI DI_P305_01_StartCiclo,0;
        WaitDI DI_P305_01_StartCiclo,1;
	CASE 3:
		! CUBA DE AGUA
		MoveJ Offs(ROB_pStartHoming,0,0,300),v100,z1,USR_toolRestore\wobj:=wobjMDF;
		MoveJ ENF_p23, v100, z1, USR_toolPinza\WObj:=wobjMDF;
		MoveJ ROB_pHome,v100,fine,USR_toolRestore\wobj:=wobjMDF;
	    WaitDI DI_P305_01_StartCiclo,0;
        WaitDI DI_P305_01_StartCiclo,1;
	CASE 4:
		! RAMPA BUENA/CALIDAD
		MoveJ Offs(ROB_pStartHoming,0,0,300),v100,z1,USR_toolRestore\wobj:=wobjMDF;
		MoveJ BUE_p14, v100, z1, USR_toolPinza\WObj:=wobjMDF;
		MoveJ ROB_pHome,v100,fine,USR_toolRestore\wobj:=wobjMDF;
	    WaitDI DI_P305_01_StartCiclo,0;
        WaitDI DI_P305_01_StartCiclo,1;
	CASE 5:
		! PRENSA
		MoveJ Offs(ROB_pStartHoming,0,0,50),v100,z1,USR_toolRestore\wobj:=wobjMDF;
		MoveJ PRN_p14, v100, z1, USR_toolPinza\WObj:=wobjMDF;
		MoveJ ROB_pHome,v100,fine,USR_toolRestore\wobj:=wobjMDF;
	    WaitDI DI_P305_01_StartCiclo,0;
        WaitDI DI_P305_01_StartCiclo,1;
    CASE 99:
		! POSICIÓN DESCONOCIDA: MOVIMIENTO MANUAL!
        Stop;
        GOTO aaa;
	DEFAULT:
		IDelete intVel0;
		IDelete intVelStd;
		SpeedRefresh 100;
		EXIT;
	ENDTEST
	
	IDelete intVel0;
	IDelete intVelStd;
	SpeedRefresh 100;
    
ENDPROC
  
!*********************************************************
! Routine:  ROB_SetFueraArea() 
!*********************************************************
PROC ROB_SetFueraArea()

	Set DO_V05_MdfFueraAreaTrab_User;
	Set DO_V06_PrensaFueraAreaTrab_User;
	
ENDPROC
  
!*********************************************************
! Routine:  ROB_PinzaAbrir
!*********************************************************
PROC ROB_PinzaAbrir()
	
	WaitTime \InPos, 0;
	Set DO_W09_PinzaAbre;
	WaitTime nTiempoPinzaAbrir;
	GripLoad load0;
	
ENDPROC
  
!*********************************************************
! Routine:  ROB_PinzaCerrar
!*********************************************************
PROC ROB_PinzaCerrar()
	
	WaitTime \InPos, 0;
	Reset DO_W09_PinzaAbre;
	WaitTime nTiempoPinzaCerrar;
	GripLoad loadPieza;
	
ENDPROC
  
!*********************************************************
! Routine:  ROB_AlarmaAcustica()
! Input parameter:  ancho de pulso
!*********************************************************
PROC ROB_AlarmaAcustica (
		num nLength)

	Reset DO_W03_AlarmaAcustica;
	PulseDO\PLength:=nLength, DO_W03_AlarmaAcustica;
	
ENDPROC

!*********************************************************
! Routine:  ROB_ControlAire()
!*********************************************************
PROC ROB_ControlAire()
	VAR bool bAireKo:=TRUE;
	
	WHILE bAireKo=TRUE DO
		WaitDi DI_W21_PresAire,1 \MaxTime:=nTiempoMaxDIAire\TimeFlag:=bAireKo;
		IF bAireKo=TRUE THEN
			Set DO_V08_LuzRoja;
			ROB_AlarmaAcustica(2);
			Reset DO_P042_ErrPresAire;
			PulseDO\PLength:=1,DO_P042_ErrPresAire;
			USR_Print(s_PressioneAria{nIdioma});
			USR_Print(s_AttesaReset{nIdioma});
			WaitDi DI_V01_ResetAllRob,1;
		ENDIF
		Reset DO_V08_LuzRoja;
	ENDWHILE
	
ENDPROC
    
!*********************************************************
! Routine:  ROB_FinCiclo()
!*********************************************************
PROC ROB_FinCiclo()
    VAR bool bTemp:=FALSE;
	
	IF (bHbltcCicloSpec=TRUE AND bHbltcPrensaRecog=TRUE AND DI_P309_05_HbltcPrensa=1) THEN
		USR_Print(s_CicloTrancia{nIdioma});
		bPrnOkRecog:=PrensaCtrlRecog();
		IF bPrnOkRecog=TRUE THEN
			mDEP_PrnRecog;
			mDEP_PzPrensadaColoc;
			mROB_Home;
		ENDIF
	ENDIF
	
	WaitTime \InPos, 0;
	
	! espera fine de ciclo de prensa (si activada)
	IF (bHbltcPrensaColoc=TRUE AND DI_P309_05_HbltcPrensa=1 AND DI_P240_PrnAuto=1) THEN
		USR_MsgWaitDI DI_P242_PrnOkColoc,s_AttesaFineCicloTrancia{nIdioma};		
		WaitUntil (DI_P242_PrnOkColoc=1 OR DI_P243_PrnOkRecog=1)\MaxTime:=nTiempoMaxDIPrnFinCiclo\TimeFlag:=bTemp;
	ENDIF
	
	USR_Print(s_OkAperturaPorta{nIdioma});
	Reset DO_P022_FinCiclo;
	PulseDO\PLength:=2,DO_P022_FinCiclo;
	Waittime 1;
	! Reset DO_V00_MotorOff;
	! PulseDO\PLength:=0.2,DO_V00_MotorOff;
	WaitTime 1;
	
ENDPROC
  
!*********************************************************
! Routine:  mROB_Home()
!*********************************************************
PROC mROB_Home()

	USR_Print(s_RobotHome{nIdioma});
	MoveJ ROB_pHome, vmax, z5, USR_toolPinza\wobj:=wobjMDF;
	
ENDPROC
  
!*********************************************************
! Routine:  mMDF_Espera()
!*********************************************************
PROC mMDF_Espera()

	USR_Print(s_RobotDavantiPfo{nIdioma});
	MoveL MDF_pEspera,vmax,z5,USR_toolPinza\wobj:=wobjMDF;
	
ENDPROC
  
!*********************************************************
! Routine:  MDF_EsperaInsAutIny()
!*********************************************************
PROC MDF_EsperaInsAutIny()

	ClkStop timerROB;
	ROB_nTimerROB:=ClkRead(timerROB);
	
	WHILE DI_P000_RobotActivado=0 OR DI_P001_MdfCicloAuto=0 OR DI_P002_InyeccionOk=0 DO
		IF DI_P000_RobotActivado=0 THEN
			USR_MsgWaitDI DI_P000_RobotActivado,s_RobotInserito{nIdioma};
			WaitDI DI_P000_RobotActivado,1;
		ELSEIF DI_P001_MdfCicloAuto=0 THEN
			USR_MsgWaitDI DI_P001_MdfCicloAuto,s_AutomaticoPfo{nIdioma};
			WaitDI DI_P001_MdfCicloAuto,1;
		ELSEIF DI_P002_InyeccionOk=0 THEN
			USR_MsgWaitDI DI_P002_InyeccionOk, s_AttesaPrelievoPfo{nIdioma};
			WaitDI DI_P002_InyeccionOk,1;
		ENDIF
	ENDWHILE

ENDPROC
  
!*********************************************************
! Routine:  MDF_EsperaEntrada()
!*********************************************************
PROC MDF_EsperaEntrada()
	
	bMassaloteKo:=FALSE;
	IDelete intMslKo;
	CONNECT intMslKo WITH TR_MtzNonOk;
	ISignalDI DI_P013_MassaloteNonOk, 1, intMslKo;
  
	WHILE (DI_P000_RobotActivado=0 OR DI_P001_MdfCicloAuto=0 OR DI_P006_MoldeAbierto=0 OR DI_P002_InyeccionOk=0 OR DI_P005_ExpulsAtras=0 OR DI_P009_PuertaAbierta=0) AND bMassaloteKo=FALSE DO
		IF DI_P000_RobotActivado=0 THEN
			USR_MsgWaitDI DI_P000_RobotActivado,s_RobotInserito{nIdioma};
			WaitDI DI_P000_RobotActivado,1;
		ELSEIF DI_P001_MdfCicloAuto=0 THEN
			USR_MsgWaitDI DI_P001_MdfCicloAuto,s_AutomaticoPfo{nIdioma};
			WaitDI DI_P001_MdfCicloAuto,1;
		ELSEIF DI_P002_InyeccionOk = 0 THEN
			USR_MsgWaitDI DI_P002_InyeccionOk, s_AttesaPrelievoPfo{nIdioma};
			WaitDI DI_P002_InyeccionOk,1;
		ELSEIF DI_P005_ExpulsAtras = 0 THEN
			USR_MsgWaitDI DI_P005_ExpulsAtras, s_AttesaEstrazInd{nIdioma};
			WaitDI DI_P005_ExpulsAtras,1;
		ELSEIF DI_P009_PuertaAbierta=0 THEN
			USR_MsgWaitDI DI_P009_PuertaAbierta,s_AttesaCancAperto{nIdioma};
			WaitDI DI_P009_PuertaAbierta,1;
		ELSEIF DI_P006_MoldeAbierto=0 THEN
			USR_MsgWaitDI DI_P006_MoldeAbierto,s_AttesaAperturaPfo{nIdioma};
			WaitDI DI_P006_MoldeAbierto,1;
		ENDIF
	ENDWHILE
	
	IDelete intMslKo;

	ClkStop timerMDF;
	ROB_ntimerMDF:=ClkRead(timerMDF);
	ClkReset timerMDF;
	ClkStart timerMDF;
	ClkStart timerEXT;
	
ENDPROC

	TRAP TR_MtzNonOk
		bMassaloteKo:=TRUE;
	ENDTRAP
	
!*********************************************************
! Routine:  ROB_MoldeAbiertoInt()
!*********************************************************
PROC ROB_MoldeAbiertoInt()

	IDelete intVel0;
	CONNECT intVel0 WITH TR_Vel0;
	ISignalDI DI_P006_MoldeAbierto, 0, intVel0;
	
	IDelete intVelStd;
	CONNECT intVelStd WITH TR_VelStd;
	ISignalDI DI_P006_MoldeAbierto, 1, intVelStd;
	
ENDPROC
  
!*********************************************************
! Routine:  mMDF_Recogida()
!*********************************************************
PROC mMDF_Recogida()
	
	MoveL MDF_pEspera,vmax,z5,USR_toolPinza\wobj:=wobjMDF;
	
	bRecogCtrlMdf:=FALSE;
	IF bHbltcCtrlMoldeAbierto=TRUE THEN
		ROB_MoldeAbiertoInt;
		bRecogCtrlMdf:=TRUE;
	ENDIF
	
	bAnomSnsPulver:=FALSE;
	IF DI_W16_SnsStartPulver=1 THEN
		bAnomSnsPulver:=TRUE;
		USR_Print(s_AnomaliaSnsStartLub{nIdioma});
		ROB_AlarmaAcustica(2);
	ENDIF
	
	USR_Print(s_PrelievoPfo{nIdioma});
	Set DO_W09_PinzaAbre;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	Reset DO_P003_StartPulver;
	Reset DO_P013_OkCerrarMdf;
	Reset DO_V05_MdfFueraAreaTrab_User;
	
	MoveJ MDF_p01, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p02, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	IF bHbltcSoftservo=FALSE THEN
		Set DO_P007_StartExpulsAdel;
	ENDIF
	
	ConfL\Off;
	SingArea\Wrist;
	
	MoveL MDF_p03, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN DE RECOGIDA <<<===
	MoveL MDF_pRecog, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ==================================
	
	! memorización pieza buena/calidad/rechazo
	bPzRechazoDeMdf:=FALSE;
	bPzBuenaDeMdf:=FALSE;
	IF (DI_P018_MdfStartUp=0 AND DI_P019_PzRechazo=0 AND DI_P011_PzBuena=1 AND bCalidad=FALSE) THEN
		bPzBuenaDeMdf:=TRUE;
		nTipoPzEnPinza:=1;
        USR_Print(s_PinzaBuono{nIdioma});
	ELSEIF (DI_P018_MdfStartUp=0 AND DI_P019_PzRechazo=0 AND DI_P011_PzBuena=1 AND bCalidad=TRUE) THEN
		bPzBuenaDeMdf:=TRUE;
		nTipoPzEnPinza:=4;
        USR_Print(s_PinzaQualita{nIdioma});
	ELSE
		bPzRechazoDeMdf:=TRUE;
		nTipoPzEnPinza:=3;
        USR_Print(s_PinzaScarto{nIdioma});
	ENDIF
	
	USR_Print(s_EstrazionePfo{nIdioma});
	IF bHbltcSoftservo=TRUE THEN
		! recogida CON ACOMPAÑAMIENTO (SOFTSERVO)
		Reset DO_W09_PinzaAbre;
		bPzColocada:=FALSE;
		! opzione???
		! MotionSup \Off;
		SoftAct 1, 95;
		! SoftAct 2, 20;
		! SoftAct 3, 20;
		SoftAct 4, 20;
		SoftAct 5, 20;
		SoftAct 6, 20;
		WaitTime nTiempoPinzaCerrar;	!tiempo espera pasaje hacia ejes soft
		Set DO_P007_StartExpulsAdel;
		USR_MsgWaitDI DI_P004_ExpulsAdel,s_EstrazioneAvanti{nIdioma};
		!MoveL Offs(MDF_pRecog, 0, GInput(GI_P128_143_CarreraExtraccion)+10, 0), v500, z50, USR_toolPinza\WObj:=wobjMDF;
		WaitDI DI_P004_ExpulsAdel,1\MaxTime:=nTiempoMaxDIEyecAdel\TimeFlag:=bEyeccionKo;
	ELSE
		! recogida SIN acompañamiento
		WaitTime\InPos,  0;
		USR_MsgWaitDI DI_P004_ExpulsAdel,s_EstrazioneAvanti{nIdioma};
		WaitDI DI_P004_ExpulsAdel,1\MaxTime:=nTiempoMaxDIEyecAdel\TimeFlag:=bEyeccionKo;
		IF bEyeccionKo=FALSE THEN
			ROB_PinzaCerrar;
			bPzColocada:=FALSE;
		ENDIF
	ENDIF
	
	IF bEyeccionKo=TRUE THEN
		USR_Print(s_EstrazioneFallita{nIdioma});
		ROB_AlarmaAcustica(2);
		Set DO_V08_LuzRoja;
		SpeedRefresh 20;
		ROB_PinzaAbrir;
		nTipoPzEnPinza:=0;
		bPzColocada:=TRUE;
	ENDIF
	
    IF bEyeccionKo=FALSE THEN
        MDF_pTemp:=CRobT(\Tool:=USR_toolPinza\WObj:=wobjMDF);
        MoveL MDF_pTemp, v300, fine, USR_toolPinza\WObj:=wobjMDF;
    ENDIF
	SoftDeact;
	
	MoveL MDF_p04, v1000, fine, USR_toolPinza\WObj:=wobjMDF;
	
	SingArea\Off;
	ConfL\On;
	WaitTime\InPos,  0;
    Reset DO_P007_StartExpulsAdel;
	
    IF bEyeccionKo=FALSE THEN
		GripLoad loadPieza;
    ENDIF
	! opzione???
	! MotionSup \On;
	
ENDPROC

!*********************************************************
! Routine:  mMDF_Salida()
!*********************************************************
PROC mMDF_Salida()
	
	USR_Print(s_UscitaPfo{nIdioma});
	
	MoveL\Conc, MDF_p10, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL\Conc, MDF_p11, vmax, z50, USR_toolPinza\wobj:=wobjMDF;
	MoveJ MDF_p12, vmax, z50, USR_toolPinza\wobj:=wobjMDF;
	
	bErrSnsPulver:=FALSE;
	IF bHbltcSnsAntPulver=TRUE AND bEyeccionKo=FALSE THEN
		MoveJ MDF_p20, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
		MoveJ MDF_p21, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
		
		USR_Print(s_ControlloFtc{nIdioma});
		
		! ===>>> POSICIÓN de CONTROL START PULVER. <<<===
		MoveL MDF_pControl, v500, fine, USR_toolPinza\WObj:=wobjMDF;
		! ===============================================
		
		WaitTime\InPos, 0.3;
		IF (DI_W16_SnsStartPulver=1 AND bAnomSnsPulver=FALSE) THEN
			Reset DO_P003_StartPulver;
			PulseDO\PLength:=1,DO_P003_StartPulver;
			ClkStop timerEXT;
			ROB_nTimerEXT:=ClkRead(timerEXT);
			ClkReset timerEXT;
			USR_Print(s_OkSnsStartLub{nIdioma});
		ELSE
			bErrSnsPulver:=TRUE;
            ROB_AlarmaAcustica(2);
			USR_Print(s_AllarmeSnsStartLub{nIdioma});
		ENDIF
		
		MoveJ MDF_p30, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
		MoveJ MDF_p31, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	ENDIF
	
	MoveJ MDF_p13, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN FUERA de la PUERTA de la MÁQUINA!!! <<<===
	MoveJDO MDF_p14, vmax, z50, USR_toolPinza\WObj:=wobjMDF, DO_V05_MdfFueraAreaTrab_User,1;
	! ==========================================================
	
	IDelete intVel0;
	IDelete intVelStd;
	bRecogCtrlMdf:=FALSE;
	
	IF bPzRechazoDeMdf=TRUE THEN
		ROB_AlarmaAcustica(1);
		USR_Print(s_ScartoDcm{nIdioma});
	ENDIF

ENDPROC

!*********************************************************
! Routine:  mMDF_ErrSalida()
!*********************************************************
PROC mMDF_ErrSalida()
	
	USR_Print(s_UscitaPfo{nIdioma});
	
	ConfL\Off;
	SingArea\Wrist;
	MoveL MDF_p02, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	SingArea\Off;
	ConfL\On;
	MoveJ MDF_p01, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
    MoveJ MDF_pEspera,vmax,z5,USR_toolPinza\wobj:=wobjMDF;
	MoveL ROB_pHome, vmax, z5, USR_toolPinza\wobj:=wobjMDF;
	
    WaitTime\InPos, 0.5;
    Set DO_V05_MdfFueraAreaTrab_User;
	
	IDelete intVel0;
	IDelete intVelStd;

ENDPROC
  
!*********************************************************
! Routine:  mSNS_ControlPz()
!*********************************************************
PROC mSNS_ControlPz()

	SNS_CtrlFuncionamiento;
	
	MoveJ SNS_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ SNS_p02, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
    
	USR_Print(s_ControlloFtc{nIdioma});
	
	bErrCtrl1:=FALSE;
	bErrCtrl2:=FALSE;
	bErrCtrl3:=FALSE;
	bErrCtrl4:=FALSE;
	bPzIncompleta:=FALSE;
	
	! ===>>> 1a POSICIÓN de CONTROL SENSORES <<<===
	MoveL SNS_pControl1, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! =============================================
	WaitTime\InPos, 0.3;
	SNS_CtrlPieza;
	bErrCtrl1:=bErrCtrlSns;
	
	!IF bErrCtrlSns=FALSE THEN
	!	! ===>>> 2a POSICIÓN de CONTROL SENSORES <<<===
	!	MoveL SNS_pControl2, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	!	! =============================================
	!	WaitTime\InPos, 0.3;
	!	SNS_CtrlPieza;
	!	bErrCtrl2:=bErrCtrlSns;
	!ENDIF
	
	!IF bErrCtrlSns=FALSE THEN
	!	! ===>>> 3a POSICIÓN de CONTROL SENSORES <<<===
	!	MoveL SNS_pControl3, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	!	! =============================================
	!	WaitTime\InPos, 0.3;
	!	SNS_CtrlPieza;
	!	bErrCtrl3:=bErrCtrlSns;
	!ENDIF
	
	!IF bErrCtrlSns=FALSE THEN
	!	! ===>>> 4a POSICIÓN de CONTROL SENSORES <<<===
	!	MoveL SNS_pControl4, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	!	! =============================================
	!	WaitTime\InPos, 0.3;
	!	SNS_CtrlPieza;
	!	bErrCtrl4:=bErrCtrlSns;
	!ENDIF
	
	! resultado final de todos los controles
	bPzIncompleta:=bErrCtrl1 OR bErrCtrl2 OR bErrCtrl3 OR bErrCtrl4;
	
	! start pulverizador
	Reset DO_P003_StartPulver;
	PulseDO\PLength:=1, DO_P003_StartPulver;
	
	! cronômetro tempo extração
	IF (bHbltcSnsAntPulver=FALSE OR bErrSnsPulver=TRUE) THEN
		ClkStop timerEXT;
		ROB_nTimerEXT:=ClkRead(timerEXT);
		ClkReset timerEXT;
	ENDIF
	
	! anomalía de control funcionamiento sensores
	IF bSnsDefect=TRUE THEN
		bPzIncompleta:=TRUE;
	ENDIF
	
	! opción: non rechazo piezas incompletas
	IF bHbltcGuardarIncompl=TRUE THEN
		bPzIncompleta:=FALSE;
	ENDIF
	
	! anomalía de sensor start anticipado pulverizador
	IF (bErrSnsPulver=TRUE OR bAnomSnsPulver=TRUE) THEN
		Reset DO_P021_ErrSnsStartPulver;
		PulseDO\PLength:=1,DO_P021_ErrSnsStartPulver;
	ENDIF
	
	MDF_Start;
	
	MoveJ SNS_p10, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ SNS_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
ENDPROC

!*********************************************************
! Routine:  SNS_CtrlFuncionamiento()
!*********************************************************
PROC SNS_CtrlFuncionamiento()
	VAR errnum errvar;
	VAR num nKey:=0;
	
	USR_Print(s_FunzionalitaFtc{nIdioma});
check:
	bSnsDefect:=FALSE;
	FOR i from 1 to 10 DO
		nSnsDefect{i}:=0;
	ENDFOR
	
	IF bHbltcSns01=TRUE AND DI_W00_Sns01=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{1}:=1;
	ENDIF
	IF bHbltcSns02=TRUE AND DI_W01_Sns02=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{2}:=1;
	ENDIF
	IF bHbltcSns03=TRUE AND DI_W02_Sns03=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{3}:=1;
	ENDIF
	IF bHbltcSns04=TRUE AND DI_W03_Sns04=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{4}:=1;
	ENDIF
	IF bHbltcSns05=TRUE AND DI_W04_Sns05=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{5}:=1;
	ENDIF
	IF bHbltcSns06=TRUE AND DI_W05_Sns06=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{6}:=1;
	ENDIF
	IF bHbltcSns07=TRUE AND DI_W06_Sns07=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{7}:=1;
	ENDIF
	IF bHbltcSns08=TRUE AND DI_W07_Sns08=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{8}:=1;
	ENDIF
	IF bHbltcSns09=TRUE AND DI_W08_Sns09=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{9}:=1;
	ENDIF
	IF bHbltcSns10=TRUE AND DI_W09_Sns10=1 THEN
		bSnsDefect:=TRUE;
		nSnsDefect{10}:=1;
	ENDIF
	
	IF bSnsDefect=TRUE THEN
		USR_Print(s_LineaVuota{nIdioma});
		Reset DO_P015_PzIncompleta;
		PulseDO\PLength:=2,DO_P015_PzIncompleta;
		Reset DO_P006_AnomaliaRobot;
		PulseDO\PLength:=2,DO_P006_AnomaliaRobot;
		FOR i FROM 1 TO 10 DO
			IF nSnsDefect{i}<>0 THEN
				USR_Print(s_GuastoFtc1{nIdioma}+NumToStr(i,0)+s_GuastoFtc2{nIdioma});
			ENDIF
		ENDFOR
		Set DO_V08_LuzRoja;        
		ROB_AlarmaAcustica(2);
		TPReadFK nKey,s_AnomaliaTestFtc{nIdioma},stEmpty,stEmpty,stEmpty,stEmpty,"OK" \DIBreak:=DI_V01_ResetAllRob\BreakFlag:=errvar;
		IF errvar=ERR_TP_DIBREAK nKey:=5;
		TEST nKey
		CASE 5:
			nKey:=0;
			GOTO check;
		ENDTEST
	ENDIF
	Reset DO_V08_LuzRoja;
	Reset DO_P015_PzIncompleta;
	Reset DO_P006_AnomaliaRobot;
	
ENDPROC

!*********************************************************
! Routine:  SNS_CtrlPieza()
!*********************************************************
PROC SNS_CtrlPieza()
	
	bErrCtrlSns:=FALSE;
	
	! inicialización array nSnsAusentes
	FOR i from 1 to 10 DO
		nSnsAusentes{i}:=0;
	ENDFOR
	
	! control sesnores
	IF bHbltcSns01=TRUE AND DI_W00_Sns01=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{1}:=1;
	ENDIF  
	IF bHbltcSns02=TRUE AND DI_W01_Sns02=0 THEN
	   	bErrCtrlSns:=TRUE;
		nSnsAusentes{2}:=1;
	ENDIF  
	IF bHbltcSns03=TRUE AND DI_W02_Sns03=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{3}:=1;
	ENDIF  
	IF bHbltcSns04=TRUE AND DI_W03_Sns04=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{4}:=1;
	ENDIF
	IF bHbltcSns05=TRUE AND DI_W04_Sns05=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{5}:=1;
	ENDIF
	IF bHbltcSns06=TRUE AND DI_W05_Sns06=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{6}:=1;
	ENDIF
	IF bHbltcSns07=TRUE AND DI_W06_Sns07=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{7}:=1;
	ENDIF
	IF bHbltcSns08=TRUE AND DI_W07_Sns08=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{8}:=1;
	ENDIF
    IF bHbltcSns09=TRUE AND DI_W08_Sns09=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{9}:=1;
	ENDIF
	IF bHbltcSns10=TRUE AND DI_W09_Sns10=0 THEN
		bErrCtrlSns:=TRUE;
		nSnsAusentes{10}:=1;
	ENDIF
	
	! anomalía pieza incompleta
	IF bErrCtrlSns=TRUE THEN
		Reset DO_P015_PzIncompleta;
		! PulseDO\PLength:=2,DO_P015_PzIncompleta;
		Set DO_P015_PzIncompleta;
		Reset DO_P006_AnomaliaRobot;
		PulseDO\PLength:=2,DO_P006_AnomaliaRobot;
		FOR i FROM 1 TO 10 DO
			IF nSnsAusentes{i}<>0 THEN
				USR_Print(s_ErroreFtc{nIdioma}+NumToStr(i,0));
			ENDIF
		ENDFOR
		Set DO_V08_LuzRoja;
		ROB_AlarmaAcustica(2);
		USR_Print(s_AttesaReset{nIdioma});
		WaitDI DI_V01_ResetAllRob, 1;
		Reset DO_V08_LuzRoja;
		Reset DO_P015_PzIncompleta;
		Reset DO_P006_AnomaliaRobot;
	ENDIF
	
ENDPROC

!*********************************************************
! Routine:  MDF_Start()
!*********************************************************
PROC MDF_Start()
	VAR bool bStop:=FALSE;
    
	IF (bHbltcStopPrensaNoAuto=TRUE AND bHbltcPrensaColoc=TRUE AND DI_P309_05_HbltcPrensa=1 AND DI_P240_PrnAuto=0) THEN
        USR_Print(s_AutomaticoTrancia{nIdioma});
		bStop:=TRUE;
    ENDIF
	
	IF (bHbltcUtilInt=TRUE AND bHbltcSnsUtilInt=TRUE AND bHbltcStopUtilSns=TRUE AND DI_W17_SnsUtilIntermedio=1) THEN
        USR_Print(s_UtilOccupato{nIdioma});
		bStop:=TRUE;
    ENDIF
	
	IF bStop=TRUE THEN
		Set DO_V08_LuzRoja;
		ROB_AlarmaAcustica(2);
		Reset DO_P006_AnomaliaRobot;
		PulseDO\PLength:=2,DO_P006_AnomaliaRobot;
		USR_Print(s_AttesaReset{nIdioma});
		WaitDi DI_V01_ResetAllRob,1;
		Reset DO_V08_LuzRoja;
		Reset DO_W03_AlarmaAcustica;
		Reset DO_P006_AnomaliaRobot;
	ENDIF
		
	Reset DO_P013_OkCerrarMdf;
	PulseDO\PLength:=1,DO_P013_OkCerrarMdf;
	
	IF DI_P016_MdfFinCiclo=1 THEN
		ROB_AlarmaAcustica(2);
		USR_Print(s_FineCiclo{nIdioma});
	ENDIF
	
	Incr ROB_nPzTotal;
	IF (bPzBuenaDeMdf=TRUE AND bPzIncompleta=FALSE) THEN
		Incr ROB_nPzBuona;
	ELSE
		Incr ROB_nPzRechazo;
	ENDIF		
	
	ClkReset timerROB;
	ClkStart timerROB;
	
ENDPROC

!*********************************************************
! Routine:  PrensaCtrlColoc() 
!*********************************************************
FUNC bool PrensaCtrlColoc()
	VAR bool bPrnColocKo:=FALSE;
	
	IF DI_P240_PrnAuto=1 THEN
		USR_MsgWaitDI DI_P242_PrnOkColoc,s_AttesaDepoTrancia{nIdioma};
		WaitDi DI_P242_PrnOkColoc,1 \MaxTime:=nTiempoMaxDIPrnColoc\TimeFlag:=bPrnColocKo;
		IF bPrnColocKo=TRUE THEN
			Set DO_V08_LuzRoja;
			ROB_AlarmaAcustica(2);
			USR_Print(s_CaricoTranciaKo{nIdioma});
			WaitTime nTiempoMensAnom;
			Reset DO_V08_LuzRoja;
			RETURN FALSE;
		ELSE
			RETURN TRUE;
		ENDIF
	ELSE
		Set DO_V08_LuzRoja;
		ROB_AlarmaAcustica(2);
		USR_Print(s_AutomaticoTrancia{nIdioma});
		WaitTime nTiempoMensAnom;
		Reset DO_V08_LuzRoja;
		RETURN FALSE;
	ENDIF
	
ENDFUNC

!*********************************************************
! Routine:  PrensaCtrlRecog() 
!*********************************************************
FUNC bool PrensaCtrlRecog()
	VAR bool bPrnRecoglKo:=FALSE;
	
	IF DI_P240_PrnAuto=1 THEN
		USR_MsgWaitDI DI_P243_PrnOkRecog,s_AttesaPrelievoTrancia{nIdioma};
		WaitDi DI_P243_PrnOkRecog,1 \MaxTime:=nTiempoMaxDIPrnRecog\TimeFlag:=bPrnRecoglKo;
		IF bPrnRecoglKo=TRUE THEN
			Set DO_V08_LuzRoja;
			ROB_AlarmaAcustica(2);
			USR_Print(s_ErrPrelievoTrancia{nIdioma});
			WaitTime nTiempoMensAnom;
			Reset DO_V08_LuzRoja;
			RETURN FALSE;
		ELSE
			RETURN TRUE;
		ENDIF
	ELSE
		Set DO_V08_LuzRoja;
		ROB_AlarmaAcustica(2);
		USR_Print(s_AutomaticoTrancia{nIdioma});
		WaitTime nTiempoMensAnom;
		Reset DO_V08_LuzRoja;
		RETURN FALSE;
	ENDIF
	
ENDFUNC

!*********************************************************
! Routine:  mENF_Cuba()
!*********************************************************
PROC mENF_Cuba()

	USR_Print(s_CicloRaffr{nIdioma});
	
	MoveJ ENF_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p03, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p04, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de ENFRIAMIENTO <<<===
	MoveL ENF_pCuba, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! ======================================
	USR_Print(s_AttesaRaff{nIdioma});
	WaitTime nTiempoEnfriam;
	
	MoveL ENF_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	! MoveJ ENF_p11, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	! MoveJ ENF_p12, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===> POSICIÓN de GOTEJAMENTO <===
	MoveL ENF_p20, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! =================================
	USR_Print(s_AttesaSgocc{nIdioma});
	WaitTime nTiempoGoteo;
	
	MoveL ENF_p21, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p22, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p23, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
ENDPROC

!*********************************************************
! Routine:  mDEP_UtilIntColoc()
!*********************************************************
PROC mDEP_UtilIntColoc()

	USR_Print(s_UtilDepo{nIdioma});
	
	MoveJ UTL_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p03, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL UTL_p04, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN DE COLOCACIÓN <<<===
	MoveL UTL_pColoc, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! =====================================
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL UTL_p10, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p11, v1500, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p12, v1500, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! control sensor
	IF (bHbltcSnsUtilInt=TRUE AND DI_W17_SnsUtilIntermedio=0) THEN
		USR_Print(s_UtilSnsDeact{nIdioma});
		Set DO_V08_LuzRoja;
		ROB_AlarmaAcustica(2);
		Reset DO_P006_AnomaliaRobot;
		PulseDO\PLength:=2,DO_P006_AnomaliaRobot;
		USR_Print(s_AttesaReset{nIdioma});
		WaitDi DI_V01_ResetAllRob,1;
		Reset DO_V08_LuzRoja;
	ENDIF

ENDPROC

!*********************************************************
! Routine:  mDEP_UtilIntRecoc()
!*********************************************************
PROC mDEP_UtilIntRecog()

	USR_Print(s_UtilPrel{nIdioma});
	
	MoveJ UTL_p51, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p52, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p53, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL UTL_p54, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN DE RECOGIDA <<<===
	MoveL UTL_pRecog, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! ==================================
	ROB_PinzaCerrar;
	nTipoPzEnPinza:=1;
	bPzColocada:=FALSE;
	
	MoveL UTL_p60, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p61, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p62, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! control sensor
	IF (bHbltcSnsUtilInt=TRUE AND DI_W17_SnsUtilIntermedio=1) THEN
		USR_Print(s_UtilSnsAct{nIdioma});
		Set DO_W02_LuzAmarillo;
		ROB_AlarmaAcustica(2);
		Reset DO_P006_AnomaliaRobot;
		PulseDO\PLength:=2,DO_P006_AnomaliaRobot;
		WaitTime nTiempoMensAnom;
		Reset DO_W02_LuzAmarillo;
	ENDIF

ENDPROC

!*********************************************************
! Routine:  mDEP_PrnColoc()
!*********************************************************
PROC mDEP_PrnColoc()

	USR_Print(s_DepositoTrancia{nIdioma});
	
	MoveJ PRN_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN FUERA de la PRENSA!!! <<<===
	MoveJDO PRN_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 0;
	! ============================================
	
	MoveJ PRN_p03, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p04, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p05, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p06, v1000, z10, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL PRN_pColoc, v200, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL PRN_p10, v500, z10, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p11, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRN_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
    
	! ===>>> POSICIÓN FUERA de la PRENSA!!! <<<===
	MoveJDO PRN_p13, vmax, z5, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 1;
	! ============================================
    
	MoveJ PRN_p14, vmax, fine, USR_toolPinza\WObj:=wobjMDF;
	
	USR_Print(s_StartTrancia{nIdioma});
	WaitTime \InPos, 0;
	Reset DO_P242_PrnStartDespColoc;
	PulseDO\PLength:=1, DO_P242_PrnStartDespColoc;
	
	Reset DO_P033_PzColocPrensa;
	PulseDO\PLength:=1, DO_P033_PzColocPrensa;
	
	WaitDi DI_P242_PrnOkColoc,0 \MaxTime:=1\TimeFlag:=bPrnErrStart1;
	IF bPrnErrStart1=TRUE THEN
		ROB_AlarmaAcustica(2);
		USR_Print(s_TranciaNonPartita{nIdioma});
		WaitTime nTiempoMensAnom;
	ENDIF
	
ENDPROC

!*********************************************************
! Routine:  mDEP_PrnRecog()
!*********************************************************
PROC mDEP_PrnRecog()

	USR_Print(s_PrelievoTrancia{nIdioma});
	Set DO_W09_PinzaAbre;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveJ PRN_p50, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN FUERA de la PRENSA!!! <<<===
	MoveJDO PRN_p51, vmax, z50, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 0;
	! ============================================
	
	MoveJ PRN_p52, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRN_p53, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p54, v1000, z10, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de RECOGIDA <<<===
	MoveL PRN_pRecog, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ==================================
		
	IF bHbltcPrnRecogSoft=TRUE THEN
		SoftAct 1,100;
		! SoftAct 2,10;
		! SoftAct 3,10;
		SoftAct 4,10;
		SoftAct 5,10;
		SoftAct 6,10;
		WaitTime nTiempoPinzaCerrar;	!tiempo espera pasaje hacia ejes soft
	ENDIF
	
	ROB_PinzaCerrar;
	nTipoPzEnPinza:=1;
	bPzColocada:=FALSE;
	
	IF bHbltcPrnRecogSoft=TRUE THEN
		WaitTime 1;
		WaitTime\InPos, 0;
		PRN_pTemp:=CRobT(\Tool:=USR_toolPinza\WObj:=wobjMDF);
		MoveL Offs(PRN_pTemp,0,0,200), v300, fine, USR_toolPinza\WObj:=wobjMDF;
		WaitTime\InPos,  0;
		SoftDeact;
	ENDIF
	
	MoveL PRN_p60, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p61, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p62, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
    
	! ===>>> POSICIÓN FUERA de la PRENSA!!! <<<===
	MoveJDO PRN_p63, vmax, z5, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 1;
	! ============================================
    
	MoveJ PRN_p64, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	USR_Print(s_StartTrancia{nIdioma});
	WaitTime \InPos, 0;
	Reset DO_P243_PrnStartDespRecog;
	PulseDO\PLength:=1, DO_P243_PrnStartDespRecog;
	
	Reset DO_P044_PzRecogPrensa;
	PulseDO\PLength:=1, DO_P044_PzRecogPrensa;
	
	WaitDi DI_P243_PrnOkRecog,0 \MaxTime:=1\TimeFlag:=bPrnErrStart2;
	IF bPrnErrStart2=TRUE THEN
		ROB_AlarmaAcustica(2);
		USR_Print(s_TranciaNonPartita{nIdioma});
		WaitTime nTiempoMensAnom;
	ENDIF
	
ENDPROC

PROC PresaSoft()

	ROB_PinzaAbrir;
	MoveL p01, v500, fine,  USR_toolPinza\WObj:=wobjMDF;
	MoveL p02, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	
	SoftAct 1,100;
	! SoftAct 2,10;
	! SoftAct 3,10;
	SoftAct 4,10;
	SoftAct 5,10;
	SoftAct 6,10;
	WaitTime nTiempoPinzaCerrar;
	
	ROB_PinzaCerrar;
	
	WaitTime 1;
	WaitTime\InPos, 0;
	pTemp:=CRobT(\Tool:=USR_toolPinza\WObj:=wobjMDF);
	MoveL Offs(pTemp,0,0,200), v300, fine, USR_toolPinza\WObj:=wobjMDF;
	WaitTime\InPos,  0;
	SoftDeact;
	
	MoveL p01, v500, fine,  USR_toolPinza\WObj:=wobjMDF;
	
ENDPROC

!*********************************************************
! Routine:  mDEP_PzPrensadaColoc()
!*********************************************************
PROC mDEP_PzPrensadaColoc()

	USR_Print(s_DepositoTranciati{nIdioma});
	
	MoveJ PRD_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p03, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p04, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p05, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL PRD_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL PRD_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p13, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	Reset DO_P035_PzColocCintaRechazo;
	PulseDO\PLength:=nTiempPulsoCinta, DO_P035_PzColocCintaRechazo;
	
ENDPROC

!*********************************************************
! Routine:  mDEP_PzBuenaColoc()
!*********************************************************
PROC mDEP_PzBuenaColoc()

	IF bCalidad=TRUE THEN
		ROB_AlarmaAcustica(2);
		USR_Print(s_DepQualita{nIdioma});
	ELSE
		USR_Print(s_DepositoBuono{nIdioma});
	ENDIF
	
	MoveJ BUE_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p03, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p04, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL BUE_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
    IF bCalidad=TRUE THEN
		bCalidad:=FALSE;
        Reset DO_W02_LuzAmarillo;
    ENDIF
	
	MoveL BUE_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p13, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
    MoveJ BUE_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	Reset DO_P034_PzColocCintaBuena;
	PulseDO\PLength:=1, DO_P034_PzColocCintaBuena;
	
ENDPROC

!*********************************************************
! Routine:  mDEP_PzRechazoColoc()
!*********************************************************
PROC mDEP_PzRechazoColoc()

	USR_Print(s_DepositoScarto{nIdioma});
	
	MoveJ RCZ_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p03, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL RCZ_p04, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveL RCZ_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL RCZ_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL RCZ_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL RCZ_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p13, vmax, Z100, USR_toolPinza\WObj:=wobjMDF;    
	MoveJ RCZ_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	Reset DO_P035_PzColocCintaRechazo;
	PulseDO\PLength:=1, DO_P035_PzColocCintaRechazo;
	
ENDPROC
  
!*********************************************************
! Routine:  MDF_AnomaliaExtraccion()
!*********************************************************
PROC MDF_AnomaliaExtraccion()
	VAR bool bVerifInyecc:=FALSE;
	
	IF bEyeccionKo=TRUE THEN
		USR_Print(s_EstrazioneFallita{nIdioma});
	ELSEIF bMassaloteKo=TRUE THEN
		USR_Print(s_MaterozzaNonOk{nIdioma});
	ENDIF	
	
	WaitTime \InPos, 0;
	SpeedRefresh 100;
	
	Set DO_V08_LuzRoja;
	ROB_AlarmaAcustica(2);
	Reset DO_P015_PzIncompleta;
	PulseDO\PLength:=2,DO_P015_PzIncompleta;
	Reset DO_P006_AnomaliaRobot;
	PulseDO\PLength:=2,DO_P006_AnomaliaRobot;
	
	USR_Print(s_AttesaReset{nIdioma});
	WHILE DI_V01_ResetAllRob=0 DO
		IF DI_P002_InyeccionOk=0 bVerifInyecc:=TRUE;
		WaitTime 0.1;
	ENDWHILE
	Reset DO_V08_LuzRoja; 
	Reset DO_P015_PzIncompleta;
	
	IF bVerifInyecc=FALSE THEN
		IF (nHbltcMensajes=1 OR (nHbltcMensajes=2 AND DOutput(DO_V07_RobEnAuto)=1)) THEN
			USR_Print(s_AttesaIniezOkReset{nIdioma});
		ENDIF
		WaitDI DI_P002_InyeccionOk,0;
	ENDIF	
	
ENDPROC

!*********************************************************
! Routine:  zROB_PosTransporte()
!*********************************************************
PROC zROB_PosTransporte()

	MoveAbsJ jposTransporte\NoEOffs, v1000, fine, tool0;
	
ENDPROC


!*********************************************************
! Routine:  zROB_PosCalibracion()
!*********************************************************
PROC zROB_PosCalibracion()

	MoveAbsJ jposCalib\NoEOffs, v1000, fine, tool0;
	
ENDPROC

  
!*********************************************************
! Routine:  zROB_PosMontaStampi()
!*********************************************************
PROC zROB_PosMontaStampi()
	
	MoveJ ROB_pHome, v1000, z5, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MMD_p01, v1000, z5, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MMD_p02, v1000, fine, USR_toolPinza\WObj:=wobjMDF;
	Stop;
	MoveJ MMD_p01, v1000, z5, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ROB_pHome, v1000, z5, USR_toolPinza\WObj:=wobjMDF;
    
ENDPROC
  
!*********************************************************
! Routine:  zTeach_Positions()
! Advertencia: lista de todas las posiciones. Esta rutina no
!              es llamada de la rotina Main(), ma es solamente
!              un resumen para simplificar la memorizacion
!              de las posiciones.
! IMPORTANTE: Si desea añadir y/o eliminar una posición que
!             tiene que hacer en la misma rutina, no sólo aquí!!
!             Incluso VELOCIDAD 'y aproximación debería ser
!             modificados en la misma rutina.
!*********************************************************
PROC zTeach_Positions()

	! IMPORTANTE: DEBE SER POSIBLE PASAR DE LA ÚLTIMA POSICIÓN
	! DE CUALQUIER "mRUTINA" A LA POSICIÓN INICIAL SIN COLISIONES!!!

	! >>> mROB_Home: posición inicial (home position)
	MoveJ ROB_pHome, vmax, z5, USR_toolPinza\wobj:=wobjMDF;
	
	! >>> mMDF_Espera: posición de espera en frente de la puerta de la máquina
	MoveL MDF_pEspera,vmax,z5,USR_toolPinza\wobj:=wobjMDF;
	
	! >>> mMDF_Recogida: entrada en máquina y recogida de la pieza
	! en linea con el centro del molde, sobre la columna baja
	MoveJ MDF_p01, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	! centro del molde, en linea con la massalote
	MoveJ MDF_p02, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	! en linea con la massalote, levemente antes
	MoveL MDF_p03, v3000, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de RECOGIDA <<<===
	MoveL MDF_pRecog, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! en linea con la massalote, levemente más allá de la carrera
	! máxima de la eyección
	MoveL MDF_p04, v1000, fine, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mMDF_Salida: salida de la máquina hasta fuera área
	! centro del molde, en linea con la massalote
	MoveL\Conc, MDF_p10, v3000, z30, USR_toolPinza\WObj:=wobjMDF;
	! en linea con el centro del molde, acerca de la columna
	MoveL\Conc, MDF_p11, vmax, z50, USR_toolPinza\wobj:=wobjMDF;
	! posición hasta la salida de la máquina
	MoveJ MDF_p12, vmax, z50, USR_toolPinza\wobj:=wobjMDF;
	! posiciones acercando sensor start pulverizador (si presente...)
	MoveJ MDF_p20, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p21, v2000, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de CONTROL START PULVER. <<<=== (si presente...)
	MoveL MDF_pControl, v1000, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan del sensor (si presente...)
	MoveJ MDF_p30, v2000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p31, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	! posición hasta salida de la máquin
	MoveJ MDF_p13, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN FUERA de la PUERTA de la MÁQUINA!!! <<<===
	MoveJ MDF_p14, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mSNS_ControlPz: sensores
	! posiciones acercando
	MoveJ SNS_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ SNS_p02, v2000, z50, USR_toolPinza\WObj:=wobjMDF;
    ! ===>>> 1a POSICIÓN de CONTROL <<<===
	MoveL SNS_pControl1, v500, fine, USR_toolPinza\WObj:=wobjMDF;
    ! ===>>> 2a POSICIÓN de CONTROL <<<===
	MoveL SNS_pControl2, v500, fine, USR_toolPinza\WObj:=wobjMDF;
    ! ===>>> 3a POSICIÓN de CONTROL <<<===
	MoveL SNS_pControl3, v500, fine, USR_toolPinza\WObj:=wobjMDF;
    ! ===>>> 4a POSICIÓN de CONTROL <<<===
	MoveL SNS_pControl4, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveJ SNS_p10, v2000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ SNS_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mENF_Cuba: enfriamiento en la cuba de agua
	! posiciones acercando
	MoveJ ENF_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p03, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p04, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de ENFRIAMIENTO <<<===
	MoveL ENF_pCuba,v300,fine,USR_toolPinza\wobj:=wobjMDF;
	! posiciones hasta gotejamento
	MoveL ENF_p10, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p11, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p12, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===> POSICIÓN de GOTEJAMENTO <===
	MoveL ENF_p20, v100, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveJ ENF_p21, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p22, v2000, z1, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p23, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mDEP_UtilIntColoc: colocación pieza en util intermedio
	! posiciones acercando
	MoveJ UTL_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL UTL_p04, v1500, z50, USR_toolPinza\WObj:=wobjMDF;	
	! ===>>> POSICIÓN DE COLOCACIÓN <<<===
	MoveL UTL_pColoc, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL UTL_p10, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p11, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p12, v1500, z50, USR_toolPinza\WObj:=wobjMDF;

	! >>> mDEP_UtilIntRecoc: recogida pieza de util intermedio
	! posiciones acercando
	MoveJ UTL_p51, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p52, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p53, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL UTL_p54, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN DE RECOGIDA <<<===
	MoveL UTL_pRecog, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL UTL_p60, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p61, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p62, v1500, z50, USR_toolPinza\WObj:=wobjMDF;	
	
	! >>> mDEP_PrnColoc: colocación pieza en la prensa
	! posición acercando
	MoveJ PRN_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	! === POSICIÓN FUERA de la PRENSA!!! ===
	MoveJDO PRN_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 0;
	! posiciones acercando
	MoveJ PRN_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p04, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p05, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p06, v500, z1, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL PRN_pColoc, v100, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL PRN_p10, v500, z1, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p11, v500, z10, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p12, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	! === POSICIÓN FUERA de la PRENSA!!! ===
	MoveJ PRN_p13, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    ! posiciones que se alejan
	MoveJ PRN_p14, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mDEP_PrnRecog: recogida pieza en la prensa
	! posición acercando
	MoveJ PRN_p50, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	! === POSICIÓN FUERA de la PRENSA!!! ===
	MoveJDO PRN_p51, vmax, z50, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 0;
	! posiciones acercando
	MoveJ PRN_p52, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p53, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p54, v500, z10, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de RECOGIDA <<<===
	MoveL PRN_pRecog, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL PRN_p60, v300, z1, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p61, v1000, z10, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p62, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	! === POSICIÓN FUERA de la PRENSA!!! ===
	MoveJ PRN_p63, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    ! posiciones que se alejan
	MoveJ PRN_p64, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mDEP_PzPrensadaColoc: colocación pieza prensada
	! posiciones acercando
	MoveJ PRD_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p04, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL PRD_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL PRD_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p11, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p12, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p13, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mDEP_PzBuenaColoc: deposito pezzi buoni/qualità
	! posiciones acercando
	MoveJ BUE_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p04, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL BUE_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL BUE_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p11, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p12, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p13, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
    MoveJ BUE_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mDEP_PzRechazoColoc: deposito pezzi scarto
	! posiciones acercando
	MoveJ RCZ_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL RCZ_p04, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL RCZ_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL RCZ_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL RCZ_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL RCZ_p11, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p12, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p13, vmax, Z100, USR_toolPinza\WObj:=wobjMDF;    
	MoveJ RCZ_p14, vmax, z10, USR_toolPinza\WObj:=wobjMDF;
	
ENDPROC

ENDMODULE