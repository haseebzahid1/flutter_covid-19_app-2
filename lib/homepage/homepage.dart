import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_covid_19_app_2/homepage/widget/line_chart.dart';
import 'package:flutter_covid_19_app_2/mixture/color.dart';
import 'package:flutter_covid_19_app_2/model/symptoms.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'homepage_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<Symptoms>(
      create: (context) => Symptoms(),
      child: HomePageWidget(),
    );
  }
}


class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size =  MediaQuery.of(context).size;
    final _provider = Provider.of<Symptoms>(context);
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor.withOpacity(.03),
          elevation: 0,
          leading: IconButton(onPressed: () { }, icon: SvgPicture.asset("assets/icons/menu.svg"),),
          actions: [
            IconButton(
                onPressed: (){},
                icon: SvgPicture.asset("assets/icons/search.svg")
            )
          ],
        ),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20,20, 20,40),
          decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.03),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)
              )
          ),
          child: GridView.builder(
             itemCount: _provider.demoProducts.length,
            gridDelegate:   const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: 1.45,
            ),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
               Product  productItem = _provider.demoProducts[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: productItem.iconColor?.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("${productItem.image}",height: 14,width: 14,),
                          ),
                          SizedBox(width: 5,),
                          Text("${productItem.title}",maxLines: 1,overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                              text:  TextSpan(
                                  style: TextStyle(color: kTextColor),
                                  children: [
                                    TextSpan(
                                        text: "${productItem.effectNumber}\n"
                                    ),

                                    TextSpan(
                                        text: "People",
                                        style: TextStyle(fontSize: 12,height: 2,fontWeight: FontWeight.w600)
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Expanded(child: LineReportChart()),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },

          ),
        ),
      );
  }
}


