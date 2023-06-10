import 'package:url_launcher/url_launcher.dart';

class UrlLauncher{
  Future<void> launchLink({required String url}) async{
    canLaunchUrl(Uri.parse(url)).then((value) async{
      if (!value){
        await launchUrl(Uri.parse(url));
      }else{
        print("Erro ao executar link");
      }
    });
  }
}