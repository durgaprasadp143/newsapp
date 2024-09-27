import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/blocs/news_bloc.dart';
import 'package:newsapp/data/cache.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/repositories/news_repository.dart';
import 'package:newsapp/screens/news_feed_screen.dart';
import 'package:newsapp/services/news_service.dart';

main() async {
  await Hive.initFlutter();
 Hive.registerAdapter(NewsArticleAdapter());


  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<NewsBloc>(
        create: (context) => NewsBloc(NewsService(NewsRepository()))..add(FetchNewsEvent()),
        child:  const NewsFeedScreen(),
      ),




    );
  }
}
