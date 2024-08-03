import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource extends GetxService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      if (token.idToken != null) {
        final response = await _supabaseClient.auth.signInWithIdToken(
          provider: OAuthProvider.kakao,
          idToken: token.idToken!,
        );
        log('카카오톡 로그인: ${response.user.toString()}');
      } else {
        log('카카오톡 로그인 실패');
      }
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: signInWithKakao');
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final googleAuth = await googleUser.authentication;

      final response = await _supabaseClient.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth.idToken!,
      );

      log('구글 로그인: ${response.user.toString()}');
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: signInWithGoogle');
    }
  }
}
