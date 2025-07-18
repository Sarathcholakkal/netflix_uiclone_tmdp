// import 'package:flutter/material.dart';
// import 'package:netflix_uiclone/models/hot_news_model.dart';
// import 'package:netflix_uiclone/screen/movie_details_screen/movie_detailed_screen.dart';
// import 'package:netflix_uiclone/services/api_services.dart';

// class HotNewsScreen extends StatefulWidget {
//   const HotNewsScreen({super.key});

//   @override
//   State<HotNewsScreen> createState() => _HotNewsScreenState();
// }

// class _HotNewsScreenState extends State<HotNewsScreen> {
//   final ApiServices apiServices = ApiServices();
//   late Future<HotNews?> hotTrending;
//   void initState() {
//     hotTrending = apiServices.fetchHotNews();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Hot News'),
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//       ),
//       body: FutureBuilder(
//         future: hotTrending,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error:${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final movies = snapshot.data!.results;
//             return ListView.builder(
//               itemCount: movies.length,
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 final movie = movies[index];
//                 String first_air_date =
//                     movie.firstAirDate?.day.toString() ?? "";
//                 String releaseDay = movie.releaseDate?.day.toString() ?? "";
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               MovieDetailedScreen(movieId: movie.id),
//                         ),
//                       );
//                     },
//                     child: Row(
//                       children: [
//                         Expanded(flex: 3, child: Column()),
//                         Expanded(
//                           flex: 7,
//                           child: Column(
//                             children: [
//                               Text(
//                                 movie.releaseDate == null
//                                     ? first_air_date
//                                     : releaseDay,
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(child: Text('Problem to fecth data'));
//           }
//         },
//       ),
//     );
//   }
// }
