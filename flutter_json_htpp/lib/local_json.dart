import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/araba_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  
  String _title='local Json Islemleri';
  
 late final Future<List<Araba>> _listeyiDoldur;

  @override
  void initState() {
    super.initState();
    _listeyiDoldur=arabalarJsonOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(_title),
        ),
        floatingActionButton: FloatingActionButton(child: Text('Button'),onPressed: (){
          setState(() {
            _title='Buton Tıklandi';
          });
        }
                ),
        body: FutureBuilder<List<Araba>>(// burada futurebuilder beklememize sağlıyor 
        initialData: [Araba(arabaAdi: 'aaa', ulke: 'sad', kurulusYili: 1920, model:[Model(modelAdi: 'dsadsada', fiyat: '42', benzili: false)] )],
          future: _listeyiDoldur,//beklencek future metodu
          builder: (context,snapshot){//builder ile context alıp snapshot ile hata kontrlu yapailiyoruz datanın doğru gelip gelmediğini dair
            if (snapshot.hasData) {
              List<Araba> arabaListesi=snapshot.data!;

              return ListView.builder(itemCount: arabaListesi.length,itemBuilder:(context,index){
                Araba oankiAraba=arabaListesi[index];
                return ListTile(
                  title: Text(oankiAraba.arabaAdi),
                  subtitle: Text(oankiAraba.ulke),
                  leading: CircleAvatar(child: Text(oankiAraba.model[0].fiyat.toString()),),
                );
              } );
            }else if(snapshot.hasError){
               return Center(child: Text(snapshot.error.toString()),);
            }else{
               return Center(child: CircularProgressIndicator(),);
            }
            
          },
        ),
    );
  }

 Future<List<Araba>> arabalarJsonOku() async{


  try{
    /*.delayed(Duration(seconds: 5),(){
      return Future.error('5 saniye sonra hatası');
    });*/
    debugPrint('5 saniyelik islem basliyor');
    await Future.delayed(const Duration(seconds: 5), (){
      debugPrint('5 saniyelik işlem bitt');
    });


    //buarada json dosyasında okuduğumu bir metin ifadeyi string değere atadım
   String okunanString=await DefaultAssetBundle.of(context).loadString('assets/data/arabalar.json');

   
   //debugPrint(okunanString);
  // debugPrint("*******************");
   /*
   List arabalarListesi =jsonObject;
   debugPrint(arabalarListesi[1]['model'][0]['fiyat'].toString()); 
   */
  var jsonObject =jsonDecode(okunanString);// burada yukarda aldığımız string yapıyı jsondecode ile okuyup bir json objelere dönüştürdüm
   



   //buarada  jsonobject  list yapısına dönüştürmem gerekiyorki Liste döndüren bir araba nesnesi elde edeyim ,  jsonobect list dönüştür sonra git map fonskiyonu ile atadığım deişkene "arabaMap" gez ,gezilen listlerin içindeki MAP yapısını araba nesnesine dönüştür (burada amaç formatında tutulan veriyi araba nesnesine dönüştürdüm)
  List<Araba> tumArabalar = 
      (jsonObject as List).map((arabaMap) => Araba.fromMap(arabaMap)).toList();



  debugPrint(tumArabalar.length.toString());
  debugPrint(tumArabalar[0].model[0].modelAdi);
  debugPrint(tumArabalar[1].ulke);
   

   return tumArabalar;
  }catch(e){
    debugPrint(e.toString());
    return Future.error(e.toString());
  }
  }
}