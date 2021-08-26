import 'package:ku/api/connection.dart';
import 'package:ku/api/define.dart';
import 'package:ku/api/host.dart';

var appHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "192.168.50.54", port: 8007),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "localhost", port: 8007),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "localhost", port: 8007),
);

var sugarHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "192.168.50.54", port: 3007),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "localhost", port: 3007),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "localhost", port: 3007),
);

var forkHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "192.168.50.54", port: 3111),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "localhost", port: 3111),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http, host: "localhost", port: 3111),
);

var userOnlineHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.udp, host: "127.0.0.1", port: 33009),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.udp, host: "localhost", port: 33009),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.udp, host: "localhost", port: 33009),
);

var subRelationOnlineHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.udp, host: "127.0.0.1", port: 33030),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.udp, host: "localhost", port: 33030),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.udp, host: "localhost", port: 33030),
);
