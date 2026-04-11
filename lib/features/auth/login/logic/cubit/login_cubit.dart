
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.initial());

  final email = TextEditingController();
  final password = TextEditingController(); 
  final formKey = GlobalKey<FormState>();

  myemit()async{
    emit(const LoginState.loading());
    await Future.delayed(const Duration(seconds: 3));
    emit( LoginState.success('success'));
  }
}
