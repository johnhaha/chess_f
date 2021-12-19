import 'package:ku/api/connection.dart';
import 'package:ku/api/define.dart';
import 'package:ku/api/host.dart';
import 'package:template/constants/util.dart';

const machost = "192.168.50.54";
const localhost = "127.0.0.1";

//*pre
const preHostIP = "139.224.75.144";
const preHostName = "template.kuaimai.fun";

//*prod
const prodHostIP = "128.199.233.143";
const prodHostName = "template.mrwu.xyz";

//*current host
// var currentHost = machost;
var currentProt = 8001;

var appHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: getCurrentHost(),
      port: currentProt,
      ip: ''),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: preHostName, port: 0, ip: ''),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: prodHostIP, port: 0, ip: ''),
);
