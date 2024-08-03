import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:soul_talk_clone/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthDataSource extends GetxService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<void> signInWithKakao() async {
    try {
      bool isInstalled = await kakao.isKakaoTalkInstalled();
      kakao.OAuthToken token = isInstalled
          ? await kakao.UserApi.instance.loginWithKakaoTalk()
          : await kakao.UserApi.instance.loginWithKakaoAccount();

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

      final user = response.user;

      if (user != null) {
        await _supabaseClient.from('users').upsert({
          'id': user.id,
          'email': user.email,
          'name': googleUser.displayName ?? 'Unknown',
          'profile_image_url': googleUser.photoUrl,
        });
        log('구글 로그인 성공: ${user.email}, 이름: ${googleUser.displayName}');
      }
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: signInWithGoogle');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final user = _supabaseClient.auth.currentUser;
    if (user != null) {
      final response = await _supabaseClient
          .from('users')
          .select()
          .eq('id', user.id)
          .single();

      final userModel = UserModel.fromMap(response);
      return userModel;
    }
    return null;
  }

  Future<void> signOut() async => await _supabaseClient.auth.signOut();
}
