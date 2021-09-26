import 'package:ku/api/connection.dart';
import 'package:ku/api/define.dart';
import 'package:ku/api/host.dart';

var appHost = KuHost(
  testHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: "192.168.50.54",
      port: 8007,
      ip: ''),
  preHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: "localhost",
      port: 8007,
      ip: ''),
  prodHost: KuConnection(
      protocal: KuConnectionProtocal.http,
      host: "localhost",
      port: 8007,
      ip: ''),
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
