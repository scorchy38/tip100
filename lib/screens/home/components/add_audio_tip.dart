import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound_system/flutter_sound_system.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

// class RecordAudio extends StatefulWidget {
//   String? name;
//   RecordAudio({Key? key, this.name}) : super(key: key);
//
//   @override
//   _RecordAudioState createState() => _RecordAudioState();
// }
//
// String globalPath = "";
//
// class _RecordAudioState extends State<RecordAudio> {
//   final soundRecorderAndPlayer = SoundRecorderAndPlayer();
//   bool isRecording = false, isPlaying = false, isRecordingAvailable = false;
//   String playStop = 'Play Recording';
//   @override
//   void initState() {
//     super.initState();
//     soundRecorderAndPlayer.init('jhgkjhgkhkjgjh');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Sound System'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 if (!isRecording && !isPlaying) {
//                   print('Nonu: Recording Started.');
//                   soundRecorderAndPlayer._startRecording(widget.name!);
//                   setState(() {
//                     isRecording = true;
//                     isRecordingAvailable = false;
//                   });
//                 }
//               },
//               style: ButtonStyle(
//                 backgroundColor: isRecording || isPlaying
//                     ? MaterialStateProperty.all<Color>(Colors.blueGrey)
//                     : MaterialStateProperty.all<Color>(Colors.green),
//                 padding: MaterialStateProperty.all<EdgeInsets>(
//                     const EdgeInsets.all(10)),
//               ),
//               child: const Text(
//                 'Start Recording',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 11.0, bottom: 11.0),
//               child: TextButton(
//                 onPressed: () async {
//                   if (isRecording) {
//                     await soundRecorderAndPlayer._stopRecording(context);
//                     Navigator.pop(context);
//                     print('Nonu: Recording Done.  Hello');
//                     setState(() {
//                       isRecording = false;
//                       isRecordingAvailable = true;
//                     });
//                   }
//                 },
//                 style: ButtonStyle(
//                   backgroundColor: isRecording
//                       ? MaterialStateProperty.all<Color>(Colors.green)
//                       : MaterialStateProperty.all<Color>(Colors.blueGrey),
//                   padding: MaterialStateProperty.all<EdgeInsets>(
//                       const EdgeInsets.all(10)),
//                 ),
//                 child: const Text(
//                   'Stop Recording',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18.0,
//                   ),
//                 ),
//               ),
//             ),
//             // TextButton(
//             //   onPressed: () {
//             //     if (isRecordingAvailable && !isRecording) {
//             //       soundRecorderAndPlayer
//             //           .togglePlaying(soundRecorderAndPlayer._filePath);
//             //       if (isPlaying) {
//             //         print('Nonu: Playing Recording Stopped.');
//             //         setState(() {
//             //           isPlaying = false;
//             //         });
//             //       } else {
//             //         print('Nonu: Playing Recording Started.');
//             //         setState(() {
//             //           isPlaying = true;
//             //         });
//             //       }
//             //     }
//             //   },
//             //   style: ButtonStyle(
//             //     backgroundColor: isRecordingAvailable && !isRecording
//             //         ? MaterialStateProperty.all<Color>(Colors.green)
//             //         : MaterialStateProperty.all<Color>(Colors.blueGrey),
//             //     padding: MaterialStateProperty.all<EdgeInsets>(
//             //         const EdgeInsets.all(10)),
//             //   ),
//             //   child: const Text(
//             //     'Play Recording',
//             //     style: TextStyle(
//             //       color: Colors.white,
//             //       fontWeight: FontWeight.bold,
//             //       fontSize: 18.0,
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SoundRecorderAndPlayer {
  bool _recording = false, _playing = false;
  String _filePath = '', _appUid = '';

  void init(String arg) async {
    _appUid = arg;

    askMicPermission();
  }

  void dispose() {}

  Future<void> askMicPermission() async {
    var statusMicrophone = await Permission.microphone.status;
    if (statusMicrophone != PermissionStatus.granted) {
      await Permission.microphone.request();
    }
    askStoragePermission();
  }

  Future<void> askStoragePermission() async {
    var statusStorage = await Permission.storage.status;
    if (statusStorage != PermissionStatus.granted) {
      await Permission.storage.request();
    }
  }

  bool isRecording() {
    return _recording;
  }

  Future<String> getFilePath(String ran) async {
    String fileName = 'Recording-Varta-' + _appUid + '-' + ran + '.aac';
    Directory directory;
    try {
      if (Platform.isAndroid) {
        directory = (await getExternalStorageDirectory())!;
        String newPath = "";
        List<String> paths = directory.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/" + folder;
          } else {
            break;
          }
        }
        newPath = newPath + "/Vaarta/Recordings";
        directory = Directory(newPath);
      } else {
        directory = await getTemporaryDirectory();
      }
      File saveFile = File(directory.path + "/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        return saveFile.path;
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future startRecording(String ran) async {
    _filePath = await ran;
    // globalPath = _filePath;
    if (_filePath != '') {
      try {
        print("Nonu: Recording started - " + _recording.toString());
        FlutterSoundSystem.startRecording(_filePath);
      } catch (e) {
        print("Nonu: Recording Error - " + _recording.toString());
      }
    } else {
      _stopPlaying();
      print("Nonu: _filePath empty - " + _recording.toString());
    }
  }

  Future stopRecording() async {
    try {
      print("Stopped");
      await FlutterSoundSystem.stopRecording();
    } catch (e) {
      print("Nonu: Stop Recording Error - " + e.toString());
    }
  }

  Future<String> toggleRecording(BuildContext context, String ran) async {
    if (!_recording) {
      _recording = true;
      _filePath = '';
      if (await Permission.storage.status == PermissionStatus.granted) {
        await startRecording("");
      } else {
        await Permission.storage.request();
      }
      return '';
    } else {
      _recording = false;
      await stopRecording();
      print("File Path = $_filePath");
      return _filePath;
    }
  }

  bool isPlaying() {
    return _playing;
  }

  void _startPlaying(String fileString) {
    print(fileString);
    FlutterSoundSystem.playMedia(fileString);
  }

  void _stopPlaying() {
    FlutterSoundSystem.stopMedia();
  }

  Future<bool> togglePlaying(String fileString) async {
    if (_playing) {
      _startPlaying(fileString);
      return true;
    } else {
      _stopPlaying();
      return false;
    }
  }
}
