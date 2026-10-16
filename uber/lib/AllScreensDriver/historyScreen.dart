import 'package:uber/AllWidgetsDriver/HistoryItem.dart';
import 'package:uber/DataHandler/appData.dart';
import 'package:uber/Models/history.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class historyScreenDriver extends StatefulWidget {
   static const String idScreen = "car";
  @override
  _historyScreenDriverState createState() => _historyScreenDriverState();
}

class _historyScreenDriverState extends State<historyScreenDriver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('                Trip History'),
        backgroundColor: Colors.black87,
        
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.keyboard_arrow_left),
        ),
      ),

      body: ListView.separated(
        padding: EdgeInsets.all(0),
        itemBuilder: (context, index)
        {
          return HistoryItem(
            history: Provider.of<AppData>(context, listen: false)?.tripHistoryDataList[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(thickness: 3.0, height: 3.0,),
        itemCount: Provider.of<AppData>(context, listen: false).tripHistoryDataList.length,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
      ),

    );
  }
}
