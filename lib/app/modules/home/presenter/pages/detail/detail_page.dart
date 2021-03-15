import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/viewmodel/enterprise_detail_vm.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/consts.dart'
    as Consts;
import 'package:ioasys_flutter2_triple/app/shared/helpers/custom_colors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/utils.dart';
import 'detail_controller.dart';

class DetailPage extends StatefulWidget {
  final String title;
  const DetailPage({
    Key? key,
    this.title = "Detail",
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<DetailController, Failure, EnterpriseDetailVM>(
        store: store,
        onLoading: (_) => Container(),
        onError: (_, error) => Utils.buildError('Erro'),
        onState: (_, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text(''),
              flexibleSpace: Container(
                  decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xFF8325BB),
                    Color(0xFFAF1A7D),
                    Color(0xFFCB2E6C),
                    Color(0xFFDE94BC),
                  ],
                ),
              )),
            ),
            body: Stack(
              children: [
                Container(
                  color: CustomColors.whisper,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                            MediaQuery.of(context).size.width * 0.1),
                        topLeft: Radius.circular(
                            MediaQuery.of(context).size.width * 0.1),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 65),
                          Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                Text(
                                  store.state.enterprise.enterpriseName,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  store.state.enterprise.description,
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.08,
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: PageView.builder(
                      controller: PageController(
                          initialPage: store.state.enterprise.id - 1,
                          viewportFraction: 0.5),
                      onPageChanged: store.setPage,
                      itemCount: store.store.state.enterprises.length,
                      itemBuilder: (_, index) {
                        var enterprise = store.store.state.enterprises[index];
                        return Hero(
                          tag: 'enterprise${enterprise.id}',
                          child: ClipOval(
                            child: FadeInImage.assetNetwork(
                              fadeInDuration: Duration(seconds: 2),
                              fadeInCurve: Curves.bounceIn,
                              placeholder: 'assets/loading.gif',
                              image: enterprise.urlImage,
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
