import 'package:url_launcher/url_launcher.dart';

class LokasiViewModel {
  final String alamatSekolah = 'Perum Oma Indah Menganti';

  final Uri mapsUrl = Uri.parse(
    'https://maps.app.goo.gl/Xn1ur3AHH4kkCARm9?g_st=ac',
  );

  Future<bool> bukaGoogleMaps() async {
    return await launchUrl(
      mapsUrl,
      mode: LaunchMode.externalApplication,
    );
  }
}