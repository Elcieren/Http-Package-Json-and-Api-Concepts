

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'model/user_model.dart';

class RometeApi extends StatefulWidget {
  const RometeApi({super.key});

  @override
  State<RometeApi> createState() => _RometeApiState();
}

class _RometeApiState extends State<RometeApi> {

  Future<List<UserModel>> _getUserList() async{

    try {
       var response=await  Dio().get('https://jsonplaceholder.typicode.com/users');
       List<UserModel> _userList =[];
       if (response.statusCode==200) {
         _userList =
        (response.data as List).map((e) => UserModel.fromMap(e)).toList();
       }
       return _userList;
    }on DioException catch (e) {
      
      return Future.error(e);
    }

  }

 late final Future<List<UserModel>> _userList;
  @override
  void initState() {
    
    super.initState();
    _userList=_getUserList();// burdakş amaç veri getirdiğiiz builder tekrar ve tekrar veri geitrmesin bu liste hazır olsun futurebuildera verelimki ekranda br değişiklik olduğunda bir kere çalışsın future
  }
  @override
  Widget build(BuildContext context) {
    _getUserList();
    return Scaffold(
      appBar: AppBar(title: const Text('Romete Api with Dio')
      ),
      body: Center(
        child: FutureBuilder<List<UserModel>>(future: _userList, builder:(context,snapshot) {
          if (snapshot.hasData) {
            var userList =snapshot.data!;
            return ListView.builder(itemBuilder:(context ,index){
              var user= userList[index];
              return ListTile(
                title: Text(userList[index].email),
                subtitle: Text(user.address.toString()),
                leading: Text(user.id.toString()),
              );
            },itemCount: userList.length,);
          }else if(snapshot.hasError){
             return Text(snapshot.error.toString());
          }else{
            return CircularProgressIndicator();
          }
          

        } ),
      ),
    );
  }
}