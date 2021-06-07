const AppName = "bean";
const AppVersion = 0.1;
const Hosts = [
  "http://localhost",
  "http://192.168.50.133",
  "http://10.23.16.203"
];
var envHost = Hosts[1];

enum EnvType { test, pre, prod }

const AppEnv = EnvType.prod;

// const SampleNetworkImage = "image/8a3fa73e-8b62-4589-839f-c1b912dd3cb4.jpg";
const SampleNetworkImage = "image/sample.jpg";
const SampleUserID = "75bcd23";
const SampleImageID = "1fc2a24c-8e81-433e-9794-f41b3bc5dead";

const UserAgreeUrl = "https://www.notion.so/efa23d2b24564e65bfac63320f7f1215";
