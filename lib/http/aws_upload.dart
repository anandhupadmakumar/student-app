import 'dart:io';

import 'package:aws_s3_upload/aws_s3_upload.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';

import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AwsUpload {
  static uploadToAws(FilePickerResult result, int documentId) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getInt('trinity_student_id') ?? '';
    var s;
    FormData formData = FormData();

    try {
      print('in try ');
      s = result.files.first.path;
      print('in try');
      formData = FormData.fromMap({
        "myFile": await MultipartFile.fromFile(s!,
            filename: basename(result.files.first.name)
            //show only filename from path
            ),
      });
      print('end');

      print('aws dta ${formData}');
    } catch (e) {
      // scaffoldMessenger.showSnackBar(SnackBar(
      //   content: Text(e.toString()),
      //   backgroundColor: Color.fromARGB(255, 18, 19, 18),
      // ));
      try {
        s = result.files.first.path;
        formData = FormData.fromMap({
          "myFile": await MultipartFile.fromBytes(s!,
              filename: basename(result!.files.first.name)),
        });
      } catch (ee) {
        print(ee);
      }
    }

    final data = await AwsS3.uploadFile(
        accessKey: " AKIAX37YDYI4ACBOVVMU",
        secretKey: "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",
        file: File(s),
        bucket: "ufsnabeelphotoalbum",
        region: "us-east-2",
        key: 'trinity/student/$userId/$documentId',
        metadata: {"test": "test"} // optional
        );

    print('aws dta $data');
    return data;
  }

  static Future<FormData?> uploadFile(FilePickerResult result) async {
    print('start');

    var s;
    FormData formData = FormData();

    try {
      print('in try');
      s = result.files.first.path;
      print('in try');
      formData = FormData.fromMap({
        "myFile": await MultipartFile.fromFile(s!,
            filename: basename(result.files.first.name)
            //show only filename from path
            ),
      });
      print('end');

      print('aws dta ${formData.files}');
      return formData;
    } catch (e) {
      // scaffoldMessenger.showSnackBar(SnackBar(
      //   content: Text(e.toString()),
      //   backgroundColor: Color.fromARGB(255, 18, 19, 18),
      // ));
      try {
        s = result!.files.first.bytes;
        formData = FormData.fromMap({
          "myFile": await MultipartFile.fromBytes(s!,
              filename: basename(result!.files.first.name)),
        });
        return formData;
      } catch (ee) {
        print(ee);
      }
    }
    return formData;
  }
}
