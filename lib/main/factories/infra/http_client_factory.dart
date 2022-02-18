import 'package:http/http.dart';
import 'package:movies_app/infra/http/http_adapter.dart';

HttpAdapter makeHttpClient() => HttpAdapter(client: Client());