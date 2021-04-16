import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class InfoPage extends StatelessWidget {
  final String version;
  final String _url = 'https://www.apklis.cu/application/dev.mad.ussd4etecsa';
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ussd4noobs@gmail.com',
      queryParameters: {'subject': 'Bug'});
  InfoPage(this.version);

  void _launchURL(String uri) async => {await launch(uri)};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de USSD4NOOBS.'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 40, 8, 16),
          child: Column(
            children: [
              Center(
                child: Image(
                  height: 80.0,
                  image: AssetImage('assets/icons/ic_launcher.png'),
                ),
              ),
              Center(
                child: TitleText('USSD4NOOBS', 24),
              ),
              Center(
                child: TileText(version.isEmpty ? 'loading' : version, 15),
              ),
              SizedBox(
                height: 40,
              ),
              ListTile(
                onTap: () => _launchURL(_url),
                leading: Icon(
                  Icons.star_border_rounded,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                title: TileText('Califica la aplicación', 18),
                subtitle: TileText(
                    'Haznos saber en Apklis cómo podemos hacerla aún mejor.',
                    12),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              ListTile(
                onTap: () => _launchURL(_emailLaunchUri.toString()),
                leading: Icon(
                  Icons.bug_report_rounded,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                title: TileText('Reportar un Error', 18),
                subtitle: TileText(
                    'Ocurrió un error inesperado. Lamento que hayas encontrado este error.',
                    12),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              ListTile(
                leading: Icon(
                  Icons.card_giftcard_rounded,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                title: TileText('* Donar', 18),
                subtitle: TileText(
                    'Si crees que merezco que paguen por mi trabajo, puedes dejar algo de dinero aquí.',
                    12),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              ListTile(
                leading: Icon(
                  Icons.help_outline_rounded,
                  color: Theme.of(context).textTheme.bodyText1.color,
                ),
                title: TileText('* Preguntas más frecuentes.', 18),
                subtitle: TileText('Necesitas ayuda?', 12),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Text(
                  "Agradecer a todas las personas que de una forma u otra han contribuido con el desarrollo de esta aplicación.",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
