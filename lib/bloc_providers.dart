import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginScreenCubit>(create: (context) => LoginScreenCubit()),
];
