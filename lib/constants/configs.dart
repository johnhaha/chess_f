import 'package:ku/api/connection.dart';
import 'package:ku/api/define.dart';
import 'package:ku/api/host.dart';

const machost = "192.168.50.54";
const localhost = "127.0.0.1";

//*pre
const preHostIP = "139.224.75.144";
const preHostName = "soba.kuaimai.fun";

//*prod
const prodHostIP = "128.199.233.143";
const prodHostName = "soba.mrwu.xyz";

//*current host
var currentHost = machost;
var currentProt = 8001;

var appHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: currentHost,
      port: currentProt,
      ip: ''),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: preHostName, port: 0, ip: ''),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: prodHostIP, port: 0, ip: ''),
);

var userOnlineHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: "127.0.0.1",
      port: 33009,
      ip: ''),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: "localhost",
      port: 33009,
      ip: ''),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: "localhost",
      port: 33009,
      ip: ''),
);

var subRelationOnlineHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: "127.0.0.1",
      port: 33030,
      ip: ''),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: "localhost",
      port: 33030,
      ip: ''),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: "localhost",
      port: 33030,
      ip: ''),
);

var subNewMsgHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: currentHost,
      ip: currentHost,
      port: 33010),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: preHostIP,
      ip: preHostIP,
      port: 33010),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.udp,
      host: prodHostIP,
      ip: prodHostIP,
      port: 33010),
);
