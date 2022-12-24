import 'package:flutter/material.dart';

class MoviesList extends StatelessWidget {

  final List movieList;
  final String title;
  final List<NetworkImage> posterList;
  const MoviesList({required this.movieList, required this.title, required this.posterList, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 20),),
        ),
        const SizedBox(height: 5,),
        SizedBox(
          height: 260,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: GlowingOverscrollIndicator(
              axisDirection: AxisDirection.right,
              color: Colors.pink.shade900,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink[900],
                            image: DecorationImage(image: posterList[index],)
                          ),
                          height: 180,
                          width: 120,
                        ),
                        Container(
                          width: 120,
                          padding: const EdgeInsets.all(6),
                          child: Center(
                            child: Text(
                              movieList[index],
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.clip,
                                
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}