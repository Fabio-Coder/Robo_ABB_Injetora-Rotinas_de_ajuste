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
CONST jointtarget jposTransporte := [[0.00449267,-45.002,64.9985,0.000647968,-115.001,4.99587],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! HOME POSICIÓN (POSICIÓN INICIAL)
CONST robtarget ROB_pHome:=[[-309.29,-759.88,1174.59],[0.243259,-0.67509,-0.655854,-0.23438],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! MÁQUINA DE FUNDICIÓN (MDF): ESPERA
CONST robtarget MDF_pEspera:=[[335.19,-295.19,1536.55],[0.13056,9.64202E-05,0.99144,-0.00060735],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! MÁQUINA DE FUNDICIÓN (MDF): ENTRADA
CONST robtarget MDF_p01 := [[2331.93,-312.71,1423.89],[0.587042,0.0112316,0.80946,0.00556173],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p02:=[[2693.00,-312.81,1198.91],[0.972146,0.000529708,0.23425,0.00766053],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p03:=[[2696.28,-332.28,1104.34],[0.972727,-0.00288113,0.231718,-0.0100646],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pRecog:=[[2693.04,-512.70,1106.15],[0.972724,-0.0028869,0.231732,-0.0100443],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget MDF_pTemp:=[[2695.2,-346.143,1104.49],[0.972703,-0.00238607,0.231771,-0.011216],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p04:=[[2704.49,-462.11,1196.67],[0.994091,-0.00720042,0.107896,-0.00945961],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! MÁQUINA DE FUNDICIÓN (MDF): SALIDA
CONST robtarget MDF_p10 := [[2695.80,-284.49,1199.04],[0.998235,-0.00496014,0.055961,-0.0192587],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p11:=[[2646.32,-221.46,1377.99],[0.877049,-0.00411691,0.48031,0.00835075],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p12:=[[519.69,-203.82,1877.79],[0.984154,-0.0602298,0.166544,0.00876886],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p20 := [[1642.01,-439.61,1289.54],[0.823576,-5.9409E-05,0.567206,-1.43407E-05],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p21:=[[992.58,-330.88,1566.27],[0.702618,-0.0208979,0.710504,-0.0327757],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pControl:=[[504.43,-466.02,1951.52],[0.993566,0.034047,0.106946,-0.0151814],[1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p30:=[[147.92,-480.78,2044.96],[0.947655,0.0201173,0.0678839,-0.311347],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p31:=[[93.40,-478.70,2065.30],[0.934668,0.0189996,0.0567102,-0.350455],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p13:=[[-184.23,-608.19,2040.21],[0.933552,0.0531088,0.0280815,-0.353372],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p14:=[[12.02,-682.53,2028.46],[0.998079,0.0593523,0.0134589,-0.0115613],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! SENSORES
CONST robtarget SNS_p01 := [[-242.68,-1361.16,1366.99],[0.715867,0.433517,-0.546686,-0.0270408],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_p02 := [[-282.78,-1773.49,1626.02],[0.601054,0.358202,-0.377914,0.606306],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl1 := [[-151.52,-1823.86,1741.50],[0.60105,0.35821,-0.377913,0.606305],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl2 := [[-236.59,-1901.29,1658.69],[0.555085,0.419469,-0.460857,0.550942],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl3 := [[-236.59,-1901.29,1658.69],[0.555086,0.419469,-0.460856,0.550942],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_pControl4 := [[-236.59,-1901.29,1658.69],[0.555085,0.419469,-0.460857,0.550942],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_p10 := [[-773.00,-2219.73,1453.40],[0.78655,0.60093,-0.127065,-0.0638529],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget SNS_p11 := [[-1007.50,-2175.88,1006.33],[0.637815,0.768674,0.0321025,0.0360888],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!=====================================================================================
! CUBA DE AGUA
CONST robtarget ENF_p01 := [[-828.00,-2256.97,834.70],[0.675706,0.705156,0.145581,0.15806],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p02 := [[-440.63,-1897.38,1282.18],[0.718138,0.0885909,0.689911,-0.0212891],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p03 := [[-573.40,-2628.84,1240.28],[0.718462,0.0885711,0.689567,-0.0215669],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p04 := [[-785.25,-1953.16,845.96],[0.631902,0.761096,0.0876551,0.11726],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_pCuba := [[-826.13,-2253.16,347.65],[0.678702,0.701189,0.148472,0.160168],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p10 := [[-778.88,-2131.13,1173.74],[0.71674,0.696411,0.000326903,-0.0360001],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p11 := [[-780.71,-2290.62,948.87],[0.631901,0.761095,0.0876729,0.117254],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p12 := [[29.47,-1884.57,501.58],[0.106643,-0.639134,-0.750945,0.127342],[0,-3,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p20 := [[-633.19,-2343.32,1104.45],[0.431426,0.658438,-0.391718,0.476328],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p21 := [[-1085.76,-2068.67,1587.93],[0.646248,0.686559,0.136448,-0.303944],[0,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p22 := [[-972.77,-2097.81,1535.68],[0.696167,0.699868,-0.0129623,-0.159272],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p23 := [[-440.54,-1897.37,1282.17],[0.718139,0.0885822,0.689911,-0.0212782],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZA EN UTIL INTERMEDIO
CONST robtarget UTL_p01 := [[-1070.06,-1835.10,1470.49],[0.466574,0.842745,-0.106745,-0.246362],[0,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p02 := [[-1293.78,-1608.42,1558.93],[0.831149,0.370293,-0.213137,-0.355874],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p03 := [[-1482.11,-1589.62,1388.74],[0.54708,0.552185,-0.433217,-0.456201],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p04 := [[-1505.03,-1545.60,877.79],[0.493718,0.499244,-0.496928,-0.509962],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_pColoc := [[-1519.30,-1577.62,752.85],[0.608722,0.605085,-0.349086,-0.376123],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p10 := [[-1504.86,-1545.34,953.20],[0.493701,0.499248,-0.496933,-0.509969],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p11 := [[-1742.50,-882.65,1329.94],[0.547038,0.552222,-0.433233,-0.45619],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p12 := [[-1479.96,-1594.74,1007.69],[0.547037,0.552216,-0.433221,-0.45621],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! RECOGIDA PIEZA DE UTIL INTERMEDIO
CONST robtarget UTL_p51 := [[-837.41,-1272.63,1959.31],[0.955925,0.0359635,-0.0135944,-0.291083],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p52 := [[-1296.42,-1371.93,1145.58],[0.695048,0.651142,0.261802,0.156151],[-1,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p53 := [[-1296.41,-1372.01,1145.58],[0.695055,0.651133,0.261809,0.156144],[-1,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p54 := [[-1505.01,-1545.57,877.73],[0.493703,0.499257,-0.496926,-0.509965],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_pRecog := [[-1515.79,-1574.65,751.02],[0.503127,0.514709,-0.488326,-0.493434],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p60 := [[-1504.87,-1545.36,953.30],[0.493713,0.499235,-0.496941,-0.509963],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p61 := [[-1434.58,-1608.11,1694.89],[0.663,0.645996,-0.264879,-0.270111],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p62 := [[-1196.41,-1319.01,1646.77],[0.655082,0.649295,-0.283991,-0.261979],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! PRENSA: COLOCACIÓN
CONST robtarget PRN_p01 := [[-976.82,-61.30,1510.95],[0.233238,0.684218,-0.682235,-0.109551],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p02 := [[-976.84,-61.28,1510.97],[0.233234,0.684208,-0.682248,-0.109542],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p03 := [[-1453.00,-37.75,1743.34],[0.498689,0.512749,-0.4968,-0.491515],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p04 := [[-2008.40,-78.87,1584.76],[0.505059,0.503661,-0.494129,-0.497069],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p05 := [[-2025.32,-80.39,1437.60],[0.519828,0.551911,-0.473982,-0.447788],[-1,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p06 := [[-2012.84,-78.16,1221.12],[0.519832,0.551906,-0.47397,-0.447802],[-1,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_pColoc := [[-2014.99,-72.19,1069.79],[0.504012,0.50427,-0.495957,-0.495692],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p10 := [[-2025.32,-80.42,1437.60],[0.519832,0.551912,-0.473979,-0.447785],[-1,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p11 := [[-1804.46,-79.94,1313.09],[0.501985,0.498001,-0.498114,-0.501885],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p12 := [[-1586.23,-73.82,1311.37],[0.501982,0.498008,-0.49812,-0.501876],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p13 := [[-695.62,-55.45,1352.81],[0.0390151,0.751501,-0.655563,0.0629308],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p14 := [[-695.62,-55.41,1352.84],[0.0390281,0.751508,-0.655556,0.0629139],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! PRENSA: RECOGIDA
CONST robtarget PRN_p50 := [[-1486.38,-85.78,1945.73],[0.0614075,-0.701391,-0.688555,0.173702],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p51 := [[-1089.99,-98.97,1732.92],[0.222555,0.667241,0.697434,0.137275],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p52 := [[-1959.35,-6.29,1703.73],[0.497499,-0.502459,-0.49938,0.500649],[-1,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p53 := [[-2182.85,-6.28,1702.88],[0.497495,-0.502467,-0.499382,0.500642],[-1,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p54 := [[-2317.52,-87.25,1480.78],[0.497056,-0.502836,-0.499704,0.500388],[-1,0,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_pRecog := [[-2313.90,-97.87,1092.04],[0.497122,-0.502311,-0.499971,0.500582],[-1,0,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p60 := [[-2317.51,-87.34,1480.84],[0.497055,-0.502826,-0.499706,0.500396],[-1,0,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget PRN_pTemp:=[[-2313.83,-99.0628,1092.06],[0.496991,-0.502138,-0.500115,0.500742],[-1,0,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p61 := [[-1678.54,-87.22,1484.07],[0.497052,-0.502829,-0.499705,0.500397],[-1,0,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p62 := [[-1311.96,-87.14,1489.51],[0.497048,-0.502826,-0.499714,0.500396],[-1,0,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p63 := [[-1092.13,-9.30,947.61],[0.0815013,0.703548,0.700857,0.0847224],[-1,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p64 := [[-598.98,-913.23,947.59],[0.0319419,0.290082,0.949753,0.113141],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZAS PRENSADAS
CONST robtarget PRD_p01 := [[-598.98,-913.22,947.58],[0.0319427,0.29008,0.949753,0.113145],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p02 := [[-50.71,-1363.97,1094.29],[0.00191503,-0.0234862,-0.999542,0.0190067],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p03 := [[-97.33,-1261.18,2063.27],[0.0101845,-0.000294986,0.610971,-0.791587],[0,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p04 := [[-61.02,-2259.34,914.46],[0.067383,0.0829246,0.716984,-0.688852],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p05 := [[-61.03,-2259.38,914.47],[0.0673782,0.0829193,0.71698,-0.688858],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_pColoc := [[-72.48,-2336.96,838.91],[0.104995,0.126176,0.704584,-0.690374],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p10 := [[-213.64,-1943.52,942.50],[0.0818557,0.101502,0.709452,-0.692586],[0,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p11 := [[-213.73,-1943.49,942.50],[0.0818495,0.101514,0.709452,-0.692585],[0,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p12 := [[-406.21,-995.82,708.10],[0.0709997,-0.762183,-0.64124,-0.0533618],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p13 := [[-300.08,-925.37,1318.03],[0.134893,-0.694147,-0.694092,-0.134907],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_p14 := [[-300.08,-925.36,1318.02],[0.134901,-0.694143,-0.694093,-0.134912],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZAS BUENAS NO PRENSADAS
CONST robtarget BUE_p01 := [[-759.39,780.44,1244.81],[0.0183214,0.397609,-0.916269,-0.0449719],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p02 := [[-801.96,852.75,2103.63],[0.0430726,0.395196,-0.91111,-0.108823],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p03 := [[-1988.80,1241.70,2449.23],[0.259679,0.259077,-0.593792,-0.71614],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p04 := [[-1988.79,1241.69,2053.26],[0.259676,0.259086,-0.593799,-0.716132],[-1,-2,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p05 := [[-1988.76,1241.70,1805.81],[0.25967,0.259085,-0.593805,-0.71613],[-1,-2,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_pColoc := [[-1988.76,1241.69,1584.18],[0.259664,0.259098,-0.593815,-0.716119],[-1,-2,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p10 := [[-1985.91,1262.35,1916.04],[0.259663,0.259105,-0.593814,-0.716118],[-1,-2,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p11 := [[-1975.82,1272.45,2305.18],[0.259659,0.259098,-0.593821,-0.716116],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p12 := [[-1614.06,595.84,2544.20],[0.658456,-0.346023,-0.57656,-0.338057],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p13 := [[-126.73,-861.59,959.59],[0.204587,0.977405,-0.052988,-0.00400906],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget BUE_p14 := [[-979.16,747.62,1055.74],[0.131339,-0.551677,0.822506,0.043428],[-1,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
!===================================================================================
! COLOCACIÓN PIEZAS RECHAZADAS: START-UP/RECHAZADA DE MÁQUINA/INCOMPLETA
CONST robtarget RCZ_p01 := [[-659.90,-1525.85,1389.57],[0.386144,0.482582,0.65385,-0.436449],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p02 := [[-658.41,-2217.86,1145.62],[0.567372,0.77177,0.254549,-0.132907],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p03 := [[-726.98,-3076.91,1411.38],[0.411636,0.447204,0.625299,-0.489454],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p04 := [[-739.76,-3153.50,1435.03],[0.433312,0.412173,0.595657,-0.536234],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p05 := [[-644.51,-3024.99,855.66],[0.623312,0.77459,0.0751147,0.0764888],[0,-2,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_pColoc := [[-572.13,-3112.62,767.06],[0.642178,0.765469,-0.0243048,-0.0327572],[0,-2,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p10 := [[-680.87,-3077.00,848.31],[0.657259,0.753612,0.00850808,0.00275107],[0,-2,2,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p11 := [[-727.17,-3076.82,1411.41],[0.411594,0.447208,0.625315,-0.489465],[0,-2,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p12 := [[-784.28,-2379.37,1387.75],[0.386131,0.482598,0.65385,-0.436443],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p13 := [[-678.33,-1918.50,949.54],[0.292276,0.945872,0.0750043,-0.119479],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p14 := [[-309.26,-759.84,1174.56],[0.243257,-0.675073,-0.655869,-0.23439],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
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
PERS bool bHbltcSnsAntPulver:=FALSE;
PERS bool bHbltcSns01:=FALSE;
PERS bool bHbltcSns02:=TRUE;
PERS bool bHbltcSns03:=TRUE;
PERS bool bHbltcSns04:=TRUE;
PERS bool bHbltcSns05:=FALSE;
PERS bool bHbltcSns06:=FALSE;
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
PERS bool bHbltcSnsUtilInt:=TRUE;
PERS bool bHbltcPrensaColoc:=TRUE;
PERS bool bHbltcPrensaRecog:=TRUE;
PERS bool bHbltcPrnRecogSoft:=TRUE;
PERS bool bHbltcStopPrensaNoAuto:=FALSE;
PERS bool bHbltcStopUtilSns:=FALSE;
PERS bool bHbltcCicloSpec:=TRUE;
PERS bool bHbltcCtrlMoldeAbierto:=TRUE;
!===================================================================================
PERS num nHbltcMensajes:=2;
PERS num nTipoPzEnPinza:=0;
PERS num nPass:=1234;
PERS num nTiempoEnfriam:=5;
PERS num nTiempoGoteo:=3;
PERS num nTiempoMaxDIPrnColoc:=4;
PERS num nTiempoMaxDIPrnRecog:=3;
PERS num nTiempPulsoCinta:=45;
PERS num nTiempoMaxDIAire:=2;
PERS num nTiempoMaxDIEyecAdel:=10;
PERS num nTiempoMaxDIPrnFinCiclo:=60;
PERS num nTiempoPinzaCerrar:=0.7;
PERS num nTiempoPinzaAbrir:=0.7;
PERS num nTiempoMensAnom:=5;
PERS num nVelMax:=2000;
PERS num nOverVel:=100;
PERS num ROB_ntimerMDF:=82.271;
PERS num ROB_nTimerEXT:=13.62;
PERS num ROB_nTimerROB:=54.47;
PERS num ROB_nPzTotal:=31624;
PERS num ROB_nPzBuona:=28949;
PERS num ROB_nPzRechazo:=2675;
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
	CONST robtarget MDF_pRecog10:=[[2695.82,-242.69,1199.03],[0.998237,-0.00496931,0.0559359,-0.0192193],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ppreviocolocac:=[[-1505.07,-1545.58,765.14],[0.493726,0.499237,-0.496918,-0.50997],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_pColoc10:=[[-1495.71,-1583.56,764.56],[0.543625,0.560869,-0.427638,-0.454999],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p21:=[[-1495.69,-1583.50,749.63],[0.543604,0.5609,-0.427622,-0.455],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p64:=[[-1495.05,-1579.67,743.64],[0.505618,0.501122,-0.490396,-0.502732],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p74:=[[-97.35,-1261.17,2063.25],[0.0101798,-0.000288689,0.610976,-0.791583],[0,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRD_pColoc10:=[[1.79,-2225.35,819.17],[0.0771116,0.096386,0.710322,-0.692969],[0,0,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ROB_pHome10:=[[-304.10,-777.14,1431.10],[0.0369415,-0.661671,-0.748009,-0.0361818],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ROB_pHome20:=[[-310.41,-957.32,1307.40],[0.050306,-0.713482,-0.697746,-0.0395439],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_p24:=[[-309.29,-759.88,1174.58],[0.243257,-0.67509,-0.655855,-0.234381],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pEspera10:=[[-304.33,-326.91,1536.55],[0.0906149,0.71073,0.691242,-0.0940054],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pEsperaprevio:=[[-304.33,-326.91,1536.55],[0.0906156,0.71073,0.691241,-0.0940062],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget RCZ_pColoc10:=[[-659.43,-3115.29,625.79],[0.639716,0.76213,-0.0675573,-0.0731942],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p72:=[[-976.84,-61.36,1510.92],[0.233233,0.684246,-0.68221,-0.109546],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget PRN_p15:=[[-2009.27,-76.41,1270.86],[0.504209,0.502563,-0.493847,-0.499318],[-1,2,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget UTL_p82:=[[-667.88,-855.82,1202.64],[0.313713,0.89558,-0.312553,-0.0428065],[0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_pCuba10:=[[-765.27,-2180.15,366.46],[0.70004,0.712249,0.0237051,0.0456512],[0,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p23:=[[-309.29,-759.88,1174.58],[0.243259,-0.675086,-0.655856,-0.234385],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p41:=[[2057.65,-246.89,1441.09],[0.616132,-0.00865147,0.787526,0.0104616],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p40:=[[1703.39,-266.06,1196.02],[0.687338,-0.0878863,0.72094,-0.00939899],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p51:=[[2695.80,-284.56,1199.03],[0.998236,-0.0049758,0.0559417,-0.0192583],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p50:=[[2695.80,-284.56,1199.03],[0.998236,-0.00497575,0.0559413,-0.0192576],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p60:=[[2695.80,-284.56,1199.03],[0.998236,-0.00497576,0.0559417,-0.0192575],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p61:=[[2695.80,-284.56,1199.03],[0.998236,-0.00497571,0.0559408,-0.0192572],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p22:=[[1102.79,-218.74,1895.07],[0.935496,-0.0143034,0.351181,0.036262],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ROB_pHome30:=[[519.14,-306.19,1863.93],[0.990215,-0.0193778,0.138139,-0.00408639],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p70:=[[93.40,-478.70,2065.31],[0.934668,0.0189998,0.0567069,-0.350456],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p71:=[[-94.08,-478.58,2065.27],[0.849875,0.0295531,0.0520109,-0.523578],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p80:=[[1370.80,-212.89,1499.22],[0.814032,-0.0190361,0.57994,0.0256936],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p81:=[[2669.89,-201.67,1416.48],[0.87372,-0.0899374,0.477872,0.0127762],[1,-1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget ENF_p30:=[[-849.70,-2477.95,1114.69],[0.550471,0.423196,0.638536,-0.331902],[0,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p91:=[[2744.27,-230.24,1148.46],[0.687343,-0.0879079,0.720933,-0.00940412],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_p33:=[[319.27,-312.34,1536.54],[0.13049,0.0260758,0.991098,-0.00401919],[1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget MDF_pControl10:=[[448.88,-592.67,2016.31],[0.996524,0.0429781,0.0652434,-0.0289314],[1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget HomeBuenaColoc := [[-1034.08,-542.12,2185.07],[0.335659,0.823838,-0.447559,-0.0911931],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget pQuebraRebarba_00 := [[-1495.30,-146.35,1277.98],[0.171705,0.705651,-0.684112,-0.0675663],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget pQuebraRebarba_01 := [[-1495.27,-146.31,1277.98],[0.171708,0.705638,-0.684124,-0.0675708],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget pQuebraRebarba_02 := [[-1495.27,-146.31,1277.98],[0.171708,0.705637,-0.684125,-0.0675709],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
PERS robtarget pQuebraRebarba_03 := [[-1034.08,-542.12,2185.07],[0.335659,0.823838,-0.447559,-0.0911931],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

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
        !Ponto Intermediario
        MoveJ HomeBuenaColoc,v4000,z100,USR_toolPinza\WObj:=wobjMDF;
        mDEP_PzBuenaColoc;
        GOTO EndProcess;
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
EndProcess:	
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
        !Ponto Intermediario
        MoveJ HomeBuenaColoc,v4000,z100,USR_toolPinza\WObj:=wobjMDF;
        mDEP_PzBuenaColoc;
        GOTO EndProcess;
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
EndProcess:	
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
	
	SpeedRefresh 100;
	
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
			MoveL RelTool(ROB_pStartHoming,0,40,0),v100,z1,USR_toolRestore\wobj:=wobjMDF;
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
	!MoveL ROB_pHome, vmax, z5, USR_toolPinza\wobj:=wobjMDF;
	MoveJ ROB_pHome, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ [[-310.41,-957.32,1307.40],[0.0503054,-0.713482,-0.697746,-0.0395422],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z5, USR_toolPinza\WObj:=wobjMDF;
	
ENDPROC
  
!*********************************************************
! Routine:  mMDF_Espera()
!*********************************************************
PROC mMDF_Espera()

	USR_Print(s_RobotDavantiPfo{nIdioma});
	MoveJ MDF_pEsperaprevio, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_pEspera, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
	
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
	
	MoveJ MDF_p01, v4000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p03, v4000, z50, USR_toolPinza\WObj:=wobjMDF;
	
	IF bHbltcSoftservo=FALSE THEN
		Set DO_P007_StartExpulsAdel;
	ENDIF
	
	ConfL\Off;
	SingArea\Wrist;
	
	MoveL MDF_p03, v150, z50, USR_toolPinza\WObj:=wobjMDF;
	
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
		!SoftAct 4, 20;
		SoftAct 5, 8;
		SoftAct 6, 8;
		WaitTime nTiempoPinzaCerrar;	!tiempo espera pasaje hacia ejes soft
		Set DO_P007_StartExpulsAdel;
		USR_MsgWaitDI DI_P004_ExpulsAdel,s_EstrazioneAvanti{nIdioma};
		!MoveL [[2692.31,-365.59,1196.61],[0.998402,0.00144403,0.0559844,0.00758486],[1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v300, fine, USR_toolPinza\WObj:=wobjMDF;
		WaitDI DI_P004_ExpulsAdel,1\MaxTime:=nTiempoMaxDIEyecAdel\TimeFlag:=bEyeccionKo;
		SoftDeact;
		MoveL MDF_p03, v200, fine, USR_toolPinza\WObj:=wobjMDF;
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
        MoveL MDF_p03, v300, fine, USR_toolPinza\WObj:=wobjMDF;
    ENDIF
	SoftDeact;
	
	MoveL MDF_p03, v1000, fine, USR_toolPinza\WObj:=wobjMDF;
	
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
	
	MoveL\Conc, MDF_p03, v4000, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveL\Conc, MDF_p11, v4000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p81, v4000, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p91, v4000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p40, v4000, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveJ [[962.62,-193.45,1287.19],[0.573207,-0.113406,0.811295,-0.0193108],[1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ MDF_p12, vmax, z50, USR_toolPinza\wobj:=wobjMDF;
	
	bErrSnsPulver:=FALSE;
	IF bHbltcSnsAntPulver=TRUE AND bEyeccionKo=FALSE THEN
		MoveJ MDF_p30, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
		
		USR_Print(s_ControlloFtc{nIdioma});
		
		! ===>>> POSICIÓN de CONTROL START PULVER. <<<===
		!MoveL MDF_pControl, v3000, z10, USR_toolPinza\WObj:=wobjMDF;
		MoveJ MDF_pControl, v3000, z20, USR_toolPinza\WObj:=wobjMDF;
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
		
		!MoveJ MDF_p30, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
		MoveJ MDF_p31, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	ENDIF
	
	MoveJ MDF_p30, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN FUERA de la PUERTA de la MÁQUINA!!! <<<===
	MoveJDO MDF_p31, vmax, z50, USR_toolPinza\WObj:=wobjMDF, DO_V05_MdfFueraAreaTrab_User, 1;
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
	ROB_PinzaAbrir;
	MoveL MDF_p02, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	SingArea\Off;
	ConfL\On;
	MoveL MDF_p10, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
    MoveL MDF_p11, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    MoveJ MDF_p40, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    MoveJ MDF_p12, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    MoveJ MDF_p30, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    MoveJ MDF_p31, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
    MoveJ [[-94.08,-478.58,2065.27],[0.849876,0.0295538,0.0520096,-0.523577],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z5, USR_toolPinza\WObj:=wobjMDF;
	!MoveL ROB_pHome, vmax, z5, USR_toolPinza\wobj:=wobjMDF;
	MoveJ ROB_pHome, vmax, z5, USR_toolPinza\WObj:=wobjMDF;
	
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
	MoveJ [[-460.24,-1629.80,1493.53],[0.488697,0.470899,-0.593175,0.433096],[0,1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, USR_toolPinza\WObj:=wobjMDF;
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
	MoveJ SNS_p02, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
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
	
	!MoveJ ENF_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p03, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p04, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de ENFRIAMIENTO <<<===
	!MoveL ENF_pCuba, v800, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_pCuba, v150, fine, USR_toolPinza\WObj:=wobjMDF;
	! ======================================
	USR_Print(s_AttesaRaff{nIdioma});
	WaitTime nTiempoEnfriam;
	
	MoveL ENF_p01, v150, z50, USR_toolPinza\WObj:=wobjMDF;
	 MoveJ ENF_p11, v150, z50, USR_toolPinza\WObj:=wobjMDF;
	! MoveJ ENF_p12, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===> POSICIÓN de GOTEJAMENTO <===
	MoveL ENF_p20, v80, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveL ENF_p30, v80, fine, USR_toolPinza\WObj:=wobjMDF;
	! =================================
	USR_Print(s_AttesaSgocc{nIdioma});
	WaitTime nTiempoGoteo;
	
	MoveJ ENF_p22, v600, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p23, v600, z100, USR_toolPinza\WObj:=wobjMDF;
	
ENDPROC

!*********************************************************
! Routine:  mDEP_UtilIntColoc()
!*********************************************************
PROC mDEP_UtilIntColoc()

	USR_Print(s_UtilDepo{nIdioma});
	
	MoveJ UTL_p01, v2000, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p02, v2000, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p03, v2000, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveL UTL_p04, v2000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL Offs(UTL_pColoc,0,0,400), v600, fine, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN DE COLOCACIÓN <<<===
	MoveL UTL_pColoc, v100, fine, USR_toolPinza\WObj:=wobjMDF;
	! =====================================
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL Offs(UTL_pColoc,0,0,200), v800, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p12, v1500, z100, USR_toolPinza\WObj:=wobjMDF;
	
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
	
	MoveJ UTL_p51, v5000, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p52, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p53, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveL UTL_p54, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL Offs(UTL_pRecog,0,0,200), v800, fine, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN DE RECOGIDA <<<===
	MoveL UTL_pRecog, v800, fine, USR_toolPinza\WObj:=wobjMDF;
	! ==================================
	ROB_PinzaCerrar;
	nTipoPzEnPinza:=1;
	bPzColocada:=FALSE;
	
	MoveL Offs(UTL_pRecog,0,0,200), v1000, fine, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p61, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p62, v1500, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ UTL_p82, v1500, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p72, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
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
    
    MoveJ PRN_p01, v2500, z100, USR_toolPinza\WObj:=wobjMDF;
    !
    ! Quebra de Rebarba...
    MoveJ pQuebraRebarba_00, v1500, z30, USR_toolPinza\WObj:=wobjMDF;
    MoveJ pQuebraRebarba_01, v800, z30, USR_toolPinza\WObj:=wobjMDF;
    MoveJ pQuebraRebarba_02, v1500, z30, USR_toolPinza\WObj:=wobjMDF;
    MoveJ pQuebraRebarba_02, v1500, z30, USR_toolPinza\WObj:=wobjMDF;
    MoveJ pQuebraRebarba_00, v1500, z30, USR_toolPinza\WObj:=wobjMDF;
    !
	MoveJ PRN_p01, v2500, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN FUERA de la PRENSA!!! <<<===
	MoveJDO PRN_p02, v800, z100, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 0;
	! ============================================
	
	MoveJ PRN_p03, v1000, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveL PRN_p04, v1000, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ PRN_p05, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ Offs(PRN_pColoc,0,0,250), v400, fine, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL PRN_pColoc, v200, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	!MoveL PRN_p10, v500, z10, USR_toolPinza\WObj:=wobjMDF;
	MoveL Offs(PRN_pColoc,0,0,200), v600, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p11, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ PRN_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
    
	! ===>>> POSICIÓN FUERA de la PRENSA!!! <<<===
	MoveJDO PRN_p13, v800, z5, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 1;
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
	MoveL PRN_p54, vmax, z10, USR_toolPinza\WObj:=wobjMDF;
	
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
	
	MoveL PRN_p60, v3000, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRN_p61, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
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
	MoveJ [[-188.10,-1261.18,1648.79],[0.0101793,-0.000283573,0.610976,-0.791583],[0,-1,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p04, v7000, z20, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p05, v5000, fine, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL PRD_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	MoveL Offs(PRD_pColoc,0,0,120), v300, fine, USR_toolPinza\WObj:=wobjMDF;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL PRD_p10, v5000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL PRD_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p13, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ PRD_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	Reset DO_P035_PzColocCintaRechazo;
	PulseDO\PLength:=nTiempPulsoCinta, DO_P034_PzColocCintaBuena;
	
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
	MoveL BUE_p05, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL BUE_pColoc, v500, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
    IF bCalidad=TRUE THEN
		bCalidad:=FALSE;
        Reset DO_W02_LuzAmarillo;
    ENDIF
	
	MoveL BUE_p10, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL BUE_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ BUE_p13, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
    !MoveJ BUE_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
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
	!MoveJ RCZ_p03, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveL RCZ_p04, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ RCZ_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	
	! ===>>> POSICIÓN de COLOCACIÓN <<<===
	MoveL RCZ_pColoc, v300, fine, USR_toolPinza\WObj:=wobjMDF;
	! ====================================
	
	ROB_PinzaAbrir;
	nTipoPzEnPinza:=0;
	bPzColocada:=TRUE;
	
	MoveL RCZ_p10, v500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p11, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p12, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	MoveJ RCZ_p13, vmax, Z100, USR_toolPinza\WObj:=wobjMDF;    
	!MoveL RCZ_p14, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
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
	!MoveJ MDF_p20, vmax, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ MDF_p21, v2000, z50, USR_toolPinza\WObj:=wobjMDF;
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
	!MoveJ ENF_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p03, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p04, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN de ENFRIAMIENTO <<<===
	MoveL ENF_pCuba,v300,fine,USR_toolPinza\wobj:=wobjMDF;
	! posiciones hasta gotejamento
	MoveJ ENF_p10, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p11, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p12, v100, z50, USR_toolPinza\WObj:=wobjMDF;
	! ===> POSICIÓN de GOTEJAMENTO <===
	MoveL ENF_p20, v100, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveJ ENF_p21, v1000, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveJ ENF_p22, v2000, z1, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ ENF_p23, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	
	! >>> mDEP_UtilIntColoc: colocación pieza en util intermedio
	! posiciones acercando
	MoveJ UTL_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL UTL_p04, v200, fine, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN DE COLOCACIÓN <<<===
	MoveL Offs(UTL_pColoc,0,0,200), v200, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveL UTL_pColoc, v200, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL Offs(UTL_pColoc,0,0,200), v200, fine, USR_toolPinza\WObj:=wobjMDF;
	!MoveL UTL_p10, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p11, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p12, v1500, z50, USR_toolPinza\WObj:=wobjMDF;

	! >>> mDEP_UtilIntRecoc: recogida pieza de util intermedio
	! posiciones acercando
	!MoveJ UTL_p51, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p52, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p53, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveL UTL_p54, v400, fine, USR_toolPinza\WObj:=wobjMDF;
	MoveL Offs(UTL_pRecog,0,0,200), v200, fine, USR_toolPinza\WObj:=wobjMDF;
	! ===>>> POSICIÓN DE RECOGIDA <<<===
	MoveL UTL_pRecog, v200, fine, USR_toolPinza\WObj:=wobjMDF;
	! posiciones que se alejan
	MoveL UTL_p60, v800, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p61, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveJ UTL_p62, v1500, z50, USR_toolPinza\WObj:=wobjMDF;	
	
	! >>> mDEP_PrnColoc: colocación pieza en la prensa
	! posición acercando
	MoveJ PRN_p01, vmax, z100, USR_toolPinza\WObj:=wobjMDF;
	! === POSICIÓN FUERA de la PRENSA!!! ===
	!MoveJDO PRN_p02, vmax, z100, USR_toolPinza\WObj:=wobjMDF, DO_V06_PrensaFueraAreaTrab_User, 0;
	! posiciones acercando
	MoveJ PRN_p03, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveL PRN_p04, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	!MoveL PRN_p05, v1500, z50, USR_toolPinza\WObj:=wobjMDF;
	MoveL Offs(PRN_pColoc,0,0,200), v500, fine, USR_toolPinza\WObj:=wobjMDF;
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
	MoveJ RCZ_p05, v500, z50, USR_toolPinza\WObj:=wobjMDF;
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