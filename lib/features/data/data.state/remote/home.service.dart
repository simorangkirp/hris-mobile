import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';

part 'home.service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HomeApiServices {
  factory HomeApiServices(Dio dio, {String baseUrl}) = _HomeApiServices;

  @POST('${baseUrl}API/user/profile/{uid}')
  Future<HttpResponse<dynamic>> profileInfo(
      @Path("uid") String uid, @Header("Authorization") String authHeader);
}
