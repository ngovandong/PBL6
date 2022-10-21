import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_place/google_place.dart';
import 'package:mobile/common/constants/env_keys.dart';
import 'package:mobile/common/utils/dio/dio_provider.dart';

abstract class GoogleApiUtil {
  static final GooglePlace _googlePlace =
      GooglePlace(dotenv.env[EnvKeys.googleApiKey].toString());

  static void queryAutocomplete(String input) async {
    final String? autocompleteResponse =
        await _googlePlace.queryAutocomplete.getJson(input);

    final HttpRequestResponse remoteRespose = await DioProvider.get(
      endpoint:
          '${dotenv.env[EnvKeys.googleApiUrl].toString()}&input=$input&types=geocode',
      // queryParams: {'input': input, 'types': 'cities'},
    );

    log(remoteRespose.data['predictions'].toString());
  }
}
