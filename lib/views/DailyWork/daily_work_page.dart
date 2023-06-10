import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:happy_place/models/api_animal_model.dart';
import 'package:happy_place/repository/api_animal.dart';
import 'package:happy_place/repository/list_works.dart';
import 'package:happy_place/utils/decoration_container.dart';

import '../../services/constants.dart';

class DailyWork extends StatefulWidget {
  const DailyWork({Key? key}) : super(key: key);

  @override
  State<DailyWork> createState() => _DailyWorkState();
}

class _DailyWorkState extends State<DailyWork> {
  List<ApiAnimalModel> cats = [];
  List<ApiAnimalModel> dogs = [];

  Future? getAnimals;

  @override
  void initState() {
    getAnimals = getCatRepository();
    super.initState();
  }

  getCatRepository() async{
    await ApiAnimalRepository().getApiCat().then((value) {
      setState(() {
        cats = value;
      });
    });
    await ApiAnimalRepository().getApiDog().then((value) {
      setState(() {
        dogs = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Utils().containerWithDecoration(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AutoSizeText("Motivação do dia", style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                  color: Color(0xFFFFF4EA)
              )),
              const SizedBox(height: 20),
              cardWork(),
              FutureBuilder(
                  future: getAnimals,
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.connectionState == ConnectionState.done){
                      return cardsTogether();
                    }else{
                      return Column(
                        children: [
                          const SizedBox(height: 60),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const[
                              CircularProgressIndicator(color: Color(0xFFFFC61A)),
                              SizedBox(width: 14),
                              AutoSizeText("Momento de fofura sendo carregado...", style: TextStyle(
                               fontSize: 14,
                               color: Colors.white
                              ))
                            ],
                          ),
                        ],
                      );
                    }
                  }
              )
            ],
          ),
      )
    );
  }

  Widget cardsTogether(){
    return Column(
      children: [
        const SizedBox(height: 60),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (BuildContext context, int index){
                return cardAnimals(
                    urlImage: cats[index].url!
                );
              }
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 150,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dogs.length,
              itemBuilder: (BuildContext context, int index){
                return cardAnimals(
                    urlImage: dogs[index].url!
                );
              }
          ),
        ),
      ],
    );
  }

  Widget cardWork(){
    return Container(
      height: 88,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: AutoSizeText(ListWorks().getRandomWork(), style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14
          )),
        ),
      ),
    );
  }

  Widget cardAnimals({required String urlImage}){
    return SizedBox(
      height: 150,
      width: 150,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.network(urlImage, fit: BoxFit.cover)
      )
    );
  }
}
