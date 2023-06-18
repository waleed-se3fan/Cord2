import 'package:cord_2/app/home/home_cubit/home_cubit.dart';
import 'package:cord_2/app/home/home_cubit/home_states.dart';
import 'package:cord_2/app/home/presentation/widgets/home_appbar.dart';
import 'package:cord_2/core/components/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/styles/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';

class ClonedVoiceScreen extends StatelessWidget {
  const ClonedVoiceScreen();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return FutureBuilder(
              future: cubit.getSensorData(),
              builder: (c, s) {
                return Scaffold(
                  appBar: const HomeAppBar(),
                  body: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 120),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const Text(
                            'Upload an audio recording of at least 30 seconds',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            child: InkWell(
                              onTap: () async {
                                // AudioPicker.pickAudio();
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) {
                                  print(
                                    "No file selected",
                                  );
                                } else {
                                  print(result.files.single.name);
                                }
                              },
                              child: DottedBorder(
                                dashPattern: [5, 5],
                                radius: Radius.circular(100),
                                color: AppColors.kLightPurple,
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset('assets/images/upload.png'),
                                      Text(
                                        'Select from files',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 40),
                            child: GradientButton(
                                height: 45.h,
                                title: 'Upload',
                                onPressed: () {}),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

// final recorder = FlutterSoundRecorder();
// List<double> samples = [];
// var recordingDataController = StreamController<Food>();
// late StreamSubscription _recordingSubscription;
// Future record() async {
//   _recordingSubscription =
//       recordingDataController.stream.listen((buffer) {
//     if (buffer is FoodData) {
//       samples.add(double.parse(buffer.data!.toString()));
//       debugPrint('samples: $samples');
//     }
//   });
//   await recorder.startRecorder(toFile: 'audio',sampleRate: 16000);
// }

// Future stop() async {
//   _recordingSubscription.cancel();
//   await recorder.stopRecorder();
// }

// @override
// void initState() {
//   initRecorder();
//   super.initState();
// }

//   @override
// void dispose() {
//   _recordingSubscription.cancel();
//   recorder.stopRecorder();
//   super.dispose();
// }

// Future initRecorder() async {
//   final status = await Permission.microphone.request();
//   if (status != PermissionStatus.granted) {
//     throw RecordingPermissionException('Microphone permission not granted');
//   }
//   await recorder.openRecorder();
// }
