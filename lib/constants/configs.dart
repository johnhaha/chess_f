import 'package:ku/api/connection.dart';
import 'package:ku/api/define.dart';
import 'package:ku/api/host.dart';
import 'package:chess/constants/util.dart';

const machost = "192.168.50.229";
const localhost = "127.0.0.1";

//*pre
const preHostIP = "139.224.75.144";
const preHostName = "chess.kuaimai.fun";
const preGrapHostName = "chess-grap.kuaimai.fun";

//*prod
const prodHostIP = "128.199.233.143";
const prodHostName = "chess.mrwu.xyz";

//*current host
// var currentHost = machost;
var currentProt = 8007;
var currentGrpcProt = 58007;
const preGrapPort = 88;

var appHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: getCurrentHost(),
      port: currentProt,
      ip: getCurrentIP()),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: preHostName,
      port: 0,
      ip: getCurrentIP()),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: prodHostIP,
      port: 0,
      ip: getCurrentIP()),
);

var grapHost = KuHost(
    testHost: KuConnection(
        protocal: KuConnectionProtocal.grpc,
        host: getCurrentHost(),
        port: currentGrpcProt,
        ip: getCurrentIP()),
    preHost: KuConnection(
        protocal: KuConnectionProtocal.grpc,
        host: preGrapHostName,
        port: preGrapPort,
        ip: getCurrentIP()),
    prodHost: KuConnection(
        protocal: KuConnectionProtocal.grpc,
        host: getCurrentHost(),
        port: preGrapPort,
        ip: getCurrentIP()));
