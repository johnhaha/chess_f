import 'package:template/constants/hosts.dart';

//user
var userLoginAddr = appHost + "/api/ha/user/login/tel";
var userLogoutAddr = appHost + "/api/ha/user/logout";
var checkLoginCodeAddr = appHost + "/api/ha/user/login/tel-check";
var tokenLoginAddr = appHost + "/api/ha/user/login/token";
var updateUserInfoBaseAddr = appHost + "/api/ha/user/update/";

//push
var addPushDeviceAddr = appHost + "/api/push/device";

//post
var addPostAddr = appHost + "/api/ha/post/new";
var delPostBaseAddr = appHost + "/api/ha/post/delete/";

//labor
var updateUserLaborTimeAddr = appHost + "/api/ha/labor/update/time";
var updateUserLaborPlaceAddr = appHost + "/api/ha/labor/update/place";
var getUserLaborForceBaseAddr = appHost + "/api/ha/labor/force/";
var getUserLaborPlaceBaseAddr = appHost + "/api/ha/labor/place/";

//book
var updateBookTimeAddr = appHost + "/api/ha/book/update/time";
var updateBookPlaceAddr = appHost + "/api/ha/book/update/place";

//place
var getTXPlacesAddr = appHost + "/api/ha/place/tx";
var addPlaceAddr = appHost + "/api/ha/place/new";

//like
var likeActAddr = appHost + "/api/ha/like/act";
