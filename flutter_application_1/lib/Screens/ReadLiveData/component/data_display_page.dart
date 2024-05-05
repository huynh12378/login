// File: lib/data_display_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async'; // Import để sử dụng StreamSubscription

class DataDisplayPage extends StatefulWidget {
  const DataDisplayPage({Key? key}) : super(key: key);
  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {
  final databaseRef =
      FirebaseDatabase.instance.ref(); // Tham chiếu đến cơ sở dữ liệu
  String _data = "Đang tải dữ liệu..."; // Giữ dữ liệu để hiển thị
  late StreamSubscription<DatabaseEvent>
      _dataSubscription; // Để theo dõi sự kiện dữ liệu thay đổi

  @override
  void initState() {
    super.initState();
    _subscribeToDataChanges(); // Lắng nghe sự thay đổi dữ liệu ngay khi widget được tạo
  }

  void _subscribeToDataChanges() {
    // Lắng nghe sự kiện thay đổi dữ liệu từ node 'ReadLiveData/coolant_temp'
    _dataSubscription = databaseRef
        .child('ReadLiveData/coolant_temp')
        .onValue
        .listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        final data =
            event.snapshot.value.toString(); // Chuyển đổi dữ liệu thành chuỗi
        setState(() {
          _data = data; // Cập nhật dữ liệu trên UI
        });
      } else {
        setState(() {
          _data = "Không có dữ liệu";
        });
      }
    }, onError: (error) {
      // Xử lý lỗi
      setState(() {
        _data = "Lỗi khi tải dữ liệu";
      });
    });
  }

  @override
  void dispose() {
    _dataSubscription.cancel(); // Hủy bỏ subscription khi widget bị dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiển Thị Dữ Liệu'),
      ),
      body: Center(
        child: Text(_data), // Hiển thị dữ liệu hoặc thông báo tương ứng
      ),
    );
  }
}
