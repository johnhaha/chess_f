import 'configs.dart';

String get sugarHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3007";
    case EnvType.pre:
      return "https://olive-res.gulu.online";
    case EnvType.prod:
      return "https://res.kuaimai.fun";
  }
}

String get forkHost {
  switch (AppEnv) {
    case EnvType.test:
      return "$envHost:3111";
    case EnvType.pre:
      return "https://olive-fork.gulu.online";
    case EnvType.prod:
      return "https://fork.kuaimai.fun";
  }
}
