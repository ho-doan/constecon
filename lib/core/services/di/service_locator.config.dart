// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../feature/about_us/data/local_data_sources/about_us_local_data_source.dart'
    as _i3;
import '../../../feature/about_us/data/remote_data_sources/about_us_remote_data_source.dart'
    as _i4;
import '../../../feature/about_us/domain/repositories/about_us_repository.dart'
    as _i5;
import '../../../feature/about_us/domain/use_case/about_us_use_case.dart'
    as _i6;
import '../../../feature/about_us/presentation/about_us/bloc/about_us_bloc.dart'
    as _i36;
import '../../../feature/contact/data/local_data_sources/contact_local_data_source.dart'
    as _i8;
import '../../../feature/contact/data/remote_data_sources/contact_remote_data_source.dart'
    as _i9;
import '../../../feature/contact/domain/repositories/contact_repository.dart'
    as _i10;
import '../../../feature/contact/domain/use_case/contact_use_case.dart' as _i11;
import '../../../feature/contact/presentation/contact/bloc/contact_bloc.dart'
    as _i37;
import '../../../feature/esg/data/local_data_sources/esg_local_data_source.dart'
    as _i12;
import '../../../feature/esg/data/remote_data_sources/esg_remote_data_source.dart'
    as _i13;
import '../../../feature/esg/domain/repositories/esg_repository.dart' as _i14;
import '../../../feature/esg/domain/use_case/esg_use_case.dart' as _i15;
import '../../../feature/esg/presentation/esg/bloc/esg_bloc.dart' as _i38;
import '../../../feature/home/data/local_data_sources/home_local_data_source.dart'
    as _i16;
import '../../../feature/home/data/remote_data_sources/home_remote_data_source.dart'
    as _i17;
import '../../../feature/home/domain/repositories/home_repository.dart' as _i18;
import '../../../feature/home/domain/use_case/home_use_case.dart' as _i19;
import '../../../feature/home/presentation/home/bloc/home_bloc.dart' as _i39;
import '../../../feature/new/data/local_data_sources/new_local_data_source.dart'
    as _i20;
import '../../../feature/new/data/remote_data_sources/new_remote_data_source.dart'
    as _i21;
import '../../../feature/new/domain/repositories/new_repository.dart' as _i22;
import '../../../feature/new/domain/use_case/new_use_case.dart' as _i23;
import '../../../feature/new/presentation/new/bloc/new_bloc.dart' as _i40;
import '../../../feature/partner/data/local_data_sources/partner_local_data_source.dart'
    as _i24;
import '../../../feature/partner/data/remote_data_sources/partner_remote_data_source.dart'
    as _i25;
import '../../../feature/partner/domain/repositories/partner_repository.dart'
    as _i26;
import '../../../feature/partner/domain/use_case/partner_use_case.dart' as _i27;
import '../../../feature/partner/presentation/partner/bloc/partner_bloc.dart'
    as _i41;
import '../../../feature/product/data/local_data_sources/product_local_data_source.dart'
    as _i28;
import '../../../feature/product/data/remote_data_sources/product_remote_data_source.dart'
    as _i29;
import '../../../feature/product/domain/repositories/product_repository.dart'
    as _i30;
import '../../../feature/product/domain/use_case/product_use_case.dart' as _i31;
import '../../../feature/product/presentation/product/bloc/product_bloc.dart'
    as _i42;
import '../../../feature/recruitment/data/local_data_sources/recruitment_local_data_source.dart'
    as _i32;
import '../../../feature/recruitment/data/remote_data_sources/recruitment_remote_data_source.dart'
    as _i33;
import '../../../feature/recruitment/domain/repositories/recruitment_repository.dart'
    as _i34;
import '../../../feature/recruitment/domain/use_case/recruitment_use_case.dart'
    as _i35;
import '../../../feature/recruitment/presentation/recruitment/bloc/recruitment_bloc.dart'
    as _i43;
import '../../network/api_util.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AboutUsLocalDataSource>(() => _i3.AboutUsLocalDataSource());
  gh.factory<_i4.AboutUsRemoteDataSource>(() => _i4.AboutUsRemoteDataSource());
  gh.factory<_i5.AboutUsRepository>(() => _i5.AboutUsRepository.create(
        gh<_i4.AboutUsRemoteDataSource>(),
        gh<_i3.AboutUsLocalDataSource>(),
      ));
  gh.factory<_i6.AboutUsUseCase>(
      () => _i6.AboutUsUseCase(gh<_i5.AboutUsRepository>()));
  gh.factory<_i7.ApiUtil>(() => _i7.ApiUtil());
  gh.factory<_i8.ContactLocalDataSource>(() => _i8.ContactLocalDataSource());
  gh.factory<_i9.ContactRemoteDataSource>(() => _i9.ContactRemoteDataSource());
  gh.factory<_i10.ContactRepository>(() => _i10.ContactRepository.create(
        gh<_i9.ContactRemoteDataSource>(),
        gh<_i8.ContactLocalDataSource>(),
      ));
  gh.factory<_i11.ContactUseCase>(
      () => _i11.ContactUseCase(gh<_i10.ContactRepository>()));
  gh.factory<_i12.EsgLocalDataSource>(() => _i12.EsgLocalDataSource());
  gh.factory<_i13.EsgRemoteDataSource>(() => _i13.EsgRemoteDataSource());
  gh.factory<_i14.EsgRepository>(() => _i14.EsgRepository.create(
        gh<_i13.EsgRemoteDataSource>(),
        gh<_i12.EsgLocalDataSource>(),
      ));
  gh.factory<_i15.EsgUseCase>(() => _i15.EsgUseCase(gh<_i14.EsgRepository>()));
  gh.factory<_i16.HomeLocalDataSource>(() => _i16.HomeLocalDataSource());
  gh.factory<_i17.HomeRemoteDataSource>(() => _i17.HomeRemoteDataSource());
  gh.factory<_i18.HomeRepository>(() => _i18.HomeRepository.create(
        gh<_i17.HomeRemoteDataSource>(),
        gh<_i16.HomeLocalDataSource>(),
      ));
  gh.factory<_i19.HomeUseCase>(
      () => _i19.HomeUseCase(gh<_i18.HomeRepository>()));
  gh.factory<_i20.NewLocalDataSource>(() => _i20.NewLocalDataSource());
  gh.factory<_i21.NewRemoteDataSource>(() => _i21.NewRemoteDataSource());
  gh.factory<_i22.NewRepository>(() => _i22.NewRepository.create(
        gh<_i21.NewRemoteDataSource>(),
        gh<_i20.NewLocalDataSource>(),
      ));
  gh.factory<_i23.NewUseCase>(() => _i23.NewUseCase(gh<_i22.NewRepository>()));
  gh.factory<_i24.PartnerLocalDataSource>(() => _i24.PartnerLocalDataSource());
  gh.factory<_i25.PartnerRemoteDataSource>(
      () => _i25.PartnerRemoteDataSource());
  gh.factory<_i26.PartnerRepository>(() => _i26.PartnerRepository.create(
        gh<_i25.PartnerRemoteDataSource>(),
        gh<_i24.PartnerLocalDataSource>(),
      ));
  gh.factory<_i27.PartnerUseCase>(
      () => _i27.PartnerUseCase(gh<_i26.PartnerRepository>()));
  gh.factory<_i28.ProductLocalDataSource>(() => _i28.ProductLocalDataSource());
  gh.factory<_i29.ProductRemoteDataSource>(
      () => _i29.ProductRemoteDataSource());
  gh.factory<_i30.ProductRepository>(() => _i30.ProductRepository.create(
        gh<_i29.ProductRemoteDataSource>(),
        gh<_i28.ProductLocalDataSource>(),
      ));
  gh.factory<_i31.ProductUseCase>(
      () => _i31.ProductUseCase(gh<_i30.ProductRepository>()));
  gh.factory<_i32.RecruitmentLocalDataSource>(
      () => _i32.RecruitmentLocalDataSource());
  gh.factory<_i33.RecruitmentRemoteDataSource>(
      () => _i33.RecruitmentRemoteDataSource());
  gh.factory<_i34.RecruitmentRepository>(
      () => _i34.RecruitmentRepository.create(
            gh<_i33.RecruitmentRemoteDataSource>(),
            gh<_i32.RecruitmentLocalDataSource>(),
          ));
  gh.factory<_i35.RecruitmentUseCase>(
      () => _i35.RecruitmentUseCase(gh<_i34.RecruitmentRepository>()));
  gh.factory<_i36.AboutUsBloc>(
      () => _i36.AboutUsBloc(gh<_i6.AboutUsUseCase>()));
  gh.factory<_i37.ContactBloc>(
      () => _i37.ContactBloc(gh<_i11.ContactUseCase>()));
  gh.factory<_i38.EsgBloc>(() => _i38.EsgBloc(gh<_i15.EsgUseCase>()));
  gh.factory<_i39.HomeBloc>(() => _i39.HomeBloc(gh<_i19.HomeUseCase>()));
  gh.factory<_i40.NewBloc>(() => _i40.NewBloc(gh<_i23.NewUseCase>()));
  gh.factory<_i41.PartnerBloc>(
      () => _i41.PartnerBloc(gh<_i27.PartnerUseCase>()));
  gh.factory<_i42.ProductBloc>(
      () => _i42.ProductBloc(gh<_i31.ProductUseCase>()));
  gh.factory<_i43.RecruitmentBloc>(
      () => _i43.RecruitmentBloc(gh<_i35.RecruitmentUseCase>()));
  return getIt;
}
