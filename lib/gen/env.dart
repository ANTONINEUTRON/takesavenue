// lib/env/env.dart
import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
class Env {
  @EnviedField(varName: 'CLOUDINARY_PRESET', obfuscate: true)
  static  String cloudinaryPreset = _Env.cloudinaryPreset;

  @EnviedField(varName: 'CLOUD_NAME', obfuscate: true)
  static  String cloudinaryCloudName = _Env.cloudinaryCloudName;
}
