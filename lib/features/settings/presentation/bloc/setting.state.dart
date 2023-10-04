import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class SettingState extends Equatable {
  final DioException? error;
  final String? errMsg, msg;
  final Locale? locale;
  const SettingState({
    this.error,
    this.errMsg,
    this.msg,
    this.locale,
  });

  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingState {}

class LanguageLoaded extends SettingState {
  const LanguageLoaded(Locale lang) : super(locale: lang);
}
