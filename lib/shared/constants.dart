import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
getBookingId(){
  final Random bookid = Random.secure();
  final List<int> values = List<int>.generate(10, (i) => bookid.nextInt(256));
  var bid = base64.encode(values).substring(0,5);
  return bid;
}



String bidn;
String selectedString= "";

DateTime selectedDate = DateTime.now();
final formatter = DateFormat('yyyy-MM-dd');

int distanceBetween = 0;
String selectedTimingFrom = "";
String selectedTimingTo = "";
String selectedBookingFrom = "";
String selectedBookingTo = "";
String selectedMapsFrom = "";
String selectedMapsTo = "";
String alphaNumberc = "ABCDEFGHJCLMNOPQRSTUVWXYZ1234567890abcdefghijklmnopqrstuvwxyz";

//Click Status
bool clickStatLogin = false;
bool clickStatRegister = false;
bool clickStatBooking = false;

String username;
String useremail;
String userphno;

var fare;
var km = 35;

var minFare = {
  'Ordinary' : 8.00,
  'Limited Stop Ordinary' : 8.00,
  'Town to Town Ordinary' : 8.00,
  'Fast Passenger' : 11.00,
  'LS Fast Passenger' : 11.00,
  'Point to Point Fast Passenger' : 11.00,
  'Super Fast' : 15.00,
  'Super Express' : 22.00,
  'Super Dulex' : 30.00,
  'Garuda King Class Volvo' : 44.00,
  'Low Floor Non-AC' : 10.00,
  'Ananthapuri Fast' : 11.00,
  'Garuda Maharaja Scania' : 80.00,
};
var perKmFare = {
  'Ordinary' : 0.70,
  'Limited Stop Ordinary' : 0.75,
  'Town to Town Ordinary' : 0.70,
  'Fast Passenger' : 0.75,
  'LS Fast Passenger' : 0.75,
  'Point to Point Fast Passenger' : 0.75,
  'Super Fast' : 0.78,
  'Super Express' : 0.85,
  'Super Dulex' : 1.00,
  'Garuda King Class Volvo' : 1.45,
  'Low Floor Non-AC' : 0.80,
  'Ananthapuri Fast' : 0.78,
  'Garuda Maharaja Scania' : 1.45,
};
getFare(String busT){
    if(km <= 5 ){
      return (minFare[busT]).ceil(); 
    }
    else{
      return (minFare[busT] + perKmFare[busT]*(km - 5)).ceil();
    }
  }
//QRCODE DATA
var qrdata = {
  'From' : selectedBookingFrom,
  'To' : selectedBookingTo,
  'BookingID' : bidn,
  'Name' : username,
  'Email' : useremail,
  'PhoneNumber' : userphno,
  'Fare' : fare,
};


textInputDecoration(String hintText){
  return InputDecoration(
    hintText: '$hintText',
    hintStyle: new TextStyle(color: Colors.grey),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: new BorderRadius.circular(20),
    ),
  );
}

textInputDecorationNoHint(){
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: new BorderRadius.circular(20),
    ),
  );
}


final recentSearch = [];
const 
List<String> stops = [
'16 th MILE (NEDUMANGAD)',
'50 ACRE',
'504 COLONY',
'6 th MILE (MANKULAM)',
'70 Acre',
'AALUMCHUVADU',
'AANAKKAYAM',
'AANAPPARA',
'AANAPPARA (ANGAMALY)',
'AAROOR (MVPA)',
'AAZHIMALA',
'ABHAYAGIRI',
'ACHANKOVIL',
'ADICHANALLUR',
'ADICHERY',
'ADICHILY',
'ADICHIPUZHA',
'ADIMALATHURA',
'ADIMALY',
'ADIPIRANDA',
'ADIVAARAM',
'ADIVAD',
'ADIVARAM (Erattupetta)',
'ADOOR BS (ADR)',
'ADUKKAM',
'ADUVAPURAM',
'AGALY',
'AGRICULTURAL UNIVERSITY',
'AGRIFARM',
'AHALIYA HOSPITAL (PALAKKAD)',
'AIMS (AMRITHA MEDICAL COLLEGE)',
'ALAKKAD',
'ALAKKODE',
'ALAMCODE',
'ALAMPARA',
'ALANALLUR',
'ALAPPUZHA BS (ALP)',
'ALAPPUZHA RAILWAY STATION',
'ALATHUR',
'ALIPARAMBA',
'ALIYADU',
'ALIYATTUKUNNU',
'ALL SAINTS COLLEGE TVM',
'ALLATTUCHIRA',
'ALOOR',
'ALTHARA',
'ALUMKADAVU',
'ALUMKUZHI',
'ALUVA (ALV)',
'AMALA HOSPITAL',
'AMARA',
'AMAYIDA',
'AMBALAKANDY',
'AMBALAMKUNNU',
'AMBALAMUKKU',
'AMBALANIRAPPU',
'AMBALAPPADU',
'AMBALAPPUZHA BS',
'AMBALASSERY KADAVU',
'AMBALATHARA',
'AMBALAVAYAL',
'AMBALLUR',
'AMBANAD',
'AMBAYATHODE',
'AMBEDKAR (MANANTHAVADY)',
'AMBEDKAR COLONY (KARETTU)',
'AMBIKONAM',
'AMBOORI',
'AMMADOM',
'AMPALAPPARA',
'AMRITA MEDICAL COLLEGE EDAPALLY',
'AMRITA SETHU',
'ANACHADY',
'ANACHAL',
'ANACODE',
'ANAKALLU',
'ANAKKAMPOYIL',
'ANAKKATTY',
'ANAKKULAM (ANCHAL)',
'ANAKOTTOOR',
'ANAKULAM',
'ANAKULAM (MUNNAR)',
'ANAKUZHI (ALAKODE)',
'ANAKUZHY',
'ANANDESWARAM',
'ANAPPARA (VITHURA)',
'ANAVILASAM',
'ANAVOOR',
'ANAYADI',
'ANAYARA',
'ANCHAL',
'ANCHALPETTY',
'ANCHALUMMOODU',
'ANDHAKARANAZHY',
'ANDIPATTI',
'ANDOORKONAM',
'ANGADIPPURAM',
'ANGAMALY',
'ANGAMOOZHY',
'ANGEL VALLEY',
'ANJARAKANDY',
'ANKAMALY (ANK)',
'ANNAMMANADA',
'ANNIYAR THOZHU',
'ANTHYANPARA',
'ARAKKAL TEMPLE',
'ARAKKUNAM',
'ARALAM FARM',
'ARANGOTTUKARA',
'ARANMULA',
'ARATTUKADAVU',
'ARATTUPUZHA',
'ARAVANCHAL',
'ARAYANKAVU',
'AREEKODE',
'ARIMBRA',
'ARINALLOOR',
'ARIVILANJAPOIL',
'ARKKANOOR',
'AROOKUTTY',
'AROOR',
'ARTHISSERY',
'ARTHUNKAL',
'ARUMANOOR',
'ARUMANUR',
'ARUVIKKARA',
'ARUVIKKARAKONAM',
'ARUVIPPURAM',
'ARUVIPURAM',
'ARUVIYODE',
'ARYANAD (ARD)',
'ARYANCODE',
'ARYANKAVU (ARK)',
'ASHTAMICHIRA',
'ASHTAMUDI',
'ASMABI',
'ASRAMAM (KOLLAM)',
'ASRAMAM (MOOLAMATTOM)',
'ASRAMAM ESI',
'ATHANI',
'ATHIKKATTUKULANGARA',
'ATHIKKAYAM',
'ATHIPOTTA',
'ATHIRAPPALLY',
'ATHOLI',
'ATTAKKUNDU',
'ATTAMALA',
'ATTAPPADY',
'ATTAPPILLY',
'ATTARAMOOLA',
'ATTINGAL (ATL)',
'ATTINPURAM',
'ATTUKAL (NEDUMANGAD)',
'ATTUKAL TEMPLE',
'AVINASHI',
'AYAMPARA',
'AYANCHERY',
'AYAPARAMPU',
'AYARKUNNAM',
'AYATHIL',
'AYILAM',
'AYIRAMTHENGU',
'AYOOR',
'AYYAMPARA',
'AYYAMPUZHA',
'AYYANKOLLY',
'AYYANTHOLE',
'AZHAKIYAKAVU TEMPLE',
'AZHAKULAM',
'AZHANGADU',
'AZHEEKKAL',
'AZHIKKAL',
'AZHIKODE',
'AZHIKODE (KODUNGALLUR)',
'AZHITHALA',
'BADANIPURAM',
'BADIYADKA',
'BAIRAKUPPA',
'BALAGRAM',
'BALAL',
'BALANPILLA CITY',
'BALANTHODE',
'BALARAMAPURAM',
'BALESUGIRI',
'BALUSSERY',
'BANAM',
'BANASURASAGAR DAM',
'BANDADKA',
'BANGALORE (SATELLITE, MAJESTIC)',
'BANGALORE PEENYA',
'BAVALI',
'BEDADKA',
'BEEMAPALLY',
'BEENACHI',
'BEKAL',
'BELINJE',
'BENGALAM',
'BENGALURU',
'BEVOORI',
'BHAGAMANDALA',
'BHAGAVATHIPURAM',
'BHAIRAVI MOORTHI TEMPLE',
'BHARANANGANAM',
'BHARANIKKAVU',
'BHARATHANOOR',
'BHASKAR NAGAR',
'BHEEMANADY',
'BHOOTHAKULAM',
'BHOOTHAMADAKKI',
'BISON VALLEY',
'BITTIKKAL',
'BLATHOOR',
'BLATHY',
'BMC ENGINEERING COLLEGE SASTHAMKOTTA',
'BODI',
'BODINAYAKANUR',
'BONACAUD',
'BONACAUD UPPER',
'BRAHMAMANGALAM',
'BRIMORE',
'C M MAKHAM',
'CALICUT',
'CENTRAL POLYTECHNIC',
'CHADAYAMANGALAM (CDM)',
'CHAIPANKUZHY',
'CHAKKA',
'CHAKKARAKAL',
'CHAKKITTAPARA',
'CHAKKULATHUKAVU',
'CHAKKUPPALAM',
'CHAKKUVARAKKAL',
'CHAL BEACH',
'CHALA',
'CHALA (KANNUR)',
'CHALAKKA',
'CHALAKKARA',
'CHALAKUDY BS (CLD)',
'CHALAPPALLY',
'CHALAVA',
'CHALINGADU',
'CHALIYAKKARA',
'CHALIYAM',
'CHALLIMUKKU',
'CHALODE',
'CHAMAMPATHAL',
'CHAMARAJANAGAR',
'CHAMPAKULAM',
'CHAMRAVATTOM',
'CHANDANAKAMPARA',
'CHANDRAGIRI',
'CHANGANASSERY BS (CHR)',
'CHANGANKARY',
'CHANGARAMKULAM',
'CHANGUVETTY',
'CHANKUVETTI',
'CHANNAMPOIKA',
'CHANNAPATTANA',
'CHANNAPETTA',
'CHANOTHU',
'CHANTHIROOR (IRITTY)',
'CHAPPARAPADAVU',
'CHAPPATH',
'CHARIPPARAMBU',
'CHARUMMOODU',
'CHARUPARA',
'CHATHAMMA',
'CHATHANAD',
'CHATHANCODE',
'CHATHANNOOR BS (CHT)',
'CHATHANTHARA',
'CHATHURTHYAKARI',
'CHATTANCHAL',
'CHAVAKKAD',
'CHAVARA',
'CHAVARA IRE',
'CHEDIKKULAM',
'CHEEKKADU',
'CHEEKKAL KADAVU',
'CHEEKKILODE',
'CHEEMENI',
'CHEERKKAYAM',
'CHEKADI',
'CHEKKIKULAM',
'CHELAARI',
'CHELACHUVADU',
'CHELAKKARA',
'CHELARI',
'CHELAYAM',
'CHELLANAM',
'CHELLANCHY',
'CHEMBAKAPPARA',
'CHEMBAKAPPARA (KATTAPPANA)',
'CHEMBANCODE',
'CHEMBILODE',
'CHEMBIRIKA',
'CHEMBOOR',
'CHEMBUCHIRA',
'CHEMBUKADAVU',
'CHEMMAD',
'CHEMMANAKARY',
'CHEMMANNAR',
'CHEMMAYAM',
'CHEMPAKASSERI KADAVU',
'CHEMPANARUVI',
'CHEMPAZHANTHY',
'CHEMPERI',
'CHEMPUMPURAM',
'CHENADAN KULAMBU',
'CHENAPPADY',
'CHENDAMANGALAM',
'CHENGALLOOR',
'CHENGALPATTU',
'CHENGANNUR BS (CGR)', //MARKER
'CHENGANNUR RAILWAY STATION',
'CHENGARA (PATHANAMTHITTA)',
'CHENKAL',
'CHENKARA (IDUKKI)',
'CHENKAVILA',
'CHENKULAM',
'CHENNAD',
'CHENNAI KOYAMBEDU',
'CHENNAMANGALLUR',
'CHENNAYKAVALA',
'CHENNEERKARA',
'CHENNINAIKANKUDY',
'CHEPPANAM',
'CHEPPILODE',
'CHEPPUKULAM',
'CHEPRA',
'CHERAI',
'CHERAMANGALAM',
'CHERAMANTHURUTHU',
'CHERAMBADI',
'CHERANALLOOR',
'CHERANDATHUR',
'CHERIAZHEEKKAL',
'CHERIKKAL',
'CHERIYAKONNI',
'CHERIYAMKOLLI',
'CHERIYANAD',
'CHERKALA',
'CHERPU',
'CHERPULASSERY',
'CHERTHALA',
'CHERUKADAVU',
'CHERUKOLPUZHA',
'CHERUKUNNU',
'CHERUMTHADAM',
'CHERUPPANI',
'CHERUPUZHA',
'CHERUTHONI',
'CHERUVADI',
'CHERUVALAM',
'CHERUVANCHERY',
'CHERUVATHOOR',
'CHETHALAYAM',
'CHETHUKAYAM',
'CHETTACHAL',
'CHETTAKKANDY',
'CHETTIKULANGARA',
'CHETTINADA',
'CHILAVU',
'CHINGAVANAM',
'CHINNAKKADA',
'CHINNATHURA',
'CHIPPILITHODE',
'CHIRAKKAL TEMPLE',
'CHIRAKKARA (KOLLAM)',
'CHIRAKKARA PANCHAYATH',
'CHIRATTAKONAM',
'CHIRAYAKAM',
'CHIRAYINKEEZHU',
'CHITHARA',
'CHITTADI',
'CHITTAR',
'CHITTARIKKAL',
'CHITTARIPARAMBA',
'CHITTOOR',
'CHITTOOR DEPOT',
'CHITTUMALA',
'CHOLADI',
'CHOLATHADAM',
'CHONAMALA',
'CHONAMPARA',
'CHOONAD',
'CHOONDACHERY',
'CHOONDY',
'CHOORAKKULAM',
'CHOORALMALA',
'CHOORAMUDY',
'CHOORUPARA',
'CHOTTANIKARA',
'CHOVOOR',
'CHOWALLOOR',
'CHOWARA',
'CHOWKKAKADAVU',
'CHOZHIYAKODU',
'CHULLIMANOOR',
'CHULLIYODE',
'CHULLY',
'CHUMATHRA',
'CHUNAKKARA',
'CHUNAKKARA TEMPLE',
'CHUNDA (KADAKKAL)',
'CHUNDA (WAYANAD)',
'CHUNDALE',
'CHUNDATHUMPOYIL',
'CHUNGATHARA',
'CHUNKAPARA',
'CHURANI',
'CHUZHALI',
'COCHIN',
'COIMBATORE (CBE)',
'COIMBATORE UKKADAM',
'COLACHEL',
'COONOOR',
'CSEZ KAKKANAD',
'CUMBUM (TAMIL NADU)',
'CUMBUMMETTU',
'CVR PURAM',
'DALAWA JN',
'DALUMMUGHAM',
'DARBHA',
'DASANAKKARA',
'DECENT MUKKU (KOTTARAKKARA)',
'DELI',
'DESAMANGALAM',
'DEVAGIRI',
'DEVALA',
'DEVARSHOLA',
'DEVARUPARA',
'DEVIKULAM',
'DEVIYAR COLONY',
'DHANUVACHAPURAM',
'DHARBHAKATTAKKAL',
'DHARMADAM',
'DHARMAPURI',
'DINDIGUL',
'EAST FORT (THIRUVANANTHAPURAM)',
'EATTITHOPPU',
'EATTU PURAKKAL',
'ECHO POINT (MUNNAR)',
'EDACKODU',
'EDAKKAD',
'EDAKKANAM',
'EDAKKARA',
'EDAKOCHI',
'EDAKOLY',
'EDAMATTOM',
'EDAMON',
'EDAMPADAM',
'EDAMURI',
'EDAPALLY',
'EDAPANA',
'EDAPPAL',
'EDATHANATTUKARA',
'EDATHUVA',
'EDAVA',
'EDAVANNA',
'EDAVANNAPPARA',
'EDAYAR',
'EDOOR',
'EENCHAKKAL',
'ELAMBAKAPPILLY',
'ELAMBAL',
'ELAMBILAD',
'ELAMKADU',
'ELANAD',
'ELANCHERY',
'ELANJI',
'ELANTHOOR',
'ELAPPARA',
'ELATHUR',
'ELAVARAMKUZHY',
'ELAVUMTHITTA',
'ELAYIL TEMPLE',
'ELECTRONICS CITY (BANGALORE)',
'ELENTHIKKARA',
'ELERI',
'ELERITHATTU',
'ELETTIL VATTOLI',
'ELEVANCHERRY',
'ELICODE',
'ELIPPODU',
'ELOOR',
'EMMANUVEL COLLEGE VAZHICHAL',
'ENATH',
'ENGAPUZHA',
'ENJAPURI',
'ENNAPPARA',
'ERAMALLIKARA',
'ERAMALLOOR',
'ERATTAKULAM',
'ERATTAYAR',
'ERATTUPETTA',
'ERAVATHOOR',
'ERAVIPEROOR',
'ERIKULAM',
'ERINHIPUZHA',
'ERNAKULAM',
'ERNAKULAM JETTY',
'ERNAKULAM SOUTH',
'ERODE',
'ERUMAD',
'ERUMAKKAD',
'ERUMALA',
'ERUMAMUNDA',
'ERUMELY',
'ERUTHAVOOR',
'ESIC (ASRAMAM)',
'ETTIKULAM',
'ETTUKUDUKKA',
'ETTUMANOOR',
'ETTUPURACKAL',
'EVOOR',
'EZHACHERRY',
'EZHIMALA NAVAL ACADEMY',
'EZHIPPURAM (ERNAKULAM)',
'EZHUKONE',
'EZHUMATTOOR',
'FEROKE',
'FORT KOCHI',
'ganapathipuram',
'GANDHI BHAVAN',
'GAVI',
'GIRIJAN COLONY',
'GOKULAM MEDICAL COLLEGE',
'GONIKOPPAL',
'GOPALAPURAM',
'GOTHURUTH',
'GOVINDAPURAM',
'GUDALLUR NILGIRIS',
'GUDALUR-CUMBUM',
'GUHANANDAPURAM',
'GUNDLUPET',
'GUNDULPET',
'GURUNADHANMANNU',
'GURUVAYOOR',
'HANUMARAMBALAM',
'HAPPY LAND',
'HARIPPAD',
'HASSAN',
'HD KOTTA',
'HIGH COURT',
'HMT KALAMASSERY',
'HOSUR',
'HQ HOSPITAL (Kannur)',
'HUNSUR',
'IDINJAR',
'IDIYAMVAYAL',
'IDUKKI',
'ILANJIYAM',
'ILLICHUVADU',
'ILLIKKAL',
'INFOPARK',
'INJAKUNDU',
'IQBAL COLLEGE PERINGAMALA',
'IRANIKKULAM',
'IRIKKUR',
'IRIMBILIYAM',
'IRINCHAYAM',
'IRINJALAKUDA',
'IRINJALAKUDA CIVIL STATION',
'IRITTY',
'IRTINGAL',
'IRULOOR',
'IRUMBAKACHOLA',
'IRUMPANANGADU',
'ITHALA',
'ITHIKKARA',
'ITTONAM',
'JADKAL',
'JALSOOR',
'JELLIPPARA',
'JERSY FARM',
'JILLA KRISHI THOTTAM PALODE',
'JOSEGIRI',
'K V JETTY',
'K.CHAPPATH',
'KAALADI',
'KAARAKKAD',
'KABANIGIRI',
'KACHANI',
'KACHERIPADI',
'KADACHIRA',
'KADAKKAL',
'KADAKKAVOOR',
'KADALUNDI',
'KADAMAKKUDY',
'KADAMAKUZHY',
'KADAMANITTA',
'KADAMANKODE',
'KADAMPANAD',
'KADAMPUZHA',
'KADAMURUTTI',
'KADAPPARA',
'KADAPPURAM (KANHANGAD)',
'KADAPUZHA',
'KADASSERY',
'KADAVANTHRA',
'KADINAMKULAM',
'KADIRUR',
'KADUKARA',
'KADUMENI',
'KADUTHURUTHY',
'KADUVATHODU',
'KAINAKARY',
'KAIPADI',
'KAIPPALLY',
'KAIPUZHA',
'KAIRALIPARA',
'KAITHAKKAD',
'KAITHAKODY',
'KAITHARAM',
'KAIVELI',
'KAIVELIKKAL',
'KAJAMPADY',
'KAKKAD',
'KAKKAD KADAVU',
'KAKKADAMPOYIL',
'KAKKADAVU',
'KAKKANAD',
'KAKKATTIL',
'KAKKAYAM',
'KAKKAYANGAD',
'KAKKI DAM',
'KAKKODI',
'KALADY',
'KALADY PLANTATION',
'KALAKKODE',
'KALAMASSERY',
'KALANKI',
'KALARIVATHUKKAL',
'KALASIPALAYAM (BANGALORE)',
'KALATHWA',
'KALAVOOR',
'KALAYAPURAM',
'KALICHANADUKAM',
'KALIKAVU',
'KALIKKADAVU',
'KALIYAR',
'KALIYIKKAVILA',
'KALLADIKODE',
'KALLALI',
'KALLAMBALAM',
'KALLAMPARA',
'KALLANODE',
'KALLANPULLU',
'KALLAR (MUNNAR)',
'KALLAR (VITHURA)',
'KALLARA',
'KALLARA (VAIKKOM)',
'KALLARKUTTY',
'KALLAYI',
'KALLAYI (PUTHUKKAD)',
'KALLELI',
'KALLETUMKARA',
'KALLIKKAD',
'KALLIL MAHADEVA TEMPLE',
'KALLIMOODU',
'KALLISSERY',
'KALLIYAL',
'KALLODY',
'KALLOOPPARA',
'KALLOOR',
'KALLUMVALAPP',
'KALLUNKAL',
'KALLUVATHUKKAL',
'KALOOR',
'KALPETTA',
'KALPETTA CIVIL STATION',
'KALTHOTTY',
'KALYANTHANI',
'KAMBALAKKAD',
'KAMBALLUR',
'KAMBAR',
'KAMBILIKANDAM',
'KAMBISSERY',
'KAMUKINCODE',
'KAMUKUMCHERY',
'KANAKAKKUNU (KANNUR)',
'KANAKAKKUNU (KAYAMKULAM)',
'KANAKAMALA',
'KANAKANKADAVU',
'KANAKKANPARA',
'KANAMVAYAL',
'KANAYANKAVAYAL',
'KANCHINADA',
'KANDERI',
'KANDIRI',
'KANGAYAM',
'KANHANGAD',
'KANHANGAD DEPOT',
'KANHIRAPOIL',
'KANICHUKULANGARA',
'KANIYAPURAM',
'KANJAR',
'KANJIKKUZHY (ALAPPUZHA)',
'KANJIKODE',
'KANJIRADUKKAM',
'KANJIRAKOLLI',
'KANJIRAMATTOM (ERNAKULAM)',
'KANJIRAMATTOM (KOTTAYAM)',
'KANJIRAMKULAM',
'KANJIRAPALLY',
'KANJIRAVELI',
'KANKOLE',
'KANNADIKKAL',
'KANNAMMOOLA',
'KANNAMPALLY',
'KANNANALLOOR',
'KANNAPURAM',
'KANNAVAM',
'KANNIMARCHOLA',
'KANNIYAKUMARI',
'KANNUR',
'KANNUR INTERNATIONAL AIRPORT',
'KANNUR UNIVERSITY',
'KANTHALAKONAM',
'KANTHALLOOR',
'KANYAKULANGARA',
'KANYAKUMARI',
'KAPPAD',
'KAPPIL',
'KAPPIMALA',
'KAPPUKAD',
'KARA (Kannur)',
'KARAKKAD',
'KARAKKATHODE',
'KARAKKATHURUTH',
'KARAKONAM',
'KARAKONAM MEDICAL COLLEGE',
'KARAKULAM',
'KARALAM',
'KARAPPARA',
'KARAPUZHA',
'KARATTAL KADAVU',
'KARAVALOOR',
'KARAVUR',
'KAREEPRA',
'KARETTU',
'KARICHAL',
'KARICODE',
'KARIKKOTTAKARY',
'KARIMANNOOR',
'KARIMANTHODE',
'KARIMBAN',
'KARIMBIL',
'KARIMBU',
'KARIMKUNNAM',
'KARIMUGHAL',
'KARINGAD',
'KARINGANNOOR',
'KARINKALLATHANI',
'KARIPPUR (BATHERY)',
'KARITHODU',
'KARITHOTTA',
'KARIVELLUR',
'KARIYAMCODE',
'KARIYAMPLAVE',
'KARIYODE',
'KARODE',
'KAROOR',
'KARUKACHAL',
'KARUKAPALLY',
'KARUKUTTY',
'KARULAI',
'KARUNAGAPPALLY',
'KARUR',
'KARUVAKULAM',
'KARUVANCHAL',
'KARUVARAKUNDU',
'KARUVATTA',
'KARYARA',
'KASARAGOD',
'KASARGOD CIVIL STATION',
'KASARGOD RAILWAY STATION',
'KATAMALLIKADAVU',
'KATTACHAL',
'KATTAKKADA',
'KATTAMPALLY',
'KATTANAM',
'KATTAPARAMBU',
'KATTAPPANA',
'KATTIKULAM',
'KATTILAPARA',
'KATTILEKUZHY',
'KATTILKADAVU',
'KATTIPPARA',
'KATTIYADU',
'KATUKUKKE',
'KAVALAM',
'KAVALAM LISIO',
'KAVANATTINKARA',
'KAVUMANNAM',
'KAVUMKANDAM EAST',
'KAVUMPURAM',
'KAYAKKODI',
'KAYALODE',
'KAYALPURAM PALLI',
'KAYAMKULAM',
'KAYAMKULAM RAILWAY STATION',
'KAYANNA',
'KAYOOR',
'KAYYOOR',
'KAZHAKUTTAM',
'KAZHIMBRAM',
'KAZHUTHURUTTY',
'KEECHERI (KANNUR)',
'KEECHERY',
'KEERUKUZHI',
'KEETHOLI',
'KEEZHAR',
'KEEZHAROOR',
'KEEZHPALLY',
'KELAKAM',
'KENDRIYA BHAVAN KAKKANAD',
'KENGERI',
'KENICHIRA',
'KESAVADASAPURAM',
'KICMA COLLEGE',
'KIDANGANNOOR',
'KIDANGARA',
'KIDANGOOR',
'KILIMANOOR',
'KINNINGAR',
'KISSUMAM',
'KIZHAKKAMBALAM',
'KIZHAKKEKARA',
'KOCHALUMMOOD',
'KOCHEEDA JETTY',
'KOCHI',
'KOCHUKADAVU',
'KOCHUMATTOM',
'KOCHUPALLY',
'KODAKARA',
'KODAKKATTUPARA',
'KODALIPARA',
'KODALY',
'KODANADU',
'KODANKARA',
'KODENCHERY',
'KODIMOOTTIL TEMPLE',
'KODINHI',
'KODIYATHUR',
'KODUMBU',
'KODUMON',
'KODUNGALLUR',
'KODUNGOOR',
'KODUVA',
'KODUVALLY',
'KODUVAYUR',
'KOILANDI',
'KOILERY',
'KOINADU',
'KOKKADU',
'KOKKATHODU',
'KOKKUNNU',
'KOKRI',
'KOLAGAPPARA',
'KOLAHALAMEDU',
'KOLAKUTH',
'KOLATHUR',
'KOLAYAD',
'KOLENCHERY',
'KOLITHATTU',
'KOLLADU',
'KOLLAKADAVU',
'KOLLAM',
'KOLLAM CIVIL STATION',
'KOLLAMCHIRA',
'KOLLAMKONAM',
'KOLLAPALLY',
'KOLLEGAL',
'KOLLENGODE',
'KOLLUR MOOKAMBIKA TEMPLE',
'KOLOTH JETTY',
'KOMBANAD',
'KOMBAYAR',
'KONDAYUR',
'KONDOTTY',
'KONGAD',
'KONGORPILLY',
'KONNAKKAD',
'KONNAKKALKADAVU',
'KONNAKUZHY',
'KONNATHADY',
'KONNI',
'KOODAL',
'KOODALI',
'KOODARANJI',
'KOOLIMAD',
'KOOMBARA',
'KOONAMMAVU',
'KOONANVENGA',
'KOORACHUNDU',
'KOORAMTHOOKU',
'KOOTHATTUKULAM',
'KOOTHUPARAMBA',
'KOOTTALIDA',
'KOOTTANAD',
'KOOTTAPPU',
'KOOTTAR',
'KOOTTAYI',
'KOOTTAYI AZHIMUKKAM',
'KOOTTIKKADA',
'KOOTTUPUZHA',
'KOOTUMVELI',
'KOPPAM',
'KORAMANGALA',
'KORATTY',
'KORUTHODU',
'KOTHAD FERRY',
'KOTHAMANGALAM',
'KOTHAVARA',
'KOTTAIKULAM',
'KOTTAKKADAVU',
'KOTTAKKAL',
'KOTTAKKAL (NAGAROOR)',
'KOTTAMANPARA',
'KOTTAMPARA',
'KOTTANGAL',
'KOTTANKULANGARA',
'KOTTAPPADY',
'KOTTAPURAM (ALUVA)',
'KOTTAPURAM (VIZHINJAM)',
'KOTTARAKADAVU',
'KOTTARAKKARA',
'KOTTARAKKARA ETC',
'KOTTARAKKARA RAILWAY STATION',
'KOTTARAKOTHU',
'KOTTATHARA',
'KOTTAVATTOM',
'KOTTAVILA',
'KOTTAYAM BS (KTM)',
'KOTTAYAM MEDICAL COLLEGE',
'KOTTAYI (PALAKKAD)',
'KOTTAYIL KOVILAKAM',
'KOTTIYAM',
'KOTTIYAM POLYTECHNIC COLLEGE',
'KOTTIYOOR',
'KOTTOOR',
'KOTTUKONAM',
'KOTTUKUNNAM',
'KOTTUVALLY',
'KOVALAM',
'KOVALAM BEACH',
'KOVILKADAVU',
'KOVILOOR',
'KOVILPATTI',
'KOVILTHOTTAM',
'KOVILUVILA',
'KOZHENCHERRY',
'KOZHICHAL',
'KOZHICODE (KOLLAM)',
'KOZHIKKODE',
'KOZHIKKODE AIRPORT (KARIPUR)',
'KOZHIKKODE MEDICAL COLLEGE',
'KOZHIKKODE RAILWAY STATION',
'KOZHIMALA',
'KOZHINJAMPARA',
'KOZHIPILLI',
'KOZHIPPARA',
'KOZHUVALLOOR',
'KOZHUVANA (BATHERY)',
'KOZHUVANAL',
'KRISHNAGIRI',
'KRISHNAN KOTTA',
'KRISHNAPURAM',
'KUDALUR (BATHERY)',
'KUDAPPANAKUNNU',
'KUDAPPANAMOODU',
'KUDAPURAM',
'KUDIYANMALA',
'KULAMAVU',
'KULAPPADA',
'KULATHOOR HS',
'KULATHOORMOZHY',
'KULATHUMON',
'KULATHUPUZHA',
'KULATHUR',
'KUMALI',
'KUMARAKOM',
'KUMARAMKUDY',
'KUMARAMPUTHUR',
'KUMBALACHOLA',
'KUMBALAM',
'KUMBALANGY FERRY',
'KUMBIDI',
'KUMBLA',
'KUMILY',
'KUMMALLOOR',
'KUMMANNOOR',
'KUMMIL',
'KUNCHITHANNY',
'KUNDALA TOP',
'KUNDANOOR',
'KUNDAPURA',
'KUNDARA',
'KUNDARA KEL',
'KUNDOOR',
'KUNDUKADAVU',
'KUNDUTHODE',
'KUNDYAM',
'KUNHOME',
'KUNIYAN',
'KUNNAM',
'KUNNAMANGALAM',
'KUNNAMKERY',
'KUNNAMKULAM',
'KUNNAMTHANAM',
'KUNNANVILA',
'KUNNATHUR',
'KUNNIKODE',
'KUNNONNI',
'KUNNUMKAI',
'KUNNUMMA',
'KURAKKODU',
'KURAMPALA',
'KURAVANTHAVALAM',
'KUREEPUZHA',
'KURICHIMUTTOM',
'KURINJILAKKADU',
'KURISHUMALA',
'KUROTTUPARA',
'KURUDANKADAVU',
'KURUMANDAL',
'KURUMASSERY',
'KURUMBALAKOTTA',
'KURUMPANMOOZHY',
'KURUMPAYAM',
'KURUMULLOOR',
'KURUPPAMPADY',
'KURUPPANTHARA',
'KURUTHANCODE',
'KURUVIALANGAD',
'KUTHIYATHODE',
'KUTTA COORG',
'KUTTAMALA',
'KUTTAMASSERY',
'KUTTIADY',
'KUTTICHAL',
'KUTTICHIRA',
'KUTTIKKANAM',
'KUTTIKOL',
'KUTTIPPURAM',
'KUTTISERY KADAVU',
'KUTTIYANI',
'KUZHALMANNAM',
'KUZHIMATHICADU',
'KUZHIMAVU',
'KUZHITHOLU',
'LABBAKKADA',
'LAHA',
'LAKKATTOOR',
'LAKKIDI',
'LAKSHMI VILASAM H.S',
'LS-17',
'MACHOORMALA',
'MADAKKAL',
'MADAKKARA',
'MADANPARA',
'MADANVILA',
'MADAPALLIKUNNU',
'MADATHARA',
'MADATHUMPADY',
'MADDUR',
'MADHURAI',
'MADIKERI',
'MADIWALA (BANGALORE)',
'MADURAI',
'MAHE',
'MAJESTIC (BANGALORE)',
'MAKKAMKUNNU',
'MAKKARAPARAMBA',
'MAKKIYAD',
'MALA',
'MALACHANI',
'MALAKKALLU',
'MALAKKAPPARA',
'MALAMPUZHA',
'MALANADA',
'MALANKARA (KALPETTA)',
'MALAPPATANAM',
'MALAPPURAM',
'MALAYALAPUZHA',
'MALAYAM',
'MALAYATTOOR',
'MALAYILKADAVU',
'MALAYINKEEZH',
'MALIANKARA',
'MALIKA KADAVU',
'MALLAM',
'MALLAPPALLY',
'MALOM',
'MALOOR COLLEGE PATHANAPURAM',
'MAMALAKANDAM',
'MAMBARAM',
'MAMBURAM',
'MAMPARA',
'MAMPAZHATHARA',
'MANAKADAVU',
'MANAKATTUMOOLA',
'MANAKAYI',
'MANALI',
'MANALY',
'MANAMBOOR',
'MANANTHAVADY',
'MANAPPADAM',
'MANAPPALLY',
'MANAPPARAI',
'MANAVARY',
'MANCODE',
'MANDAPATHINKADAVU',
'MANDHIRAM',
'MANDYA',
'MANEED',
'MANGALAM DAM',
'MANGALAPURAM',
'MANGALORE',
'MANICKAPPURAM',
'MANIKANDANCHAL',
'MANIKKADAVU',
'MANIMALA',
'MANIPAL',
'MANIPARA',
'MANIYAR',
'MANIYARANKUDY',
'MANIYUR',
'MANJALI (ADOOR)',
'MANJALY',
'MANJAMCODE',
'MANJANIKKARA',
'MANJAPARA (KADAKKAL)',
'MANJAPPARA',
'MANJAPRA',
'MANJERI',
'MANJESHWAR',
'MANJIKADU',
'MANKADAVU',
'MANKAMKUZHY',
'MANKAYAM (BALUSSERY)',
'MANKAYAM (PALODE)',
'MANKOMPU (ERATTUPETTA)',
'MANKULAM',
'MANKUZHI',
'MANKUZHY',
'MANNADI (VELLARADA)',
'MANNADISSALA',
'MANNADY',
'MANNAMKONAM',
'MANNAMKUZHY',
'MANNANCHERY',
'MANNAR',
'MANNARASSALA',
'MANNARKAD',
'MANNATHOOR',
'MANNEERA',
'MANNOOR',
'MANNOORKAVU',
'MANNUTHY',
'MANOOR',
'MANTHIKUZHY',
'MARAKKADAVU',
'MARAKKULAM',
'MARAMPALLY',
'MARANALLOOR',
'MARANGAD',
'MARANGATTUPALLY',
'MARAPPALAM',
'MARARIKULAM',
'MARAYAMUTTOM',
'MARAYOOR',
'MARIPUZHA',
'MARTHANDAM',
'MARUTHAKADAVU',
'MARUTHAMALA',
'MARUTHOORKONAM',
'MARYKULAM',
'MATCH FACTORY',
'MATHAMANGALAM',
'MATHIL',
'MATHILAKAM',
'MATTANNUR',
'MATTUPETTY',
'MAVADY',
'MAVELIKKARA',
'MAVUMCHAL',
'MAYAM',
'MAYYAL',
'MAYYANAD',
'MAYYIL',
'MECHAL',
'MEDICAL COLLEGE (THIRUVANANTHAPURAM)',
'MEDICAL COLLEGE (THRISSUR)',
'MEDICAL COLLEGE ERNAKULAM',
'MEDICAL COLLEGE KOTTAYAM',
'MEDICAL COLLEGE KOZHIKODE',
'MEEMPARA',
'MEENAKSHIPURAM',
'MEENANGADI',
'MEENANKAL',
'MEENKUNNAM',
'MEENKUNNU',
'MEEYANNOOR',
'MELARIYOD',
'MELATTUMOOZHY',
'MELATTUR',
'MELECHINNAR',
'MELEDUKKAM',
'MELEMUKKU',
'MELILA',
'MELKULANGARA',
'MELMARUVATHUR',
'MELMURINGODI',
'MELORAM',
'MELUKAVUMATTOM',
'MELUR',
'MEMALA',
'MENAKA',
'MEPPADI',
'MEPPAYUR',
'MEPRAL',
'MERIGIRI',
'METHALA',
'METHOTTAM',
'METHOTTY',
'METTUPALAYAM',
'MG UNIVERSITY',
'MITHIRMALA',
'MITHRAKARI',
'MITHRANIKETHAN',
'MONCOMBU',
'MONIPPALLY',
'MOOKAMBIKA TEMPLE',
'MOOKKANNUR',
'MOOKKENPETTY',
'MOOKKUMPUZHA',
'MOOLAMATTOM',
'MOOLAPPANA',
'MOOLEKADAVU',
'MOOLEPADAM',
'MOOLITHODU',
'MOONKILAR',
'MOONNAMTHODU (MANNARKAD)',
'MOONNANAKUZHY',
'MOONNILAVU',
'MOONUPEEDIKA',
'MOOTHEDATHUKAVU',
'MOOVATTUPUZHA',
'MOOVERIKARA',
'MOOZHIYAR',
'MOOZHY',
'MOTHIRAKANNY',
'MOTHIRAVAYAL',
'MOUNT',
'MUDAKOZHI',
'MUHAMMA',
'MUKKAM (ATHIKKAYAM)',
'MUKKAM (KOZHIKODE)',
'MUKKAMKUNNU',
'MUKKATHAN KADA',
'MUKKOLA',
'MUKKOLA (VIZHINJAM)',
'MUKKOOTTUTHARA',
'MUKUNDAPURAM',
'MULAGUNNATHUKAVU',
'MULAKULAM',
'MULAMKUZHI',
'MULANKUNNATHUKAVU',
'MULAPPURAM',
'MULAYAMVELI',
'MULAYARA',
'MULAYILKONAM',
'MULKI',
'MULLARINGADU',
'MULLASSERY',
'MULLENKOLLY',
'MULLERIA',
'MULLIKULANGARA',
'MULLOOL',
'MUNAB',
'MUNAMBAM',
'MUNDAKAI',
'MUNDAKAYAM',
'MUNDAMATTA',
'MUNDANPARA',
'MUNDELA',
'MUNDERI',
'MUNDOT',
'MUNDUR',
'MUNIYARA',
'MUNNAKAL BEACH',
'MUNNAR',
'MUNNOORPILLY',
'MUNROE THURUTH',
'MUPLIYAM',
'MURANI',
'MURIKKASSERY',
'MURIYAD',
'MURIYANKANNI',
'MURUKANJIRAM',
'MURUKKADY',
'MURUKKUMPUZHA',
'MUTHALAPOZHY',
'MUTHANGA',
'MUTHAPPANPUZHA',
'MUTHOOR',
'MUTHUKAD',
'MUTHUKUDA',
'MUTHUKULAM',
'MUTHUKURUSSI',
'MUTHUVILA',
'MUTTAMOODU',
'MUTTAR',
'MUTTIL',
'MUTTOM (CHITTUMALA)',
'MUTTOM (KOTTAYAM)',
'MUTTOM (THODUPUZHA)',
'MUTTUKAD',
'MUTTUKONAM',
'MUVATTUPUZHA',
'MUZHAPPILANGAD BEACH',
'MV HIGHER SECONDARY SCHOOL ARUMANOOR',
'MYLACHAL',
'MYLAMPOTTA',
'MYLELLAMPARA',
'MYSORE',
'NADAKKAL',
'NADAKKAVU THRIPUNITHURA',
'NADAPURAM',
'NADAVAYAL',
'NADUKANI',
'NADUVANNUR',
'NADUVIL',
'NAGAMPADAM',
'NAGAPATTINAM',
'NAGARA',
'NAGAROOR',
'NAGERCOIL',
'NALANCHIRA',
'NALIYANI',
'NALUKETTU',
'NAMBIANKAVU',
'NAMBIYARKUNNU',
'NANJANGUD',
'NANMINDA',
'NANNIYODE',
'NARAKATHINKALA',
'NARANAMTHODU',
'NARIKKUNNI',
'NARIYAMPARA',
'NARKILAKKAD',
'NAROKADAVU',
'NARUVAMOODU',
'NATTUKAL',
'NATYAMANGALAM',
'NAVAL BASE',
'NAVODAYA',
'NAYADAMPOYIL',
'NEDUMANGAD',
'NEDUMANKAVU',
'NEDUMBASSERY AIRPORT',
'NEDUMKANDAM',
'NEDUMPOIL',
'NEDUMUDY',
'NEDUVANNOOR',
'NEELESWARAM',
'NEERIKKADU',
'NEERKADAVU',
'NELLAD',
'NELLANAD',
'NELLETTIL',
'NELLIKUNNAM',
'NELLIMATTOM',
'NELLIMOODU',
'NELLIPOYIL',
'NELLIYAMPATHY',
'NENMARA',
'NERIYAMANGALAM',
'NETHAJI (PUNALUR)',
'NETHAJI PURAM',
'NETTAYAM',
'NETTAYATHUKONAM',
'NEYTHAKUDY',
'NEYYAR DAM',
'NEYYATTINKARA',
'NEYYATTINKARA RAILWAY STATION',
'NIDAMANGALAM',
'NILAKKAL',
'NILAMBUR',
'NILAMBUR RAILWAY STATION',
'NILAMEL',
'NILESHWAR',
'NILLANGAL',
'NIRANAM',
'NIRAVILPUZHA',
'NIRMALA COLLEGE (MUVATTUPUZHA)',
'NIT CALICUT',
'NJALIAKUZHY',
'NJANKADAVU',
'NJARA KAVALA',
'NJARACKAL',
'NMSM Govt COLLEGE KALPETTA',
'NOOLPUZHA',
'NOORADI',
'NOORANADU',
'NORTH PARAVUR',
'NSS COLLEGE PALAKKAD',
'NTPC',
'OACHIRA',
'OCHIRA',
'ODAKKADAVU',
'ODANAVATTOM',
'ODAPETTI',
'ODAYANCHAL',
'ODDANCHATRAM',
'ODUVALITHATTU',
'OLAKETTY',
'OLATHANI',
'OLAVAKODE',
'OLICKAMATTOM',
'OLIPPARA',
'OLIVE MOUNT',
'OLLUR',
'OMASSERY',
'OONNINMOODU',
'OONNUKAL',
'OORAMBU',
'OORKKADAVU',
'OORUKARY',
'OORUPOIKA',
'OORUTTAMBALAM',
'OOTTUPARA',
'OOTY',
'ORAPPU',
'ORIKKADAVU',
'ORKKATTERI',
'OTHERA',
'OTTAKANDAM',
'OTTAPALAM',
'OTTASEKHARAMANGALAM',
'OTTATHAI',
'OYOOR',
'OZHIVUPARA',
'PAALCHURAM',
'PAARAMADA',
'PAAVANGAD',
'PACHA TEMPLE',
'PACHAKKAD',
'PACHAMALA',
'PACHOOR',
'PADAHARAM',
'PADAM',
'PADANILAM',
'PADANNAKKARA',
'PADAPPAKKARA',
'PADAPPANAL',
'PADAPPENGAD',
'PADAYANIPPARA',
'PADICHAL',
'PADICHIRA',
'PADINJARETHARA',
'PADUPP',
'PADY',
'PAIKA',
'PAINAVU',
'PAINGOTTOOR',
'PAIPAD',
'PAITHALMALA',
'PAKALKURI',
'PAKKOM',
'PALA (PLA)',
'PALAKKAD',
'PALAKKAYAM',
'PALAKUNNU',
'PALAKUZHY',
'PALAMATTOM',
'PALANGARA',
'PALANI',
'PALAPPETTY',
'PALAPPILLY',
'PALAPRA',
'PALATHUMKADAVU',
'PALAYAD',
'PALAYAMPARAMBU',
'PALAYI',
'PALAYODE',
'PALIYODU',
'PALLADAM',
'PALLASSANA',
'PALLAVAN PADY',
'PALLICKAL',
'PALLIKATHODU',
'PALLIKKAL (NILAMEL)',
'PALLIKKUNNUMPURAM',
'PALLIMUKK',
'PALLIPPARA',
'PALLIPURAM (PATTAMBI)',
'PALLITHURA',
'PALLIYADU',
'PALLIYATH',
'PALODE',
'PALUVALLY',
'PALVELICHAM',
'PAMBA (SABARIMALA)',
'PAMBADY',
'PAMBAVALLEY',
'PAMBLA',
'PAMMATHINKEEZH',
'PAMPADUMPARA',
'PAMPADY',
'PAMPAKUDA',
'PANACHAMOODU',
'PANACODE',
'PANAMARAM',
'PANAMBUKADU',
'PANAMKUZHY',
'PANAMOOD',
'PANAMPATTA',
'PANANGAD',
'PANAPPAMKUNNU',
'PANATHOOR',
'PANAVALLY',
'PANAVILACODE TEMPLE',
'PANAVOOR',
'PANAYAM',
'PANAYAM (ANCHAL)',
'PANAYAM (PALODE)',
'PANAYAMUTTAM',
'PANCHARAKOLLY',
'PANDALAM',
'PANDANKARY',
'PANDAPILLY',
'PANDIKKAD',
'PANGODE',
'PANGOOPPARA',
'PANICKANKUDY',
'PANIYELI',
'PANJIKKAL',
'PANKAVU',
'PANMANA',
'PANNIMALA',
'PANNIYODE',
'PANOM',
'PANOOR',
'PANTHA',
'PANTHEERANKAVU',
'PAPPANAM',
'PAPPANAMCODE',
'PAPPINISSERI',
'PARA',
'PARADANCHAL',
'PARAKADAVU (MVPA)',
'PARAKKADAVU',
'PARAKKULAM',
'PARAMBA',
'PARAMBATH',
'PARAMBIKULAM',
'PARANDODE',
'PARANTHAKUZHY',
'PARAPPA',
'PARAPPANANGADI',
'PARAPPIL',
'PARAPPUR',
'PARAPPURAM',
'PARAPRAM',
'PARASSALA',
'PARASSALA RAILWAY STATION',
'PARASSINIKADAVU',
'PARATHANAM',
'PARATHODE',
'PARAVUR (ERNAKULAM)',
'PARAVUR (KOLLAM)',
'PARAYAKADAVU',
'PAREEKKANNI',
'PARIPPALLY',
'PARIPPALLY ESI',
'PARIPPU',
'PARIYAPURAM (PERINTHALMANNA)',
'PARIYARAM MEDICAL COLLEGE HOSPITAL',
'PARUMALA',
'PARUMALA CHURCH',
'PARUTHIKUZHY',
'PARUTHIPPALLY',
'PASUKKADAVU',
'PATHAMPUZHA',
'PATHANADU',
'PATHANAMTHITTA',
'PATHANAPURAM',
'PATHARAM',
'PATHENPARA',
'PATHINANCHIL KADAVU',
'PATHIPPALLY',
'PATHIRIPALA',
'PATTAMBI',
'PATTAMTHURUTH',
'PATTATHIL KADAVU',
'PATTAVAYAL',
'PATTAYAKKUDY',
'PATTAZHY',
'PATTIKAD (THRISSUR)',
'PATTIKKAD',
'PATTIMATTOM',
'PATTOM',
'PATTUVAM',
'PAVANGAD',
'PAVUMBA',
'PAYAM',
'PAYATTUPAKA',
'PAYYADI MEETHAL',
'PAYYAMBALAM BEACH',
'PAYYANNALOOR',
'PAYYANNUR',
'PAYYANNUR RAILWAY STATION',
'PAYYAVOOR',
'PAYYOLI',
'PAZHAKULAM',
'PAZHAMALA',
'PAZHAMBALAKODE',
'PAZHANJI',
'PAZHASSI DAM',
'PAZHAYAKADA',
'PAZHAYANGADI',
'PAZHAYANNUR',
'PAZHINJAM',
'PEECHI DAM',
'PEERUMEDU',
'PENGAMUKKU',
'PEPPARA',
'PERALASSERY',
'PERALASSERY',
'PERAMBRA',
'PERAMBRA ESTATE',
'PERANAM TEMPLE',
'PERAPPAYAM',
'PERASHANNOOR',
'PERAVOOR',
'PERAYAM',
'PERAYAM (PALODE)',
'PEREKONAM',
'PERIKKALLOOR',
'PERILA',
'PERINGAMALA',
'PERINGAMMALA (PALLICHAL)',
'PERINGATHUR',
'PERINJANAM',
'PERINTHALMANNA',
'PERIYA',
'PERIYA (NEDUMPOIL)',
'PERIYAKULAM',
'PERLA',
'PEROORKADA',
'PERUL',
'PERUMACHERY',
'PERUMALA',
'PERUMANNA',
'PERUMANOOR',
'PERUMATHURA',
'PERUMBADAVU',
'PERUMBADIKUNNU',
'PERUMBALA',
'PERUMBALAM',
'PERUMBAVOOR',
'PERUMBOOLA',
'PERUMKADAVILA',
'PERUMON',
'PERUMPADAPPU',
'PERUMPETTY',
'PERUMTHENARUVI',
'PERUNAD',
'PERUNGALATHUR',
'PERUVA',
'PERUVANNAMOOZHI',
'PERUVANTHANAM',
'PEYAD',
'PEZHUMKODE',
'PEZHUMTHURUTHU',
'PILLAPPARA',
'PINARAYI',
'PINAVOORKUDY',
'PINDIMANA',
'PIRAVOM',
'PIUS NAGAR',
'PLAKODE',
'PLAMOOTTUKADA',
'PLAMPAZHINJI',
'PLAMUDY',
'PODIYAKALA',
'POINACHY',
'POLLACHI',
'PONGIL',
'PONGUMMOODU',
'PONJASSERY',
'PONKUNNAM',
'PONKUZHI',
'PONMUDI',
'PONMUDI UPPER',
'PONNAMALA',
'PONNANI',
'PONNANKAYAM',
'PONNUKKARA',
'PONTHENPUZHA',
'POOCHAKKAL',
'POOCHAPRA',
'POOCHEDIKADU',
'POOKKATTIRI',
'POOKKATTUPADY',
'POOKKOTTUMPADAM',
'POOKOTTU TEMPLE',
'POOMALA',
'POOMARUTHIKUZHI',
'POOMKAVU',
'POONJAR',
'POONKULANJI',
'POONOOR',
'POOPPARA',
'POOTHADI',
'POOTHAMKUTTY',
'POOTHEDA',
'POOTHOTTA',
'POOTHOTTAM',
'POOVACHAL',
'POOVAKODE',
'POOVAMPALLY',
'POOVAR',
'POOVATHOOR',
'POOVATHUSSERY',
'POOVATTOOR',
'POOVATTUPARAMBA',
'POOYAMKUTTY',
'POOYAPPALLY',
'POOZHANADU',
'POOZHIKUNNU',
'POOZHITHODU',
'POREDAM',
'PORORA',
'POTHANICAD',
'POTHENCODE',
'POTHUKAL',
'POTHUNDI',
'POTHUPARA',
'POTTAYIL MUDIPPURA',
'POTTENPLAVE',
'POVIYARVILA',
'POWDIKONAM',
'POYYA',
'POZHIKKARA',
'POZHIYOOR',
'PRAKASH',
'PRAKKANAM',
'PRAKKULAM',
'PROVIDENCE WOMENS COLLEGE',
'PTP NAGAR',
'PUDUNAGARAM',
'PUDUR',
'PUKKATTUPADY',
'PULAPPATTA',
'PULINGOME',
'PULINKUNNU',
'PULIYANMALA',
'PULIYARAKONAM',
'PULIYOOR',
'PULLAD',
'PULLIKKADAVU',
'PULLIKKANAM',
'PULLOOPPI',
'PULLUMEDU',
'PULLUPANA',
'PULLURAMPARA',
'PULLUVILA',
'PULPALLY',
'PULUNTHURUTHIKADAVU',
'PUNALAL',
'PUNALUR',
'PUNALUR RAILWAY STATION',
'PUNCHAKKARI',
'PUNCHAKONAM',
'PUNCHAVAYAL',
'PUNGAMCHAL',
'PUNKULAM',
'PUNNAIKKA CHUNKAM',
'PUNNAKKADU',
'PUNNAKULAM',
'PUNNALA',
'PUNNAMOODU',
'PUNNEKKAD',
'PURAKKAD',
'PURAPUZHA',
'PURATHUR',
'PURUTHIPPARA',
'PUTHANANGADI (ALAPPUZHA)',
'PUTHANATHANI',
'PUTHENKAVU',
'PUTHENKAVUVILA',
'PUTHENKURISH',
'PUTHENPALAM',
'PUTHENTHOPE',
'PUTHENVELIKKARA',
'PUTHIYATHURA',
'PUTHOOR (KOLLAM)',
'PUTHUCODE',
'PUTHUKKAD',
'PUTHUKKULAM',
'PUTHUKULANGARA',
'PUTHUKURICHY',
'PUTHUPPADY',
'PUTHUPPALLY',
'PUTHUR (CHERUVATHUR)',
'PUTHUSSERY',
'PUTHUVELI',
'PUTTAD',
'PUTTUR',
'PYKARA',
'RAJAGIRI',
'RAJAKKAD',
'RAJAKUMARI',
'RAJAPALAYAM',
'RAMAKKALMEDU',
'RAMAMANGALAM',
'RAMANAGARA',
'RAMANATTUKARA',
'RAMANATTUKARA',
'RAMANKARI',
'RAMANTHALI',
'RAMAPURAM',
'RANDUKAI',
'RANNY (RNI)',
'RAVANESHWARAM',
'ROADUVILA',
'ROSEMALA',
'SAHYASEEMA',
'SAI GRAMAM',
'SAKTHIKULANGARA',
'SALEM',
'SAND BANKS',
'SANTHANPARA',
'SANTHIGIRI',
'SANTHIGIRI (BATHERY)',
'SANTHIGIRI ASHRAM',
'SANTHIGRAM',
'SARADKA',
'SARATHY (KOLLAM)',
'SASTHAMANGALAM',
'SASTHAMKAVU',
'SASTHAMKOTTA',
'SASTHAMNADA',
'SASTHANADA',
'SASTHRI NAGAR (IRITTY)',
'SATELLITE (BANGALORE)',
'SATHRAM',
'SEBIYOOR',
'SECRETARIAT',
'SEETHA MOUNT',
'SEETHATHODU',
'SELLIAMPARA',
'SENAPATHY',
'SETTUKUNNU',
'SHANTINAGAR (BANGALORE)',
'SHENKOTTAI',
'SHOLAYUR',
'SHORNUR',
'SILENT VALLEY MUNNAR',
'SINGAPERUMAL KOIL',
'SINKARAPALLY',
'SIVAPURAM',
'SN PURAM',
'SN PURAM (NEDUMANGAD)',
'SNEHATHEERAM',
'SOUTH KATHIPPARA',
'SREE NARAYANA COLLEGE CHEMPAZHANTHY',
'SREE NARAYANA HS PUTHUKULANGARA',
'SREEKANDAPURAM',
'SREEKARYAM',
'SREEKRISHNAPURAM',
'SREENARAYANAPURAM',
'SRIRANGAPATNA',
'SRM UNIVERSITY',
'ST XAVIERS COLLEGE TVM',
'ST.ANDREWS',
'STATUE',
'SUBRAHMANYA',
'SULLIA (SULLYA)',
'SULTHAN BATHERY',
'SULUR',
'SURATHKAL',
'SURYANELLI',
'TABORE',
'TAMBARAM',
'TANUR',
'TB HOSPITAL MEEYANNOOR',
'TECHNOPARK',
'TEEKOY',
'TENKAVILA TEMPLE',
'THACHAMPARA',
'THACHOTTUKAVU',
'THADICADU',
'THADIKADAVU',
'THADIKKAKADAVU',
'THADIYAMBADU',
'THADIYOOR',
'THAIKKAVU',
'THAKAZHY',
'THALACHIRA (KOTTARAKKARA)',
'THALACHIRA (PATHANAMTHITTA)',
'THALAKODE',
'THALAKULAM',
'THALANADU',
'THALAPPAADI',
'THALAPPUZHA',
'THALASSERY',
'THALASSERY DEPOT',
'THALAYAD',
'THALAYAZHAM',
'THALAYOLAPARAMBU',
'THALIPARAMBA',
'THALOOR',
'THALORA',
'THAMARAKUDY',
'THAMARAKULAM',
'THAMARASSERY',
'THANDIRIKKAL',
'THANGASSERY',
'THANIKKAMUNAYAM',
'THANJAVUR',
'THANKAMANI',
'THANKEY',
'THANNEERMUKKOM',
'THANNEERMUKKOM BUND ROAD JN',
'THANNIPPARA',
'THANNITHADAM',
'THANNITHODU',
'THATHAPPILLY',
'THATTAKUZHA',
'THATTATHUMALA',
'THAVALAM',
'THAYAMKARI',
'THAYANOOR',
'THAYYENI',
'THAZHATHU KULAKKADA',
'THAZHE CHOVVA',
'THEKKADA',
'THEKKADY',
'THEKKAN GURUVAYOOR',
'THEKKEMALA',
'THEKKETHERY',
'THEKKUMBHAGAM',
'THEKKUMBHAGAM (PARAVUR)',
'THELPARA',
'THEMPAMMOODU',
'THENGAKAL',
'THENGAMAM',
'THENGUMCODE',
'THENI',
'THENKARA',
'THENKASI',
'THENKURISSI',
'THENMALA',
'THENNOOR',
'THEPPUPARA',
'THERANDY',
'THERTHALLY',
'THETTUMMAL',
'THEVAKKAL',
'THEVARA',
'THEVERY',
'THEVIYARKUNNU',
'THEYYAPARA',
'THIDANAD',
'THILLANKERI',
'THIMIRI',
'THIRPARAPPU',
'THIRUMAKKULAM',
'THIRUMALA',
'THIRUMANDAMKUNNU',
'THIRUMENI',
'THIRUMUDIKKUNNU',
'THIRUMULLAVARAM',
'THIRUNELLI TEMPLE',
'THIRUNNAVAYA',
'THIRUPPUR',
'THIRUPURAM TEMPLE',
'THIRUVAIKKODE',
'THIRUVAIRANIKKULAM',
'THIRUVALLA',
'THIRUVALLA MARTHOMA COLLEGE',
'THIRUVALLOM',
'THIRUVALLOOR',
'THIRUVAMBADY',
'THIRUVANANTHAPURAM AIRPORT',
'THIRUVANANTHAPURAM CENTRAL',
'THIRUVANANTHAPURAM CIVIL STATION',
'THIRUVANANTHAPURAM GENERAL HOSPITAL',
'THIRUVANCHOOR',
'THIRUVANIYOOR',
'THIRUVANKULAM',
'THIRUVANVANDOOR',
'THIRUVARPU',
'THIRUVARUR',
'THIRUVATTA',
'THIRUVATTOOR',
'THIRUVAZHAMKUNNU',
'THIRUVILWAMALA',
'THODANAL',
'THODIYOOR HIGH SCHOOL',
'THODUPUZHA',
'THOLANUR',
'THOLICODE',
'THOLLAYIRAM',
'THOLPETTY',
'THOOKKUPALAM',
'THOOTHA',
'THOPPUMPADY',
'THOPRAMKUDY',
'THOTTADA',
'THOTTADY',
'THOTTAKKAD (KARUKACHAL)',
'THOTTAKKADU',
'THOTTAPPALLY',
'THOTTILPALAM',
'THOTTIPPAL',
'THOTTOOR',
'THOTTUMMAL',
'THOTTUMUKKAM',
'THOVALA',
'THRIKKADARIPOYIL',
'THRIKKUNNAPPUZHA',
'THRIPPALAVOOR',
'THRIPPUNITHURA',
'THRIPRAYAR',
'THRISSUR',
'THRITHALA',
'THUDIMARAM',
'THULAPPALLY',
'THUMPODU',
'THURAVOOR',
'THURAYIL KADAVU',
'THURAYILKUNNU',
'THURUTH (ALUVA)',
'THURUTHIPURAM',
'THUSHARAGIRI',
'THUTHIYOOR',
'THYCATTUSSERY',
'TINDIVANAM',
'TIRUMANGALAM',
'TIRUNELVELI',
'TIRUR',
'TK COLONY',
'TOP STATION (MUNNAR)',
'TRICHY',
'TRIKARIPUR',
'TV Puram',
'UCHAKADA',
'UCHAKKADA (VIZHINJAM)',
'UDAGAMANDALAM',
'UDAYAGIRI',
'UDAYAPURAM',
'UDIYANKULANGARA',
'UDUMALAI',
'UDUMALPET',
'UDUMBANCHOLA',
'UDUMBANNOOR',
'UDUPI',
'ULAVAIPU',
'ULIKKAL',
'ULIYAKOVIL',
'ULIYANAD',
'ULIYIL',
'ULIYOOR',
'ULLIKKAL',
'ULLIYERI',
'ULUNTHY',
'UMMANAZHI',
'UMMANNOOR',
'UNDAPPARA',
'UNIVERSITY (CALICUT)',
'UPPALA',
'UPPODU',
'UPPUKANDAM',
'UPPUKULAM',
'UPPUKULAM (MANNARKAD)',
'UPPUKUNNU',
'UPPUTHARA',
'UPPUTHODE',
'URAKAM',
'URUKKUNU',
'URULANTHANNI',
'URUPPUMKUTTY',
'USLAMPATTI',
'UTHIMOODU',
'UZHAMALAKKAL',
'UZHAVOOR',
'V P THURUTH',
'VADACKAL',
'VADAKARA',
'VADAKEKKARA',
'VADAKKENADA',
'VADAKKENCHERRY',
'VADAKKUMPURAM',
'VADANAPPALLY',
'VADASSERIKKARA',
'VADATTUPARA',
'VADUTHALA',
'VADUVANCHAL',
'VAGAMON',
'VAIKKOM',
'VAILATHUR',
'VAITHALMALA',
'VAKKALA',
'VAKKOM',
'VALAKOM',
'VALAKOM (MVPA)',
'VALAL',
'VALAMBOOR',
'VALANCHERY',
'VALAT',
'VALATHODE',
'VALATHUR',
'VALAVIL',
'VALAVOOR',
'VALAYAM',
'VALIAZHEEKAL',
'VALIYA AREEKAMALA',
'VALIYAKADU',
'VALIYAKAVU',
'VALIYAMALA',
'VALIYAPARAMBA',
'VALIYAPARAMBU',
'VALIYAPERUMPUZHA',
'VALIYAPOIL',
'VALIYAVELICHAM',
'VALLAM FERRY',
'VALLAMKADAVU FERRY',
'VALLICODE',
'VALLICODE KOTTAYAM',
'VALLIKADA',
'VALLIKKAVU (AMRITAPURI)',
'VALLIKKEEL',
'VALLIKKUNNU',
'VALLIKUNNAM',
'VALLIMANGALAM',
'VALLITHODE',
'VALLUR',
'VALLUVAMBRAM',
'VALLYENTHA',
'VALOOK',
'VAMANAPURAM',
'VAMANAPURAM (THIRUVALLA)',
'VANCHIYAM',
'VANCHIYODU',
'VANDANAM MEDICAL COLLEGE',
'VANDANMEDU',
'VANDIPERIYAR',
'VANDITHAVALAM',
'VANIAPPILLY',
'VANIRAPPARA',
'VANIYAPPARA',
'VANNAPURAM',
'VARANAD',
'VARANDARAPPILLY',
'VARAPPUZHA',
'VARAYAL',
'VARKALA',
'VARKALA SIVAGIRI',
'VARUMMALKADAVU',
'VATTAKKOL',
'VATTAPARA (PIRAVOM)',
'VATTAPPARA',
'VATTAPPARA (IDUKKI)',
'VATTAVADA',
'VATTIYOORKAVU',
'VATTOLLY',
'VAVADUKKAM',
'VAYALADA',
'VAYALKARA',
'VAYYATTUPUZHA',
'VAZHAKKAD',
'VAZHAKULAM (ALY)',
'VAZHAKULAM (THODUPUZHA)',
'VAZHAMANA',
'VAZHANI DAM',
'VAZHAVILA',
'VAZHICHAL',
'VAZHIKKADAVU (VKDV)',
'VAZHITHALA',
'VAZHUTHANAM',
'VECHOOCHIRA',
'VEDAGIRI',
'VEERPAD',
'VEETTINAL TEMPLE',
'VEEYAPURAM',
'VELANKANNI',
'VELANTHAVALAM',
'VELAYAMDESHAM',
'VELI',
'VELIANCODE',
'VELIYAM',
'VELIYAMCODE',
'VELIYANAD',
'VELIYANNOOR',
'VELIYANNOOR (VELLANAD)',
'VELIYATHUNADU',
'VELLACHAL',
'VELLACHIRA',
'VELLAIKADAVU',
'VELLAKAYAM',
'VELLAKOIL',
'VELLALLOOR',
'VELLAMTHETTY',
'VELLAMUNDA',
'VELLANAD',
'VELLANATHURUTHU',
'VELLANGALLUR',
'VELLANI',
'VELLANICODE',
'VELLANIKKAL',
'VELLARADA',
'VELLARAMKUNNU',
'VELLARAMKUTH',
'VELLARIKUND',
'VELLAVU',
'VELLAYANI AGRICULTURAL COLLEGE TVM',
'VELLIKKEEL',
'VELLIKULANGARA',
'VELLILAPPILLY',
'VELLIMON',
'VELLIYAMATTOM',
'VELLOOR',
'VELLUMANNADI',
'VELLUR',
'VEMBAYAM',
'VENAKKAVU',
'VENCHEMPU',
'VENGAD',
'VENGANOOR',
'VENGARA',
'VENGODE',
'VENJARAMOODU',
'VENKODE',
'VENMANY (IDUKKI)',
'VENMONY',
'VENNIKULAM',
'VENNIYODE',
'VENPAKAL',
'VETTADI',
'VETTAMPARA',
'VETTICHIRA',
'VETTIKKAL',
'VETTILAPPARA',
'VETTILAPPARA (CHALAKUDY)',
'VETTILAPPARA (KMGM)',
'VETTIMATTOM',
'VETTOM CHEERP',
'VETTUKADU',
'VICTORIA',
'VIKASBHAVAN',
'VILAKKOTTUR',
'VILAKKUPARA',
'VILAMBUKANDAM',
'VILANGAD',
'VILAPPILSALA',
'VILLUPURAM',
'VINOBANIKETHAN',
'VIRAJPET',
'VITHURA',
'VIZHINJAM',
'VLATHANKARA',
'VLAVETTY',
'VYPIN',
'VYTHIRI',
'VYTILLA HUB (VMH)',
'WADAKKANCHERY',
'WALAYAR',
'WANDOOR',
'WEST KALLADA',
'WILLINGDON ISLAND',
'WONDERLA KOCHI',
'YELANDUR',
'YENDAYAR',
'YEROOR',
];