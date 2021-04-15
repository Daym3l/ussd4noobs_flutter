import 'package:flutter/material.dart';
import 'package:ussd4noobs/widgets/text/wideget.Title.dart';
import 'package:ussd4noobs/widgets/text/wideget.subtitle.dart';

class InfoPage extends StatelessWidget {
  final String version;

  InfoPage(this.version);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca de USSD4NOOBS.'),
      ),
      body: Padding(
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
              child: SubtitleText(version, 15),
            ),
            SizedBox(
              height: 80,
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_rounded,
                color: Theme.of(context).accentColor,
              ),
              title: SubtitleText('Califica la aplicación', 18),
              subtitle: SubtitleText(
                  'Haznos saber en Apklis cómo podemos hacerla aún mejor.', 12),
            ),
            Padding(padding: EdgeInsets.only(top: 14)),
            ListTile(
              leading: Icon(
                Icons.bug_report_rounded,
                color: Theme.of(context).accentColor,
              ),
              title: SubtitleText('Reportar un Error', 18),
              subtitle: SubtitleText(
                  'Ocurrió un error inesperado. Lamento que hayas encontrado este error.',
                  12),
            ),
            Padding(padding: EdgeInsets.only(top: 14)),
            ListTile(
              leading: Icon(
                Icons.card_giftcard_rounded,
                color: Theme.of(context).accentColor,
              ),
              title: SubtitleText('Donar', 18),
              subtitle: SubtitleText(
                  'Si crees que merezco que paguen por mi trabajo, puedes dejar algo de dinero aquí.',
                  12),
            ),
            Padding(padding: EdgeInsets.only(top: 14)),
            ListTile(
              leading: Icon(
                Icons.help_outline_rounded,
                color: Theme.of(context).accentColor,
              ),
              title: SubtitleText('Preguntas más frecuentes.', 18),
              subtitle: SubtitleText('Necesitas ayuda?', 12),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: SubtitleText(
                  "Agradecer a todas las personas que de una forma u otra han contribuido con el desarrollo de esta aplicación.",
                  14),
            ),
          ],
        ),
      ),
    );
  }
}
