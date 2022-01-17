import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:unimatch/models/Dislike.dart';
import 'package:unimatch/models/Like.dart';
import 'package:unimatch/models/User.dart';
import 'package:unimatch/models/UserPhoto.dart';
import 'package:unimatch/pages/Register.dart';
import 'package:unimatch/services/DislikeService.dart';
import 'package:unimatch/services/LikeService.dart';
import 'package:unimatch/services/UserPhotoService.dart';
import 'package:unimatch/utilities/functions.dart';
import 'package:unimatch/utilities/texts.dart';
import 'package:unimatch/widgets/HomePage/HomeProgress.dart';
import 'package:unimatch/widgets/HomePage/Match.dart';
import 'package:unimatch/services/UserService.dart';
import 'package:unimatch/widgets/HomePage/MatchEngineHome.dart';
import 'package:unimatch/widgets/HomePage/MyAppBar.dart';
import 'package:unimatch/widgets/HomePage/MyBottomAppBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  User? registered;
  int id = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: TitleText),
      body: FutureBuilder<dynamic>(
        future: SessionManager().get('id'),
        builder: (context, snapshotId) {
          if (snapshotId.hasData) {
            return FutureBuilder<List<Dislike>>(
                future: getAllDislikeByDisikesId(id: snapshotId.data),
                builder: (context, snapshotDislike) {
                  if (snapshotDislike.hasData) {
                    return FutureBuilder<List<Like>>(
                        future: getAllLikeByLikesId(id: snapshotId.data),
                        builder: (context, snapshotLike) {
                          if (snapshotLike.hasData) {
                            return FutureBuilder<List<User>>(
                                future: getAllUserById(id: snapshotId.data),
                                builder: (context, registerdUser) {
                                  if (registerdUser.hasData) {
                                    registered = registerdUser.data!.first;
                                    return FutureBuilder<List<User>>(
                                        future: getAllUser(),
                                        builder: (context, snapshotUser) {
                                          if (snapshotUser.hasData) {
                                            return FutureBuilder<
                                                    List<UserPhoto>>(
                                                future: getAllUserPhoto(),
                                                builder:
                                                    (context, snapshotPhotos) {
                                                  if (snapshotPhotos.hasData) {
                                                    return MatchEngineMethod(
                                                        registered!,
                                                        snapshotUser,
                                                        snapshotPhotos,
                                                        snapshotLike,
                                                        snapshotDislike,
                                                        id);
                                                  } else if (snapshotPhotos
                                                      .hasError) {
                                                    return Center(
                                                      child: Text(snapshotPhotos
                                                          .error
                                                          .toString()),
                                                    );
                                                  } else {
                                                    return HomeProgress(
                                                      text: PhotosLoading,
                                                      color: Colors.blue,
                                                    );
                                                  }
                                                });
                                          } else if (snapshotUser.hasError) {
                                            return Center(
                                              child: Text(snapshotUser.error
                                                  .toString()),
                                            );
                                          } else {
                                            return HomeProgress(
                                              text: AllUserLoading,
                                              color: Colors.blue,
                                            );
                                          }
                                        });
                                  } else {
                                    return HomeProgress(
                                      text: RegisteredUserLoading,
                                      color: Colors.blue,
                                    );
                                  }
                                });
                          } else {
                            return HomeProgress(
                              text: AllLikesLoading,
                              color: Colors.blue,
                            );
                          }
                        });
                  } else {
                    return HomeProgress(
                      text: AllDislikeLoading,
                      color: Colors.blue,
                    );
                  }
                });
          } else {
            return HomeProgress(
              text: SessionLoading,
              color: Colors.blue,
            );
          }
        },
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 1),
    );
  }
}
