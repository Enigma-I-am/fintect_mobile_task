import 'package:dio/dio.dart';
import 'package:fintech_mobile_task/core/core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const timeOut = Duration(milliseconds: 60000);
final dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: ApiUrl.hostUrl,
      responseType: ResponseType.plain,
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
    ),
  )..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    )),
);

final authenticatedDioClientProvider = Provider<AuthenticatedDioClient>(
  (ref) => AuthenticatedDioClient(
    ref.read(dioProvider),
  ),
);

final walletClientProvider = Provider<WalletClient>(
  (ref) => WalletClient(
    client: ref.read(authenticatedDioClientProvider),
  ),
);

final wallerRepositoryProvider = Provider<WalletRepository>(
  (ref) => WalletRepository(
    accountCreationApiClient: ref.read(walletClientProvider),
  ),
);

final walletVM = ChangeNotifierProvider<WalletVM>(
  (ref) => WalletVM(
    ref.read(wallerRepositoryProvider),
  ),
);
