import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/viewmodel/enterprise_vm.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/stores/home_store.dart';
import 'package:ioasys_flutter2_triple/app/shared/components/rounded_text_field/rounded_text_field_widget.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/consts.dart'
    as Consts;
import 'package:ioasys_flutter2_triple/app/shared/helpers/custom_colors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/utils.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    store.getEnterprises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .17,
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
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: SizedBox()),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .04,
                    child: RoundedTextFieldWidget(
                      prefixIcon: Icon(
                        Icons.search,
                        color: CustomColors.grey40,
                      ),
                      showBorder: false,
                      backgroundColor: Colors.white.withOpacity(0.7),
                      hintText: 'Encontre uma empresa',
                      onChanged: (v) {
                        store.store.setFilter(v!);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScopedBuilder<HomeStore, Failure, EnterpriseVM>(
              store: store.store,
              onLoading: (_) => Center(child: CircularProgressIndicator()),
              onError: (_, error) => Utils.buildError('Nada encontrado'),
              onState: (_, state) {
                if (state.enterprises.length == 0)
                  return Center(
                    child: Container(
                      height: 40,
                      width: 40,
                      child: CircularProgressIndicator(),
                    ),
                  );
                return ListView.builder(
                  itemCount: state.enterpriseFiltered.length,
                  itemBuilder: (_, index) {
                    var enterprise = state.enterpriseFiltered[index];
                    var number = enterprise.id;

                    return Container(
                      child: InkWell(
                        onTap: () {
                          Modular.to.pushNamed('enterprise/$number',
                              arguments: enterprise);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: 'enterprise$number',
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height * .2,
                                    child: Center(
                                        child: Text(
                                      enterprise.enterpriseName,
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                      textAlign: TextAlign.center,
                                    )),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: CustomColors.blue,
                                        image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          colorFilter: new ColorFilter.mode(
                                              Colors.purple.withOpacity(0.2),
                                              BlendMode.dstATop),
                                          image:
                                              NetworkImage(enterprise.urlImage),
                                        )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
