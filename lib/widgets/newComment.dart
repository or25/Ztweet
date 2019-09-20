import 'package:flutter/material.dart';
// import 'package:flutter_assignment/models/transaction.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // final Function myFunc;
  List<String> mylist;
  List<String> allComments;
  NewTransaction(this.mylist,this.allComments);

  @override
  _NewTransactionState createState() => _NewTransactionState(mylist,allComments);
}

class _NewTransactionState extends State<NewTransaction> {
  List<String> mylist;
  List<String> allComments;
  _NewTransactionState(this.mylist,this.allComments);
  final amountController = TextEditingController();
  final titleController = TextEditingController();
  final baseController = TextEditingController();
  DateTime _pickedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    double enteredAmount;
    try {
      enteredAmount = double.parse(amountController.text);
    } on Exception {
      return;
    }

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _pickedDate == null || enteredAmount>=6) {
      return;
    }
    
    // widget.myFunc(
    //   title: enteredTitle,
    //   amount: enteredAmount,
    //   mydate: _pickedDate
    // );s

    allComments==null? allComments=[enteredTitle]: allComments.add(enteredTitle);
    print(allComments);
    mylist.add(enteredTitle);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
       initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()).then((pickedDate){
            if(pickedDate==null)
            {
              return;
            }
          setState(() {
            _pickedDate = pickedDate;
          });
            print(pickedDate);
        });
       
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Card(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "דרג 1-5 "),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            TextField(
              decoration: InputDecoration(labelText: "הכנס טקסט"),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "בסיס"),
              controller: baseController,
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Flexible(fit:FlexFit.tight ,child: _pickedDate == null ? Text( 'Selected Date: ${DateFormat.yMd().format(DateTime.now())}'):Text( 'Selected Date: ${DateFormat.yMd().format(_pickedDate)}')),
                  FlatButton(
                    child: Text("select date"),
                    textColor: Colors.blue,
                    onPressed: 
                      _presentDatePicker
                    ,
                  )
                ],
              ),
            ),
            FlatButton(
              child: Text("הוסף תגובה"),
              textColor: Colors.green,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
