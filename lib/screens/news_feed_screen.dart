import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/blocs/news_bloc.dart';

import '../repositories/news_repository.dart';
import '../services/news_service.dart';





class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  NewsFeedScreenState createState() => NewsFeedScreenState();
}

class NewsFeedScreenState extends State<NewsFeedScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<NewsBloc>().add(LoadMoreNewsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
         builder: (context, state) {
           if (state is NewsLoadingState) {
             return const Center(child: CircularProgressIndicator());
           } else if (state is NewsLoadedState) {
             return RefreshIndicator(
               onRefresh: _refresh,
               child: ListView.builder(
                 controller: _scrollController,
                 itemCount: state.articles.length,
                 itemBuilder: (context, index) {
                   return Column(
                     children: [
                       ListTile(
                         title: Text(state.articles[index].title??"Title not available",style: TextStyle(fontWeight: FontWeight.w500),),
                         subtitle: Text(state.articles[index].description??state.articles[index].content??""),
                       ),
                       Divider(height: 1,)
                     ],
                   );
                 },
               ),
             );
           } else if (state is NewsErrorState) {
             return Center(child: Text(state.error));
           } else {
             return const Center(child: Text('No news articles'));
           }
         },
       ),



    );
  }

  Future<void> _refresh() async {
    // Simulate a network call or some async operation
    BlocProvider.of<NewsBloc>(context).add(RefreshNewsEvent());
  }
}