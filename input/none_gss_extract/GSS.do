#delimit ;

   infix
      year     1 - 20
      pray     21 - 40
      relig16  41 - 60
      jew16    61 - 80
      fund16   81 - 100
      god      101 - 120
      ballot   121 - 140
      sample   141 - 160
      wtssall  161 - 180
      postlife 181 - 200
      reliten  201 - 220
      id_      221 - 240
      age      241 - 260
      relig    261 - 280
      denom    281 - 300
      other    301 - 320
      jew      321 - 340
      fund     341 - 360
      attend   361 - 380
      vstrat   381 - 400
using GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable pray     "How often does r pray";
label variable relig16  "Religion in which raised";
label variable jew16    "What sort of jew r was at age 16";
label variable fund16   "How fundamentalist was r at age 16";
label variable god      "Rs confidence in the existence of god";
label variable ballot   "Ballot used for interview";
label variable sample   "Sampling frame and method";
label variable wtssall  "Weight variable";
label variable postlife "Belief in life after death";
label variable reliten  "Strength of affiliation";
label variable id_      "Respondent id number";
label variable age      "Age of respondent";
label variable relig    "Rs religious preference";
label variable denom    "Specific denomination";
label variable other    "Other protestant denominations";
label variable jew      "What sort of jew r is";
label variable fund     "How fundamentalist is r currently";
label variable attend   "How often r attends religious services";
label variable vstrat   "Variance stratum";


label define gsp001x
   9        "No answer"
   8        "Don't know"
   6        "Never"
   5        "Lt once a week"
   4        "Once a week"
   3        "Several times a week"
   2        "Once a day"
   1        "Several times a day"
   0        "Not applicable"
;
label define gsp002x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp003x
   9        "No answer"
   8        "Don't know"
   4        "None of these"
   3        "Reform"
   2        "Conservative"
   1        "Orthodox"
   0        "Not applicable"
;
label define gsp004x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp005x
   9        "No answer"
   8        "Don't know"
   6        "Know god exists"
   5        "Believe but doubts"
   4        "Believe sometimes"
   3        "Some higher power"
   2        "No way to find out"
   1        "Dont believe"
   0        "Not applicable"
;
label define gsp006x
   4        "Ballot d"
   3        "Ballot c"
   2        "Ballot b"
   1        "Ballot a"
   0        "Not applicable"
;
label define gsp007x
   10       "2010 fp"
   9        "2000 fp"
   8        "1990 fp"
   7        "1980 fp blk oversamp"
   6        "1980 fp"
   5        "1980 bfp blk oversamp"
   4        "1970 fp blk oversamp"
   3        "1970 fp"
   2        "1970 bq"
   1        "1960 bq"
;
label define gsp008x
   9        "No answer"
   8        "Don't know"
   2        "No"
   1        "Yes"
   0        "Not applicable"
;
label define gsp009x
   9        "No answer"
   8        "Don't know"
   4        "No religion"
   3        "Somewhat strong"
   2        "Not very strong"
   1        "Strong"
   0        "Not applicable"
;
label define gsp010x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp011x
   99       "No answer"
   98       "Don't know"
   13       "Inter-nondenominational"
   12       "Native american"
   11       "Christian"
   10       "Orthodox-christian"
   9        "Moslem/islam"
   8        "Other eastern"
   7        "Hinduism"
   6        "Buddhism"
   5        "Other"
   4        "None"
   3        "Jewish"
   2        "Catholic"
   1        "Protestant"
   0        "Not applicable"
;
label define gsp012x
   99       "No answer"
   98       "Don't know"
   70       "No denomination"
   60       "Other"
   50       "Episcopal"
   48       "Presbyterian-dk wh"
   43       "Presbyterian, merged"
   42       "Other presbyterian"
   41       "United pres ch in us"
   40       "Presbyterian c in us"
   38       "Lutheran-dk which"
   35       "Evangelical luth"
   34       "Other lutheran"
   33       "Wi evan luth synod"
   32       "Lutheran-mo synod"
   31       "Luth ch in america"
   30       "Am lutheran"
   28       "Methodist-dk which"
   23       "Other methodist"
   22       "United methodist"
   21       "Afr meth ep zion"
   20       "Afr meth episcopal"
   18       "Baptist-dk which"
   15       "Other baptists"
   14       "Southern baptist"
   13       "Nat bapt conv usa"
   12       "Nat bapt conv of am"
   11       "Am bapt ch in usa"
   10       "Am baptist asso"
   0        "Not applicable"
;
label define gsp013x
   999      "No answer"
   998      "Don't know"
   204      "Renia de deus"
   201      "Pathways christian church"
   199      "Follower of christ"
   198      "New life"
   197      "Grace independent baptist church"
   196      "Empowerment temple"
   195      "The ark church"
   194      "Jacobite syrian christian church"
   193      "Free spirit ministry"
   192      "New thought"
   191      "Faith covenant"
   190      "Faith fellowship"
   189      "Family life church"
   188      "Metropolitan community"
   187      "New apostolic"
   186      "National progressive baptist"
   185      "Journeys"
   184      "Church of god of israel"
   183      "Jacobite apostolic"
   182      "Alliance"
   181      "Born again"
   180      "Shield of faith ministries"
   179      "Great faith ministries"
   178      "Cathedral of joy"
   177      "Real life ministries"
   176      "Vineyard church"
   175      "Greater new testament church"
   174      "Shephard's chapel"
   173      "Harvest church"
   172      "Word of faith church"
   171      "Life sanctuary"
   170      "Cornerstone church"
   169      "The word church"
   168      "Rain on us deliverance ministries"
   167      "Sanctuary"
   166      "United christian"
   165      "Church of the living god"
   164      "Divine science"
   163      "Swedenurgian/churches of the new jerusalem"
   162      "Reformed church of jesus christ of latter day saints"
   161      "Hawaiian ohana"
   160      "Friends in christ"
   159      "Community christian fellowship"
   158      "New hope christian fellowship"
   157      "Community of christ"
   156      "Church of living christ"
   155      "Christian union"
   154      "Spirit filled"
   153      "Unity of the brethren"
   152      "Course in miracles"
   151      "World overcomer outreach ministry"
   150      "Zwinglian"
   149      "Polish catholic"
   148      "Schwenkfelder"
   146      "Laotian christian"
   145      "Church of jesus christ of the restoration"
   144      "Spirit of christ"
   143      "Assyrian evangelist church"
   142      "Unity school of christianity"
   141      "New birth christian"
   140      "People's church"
   139      "Faith christian"
   138      "Apostolic church"
   137      "New song"
   136      "New age spirituality"
   135      "Chinese gospel church"
   134      "Independent fundamental church of america"
   133      "Primitive baptist"
   132      "Brother of christ"
   131      "Macedonia"
   130      "True light church of christ"
   129      "Living word"
   128      "Christian tabernacle"
   127      "Church of daniel's band"
   126      "Carmelite"
   125      "Christian calvary chapel"
   124      "Faith gospel tabernacle"
   123      "Polish national church"
   122      "Chapel of faith"
   121      "The church of god of prophecy"
   120      "Evangelical united brethren"
   119      "United church of canada"
   118      "The way ministry"
   117      "Missionary church"
   116      "Church of the first born"
   115      "Mennonite brethren"
   114      "Church universal and triumphant"
   113      "Worldwide church of god"
   112      "Evangelical methodist"
   111      "Amish"
   110      "Calvary bible"
   109      "Bible missionary"
   108      "Christ cathedral of truth"
   107      "Apostolic christian"
   106      "Triumph church of god"
   105      "Latvian lutheran"
   104      "House of prayer"
   103      "Pentecostal apostolic"
   102      "Charismatic"
   101      "Christ in god"
   100      "Grace brethren"
   99       "American reform"
   98       "Federated church"
   97       "Other fundamentalist"
   96       "United church of christianity"
   95       "Unity"
   94       "Swedish mission"
   93       "Missionary baptist"
   92       "Mission covenant"
   91       "Evangelical covenant"
   90       "Holiness church of god"
   89       "Grace reformed"
   88       "Disciples of god"
   87       "Zion union apostolic--reformed"
   86       "Zion union apostolic"
   85       "Zion union"
   84       "Wesleyan methodist--pilgrim"
   83       "Wesleyan"
   82       "United church, unity church"
   81       "United church of christ"
   80       "Unitarian, universalist"
   79       "United holiness"
   78       "Sanctified, sanctification"
   77       "7th day adventist"
   76       "Salvation army"
   75       "Mind science"
   74       "Religious science"
   73       "Reformed church of christ"
   72       "Reformed united church of christ"
   71       "Reformed"
   70       "Quaker"
   69       "Pentecostal holiness, holiness pentecostal"
   68       "Pentecostal"
   67       "Pentecostal church of god"
   66       "Pentecostal assembly of god"
   65       "Nazarene"
   64       "Mormon"
   63       "Mennonite"
   62       "Lds--jesus christ; church of jesus lds"
   61       "Lds--reorganized"
   60       "Lds--mormon"
   59       "Lds"
   58       "Jehovah's witnesses"
   57       "Pilgrim holiness"
   56       "Holiness; church of holiness"
   55       "Holy roller"
   54       "Friends"
   53       "Four square gospel"
   52       "Full gospel"
   51       "First christian"
   50       "First reformed"
   49       "First christian disciples of christ"
   48       "First church"
   47       "Evangelist free church"
   46       "Evangelical reformed"
   45       "Evangelical, evangelist"
   44       "Disciples of christ"
   43       "Dutch reform"
   42       "Covenant"
   41       "Community church"
   40       "Congregationalist, 1st congreg"
   39       "Church of the living god"
   38       "Church of god in christ holiness"
   37       "Church of god in christ"
   36       "Churches of god(except with christ and holiness)"
   35       "Church of christ"
   34       "Church of christ, evangelical"
   33       "Christian scientist "
   32       "Christian reform"
   31       "Christian; central christian"
   30       "Christ adelphians"
   29       "Christ church unity "
   28       "Christian catholic"
   27       "Open bible"
   26       "Christ in christian union "
   25       "Christian disciples "
   24       "Independent"
   23       "United brethren, united brethren in christ"
   22       "Brethren, plymouth"
   21       "Witness holiness"
   20       "Brethren church, brethren "
   19       "Baptist (northern)"
   18       "Holiness (nazarene) "
   17       "Eden evangelist"
   16       "Free will baptist"
   15       "African methodist"
   14       "Apostolic faith"
   13       "Free methodist"
   12       "Assembly of god"
   11       "Spiritualist"
   10       "Advent christian"
   9        "Christian & missionary alliance"
   8        "Moravian"
   7        "Church of god, saint & christ"
   6        "New testament christian"
   5        "Church of prophecy"
   3        "Ind bible, bible, bible fellowship"
   2        "Evangelical congregational"
   1        "Hungarian reformed"
   0        "Not applicable"
;
label define gsp014x
   9        "No answer"
   8        "Don't know"
   4        "None of these"
   3        "Reform"
   2        "Conservative"
   1        "Orthodox"
   0        "Not applicable"
;
label define gsp015x
   9        "Na-excluded"
   8        "Don't know"
   3        "Liberal"
   2        "Moderate"
   1        "Fundamentalist"
   0        "Not applicable"
;
label define gsp016x
   9        "Dk,na"
   8        "More thn once wk"
   7        "Every week"
   6        "Nrly every week"
   5        "2-3x a month"
   4        "Once a month"
   3        "Sevrl times a yr"
   2        "Once a year"
   1        "Lt once a year"
   0        "Never"
;


label values pray     gsp001x;
label values relig16  gsp002x;
label values jew16    gsp003x;
label values fund16   gsp004x;
label values god      gsp005x;
label values ballot   gsp006x;
label values sample   gsp007x;
label values postlife gsp008x;
label values reliten  gsp009x;
label values age      gsp010x;
label values relig    gsp011x;
label values denom    gsp012x;
label values other    gsp013x;
label values jew      gsp014x;
label values fund     gsp015x;
label values attend   gsp016x;


