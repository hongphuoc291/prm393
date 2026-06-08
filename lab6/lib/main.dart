import 'package:flutter/material.dart';

void main() {
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenreScreen(),
    );
  }
}

class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = "";
  String selectedSort = "A-Z";

  List<String> genres = [
    "Action",
    "Drama",
    "Comedy",
    "Romance",
  ];

  Set<String> selectedGenres = {};

  List<Movie> allMovies = [
    Movie(
      title: "Extraction",
      year: 2010,
      genres: ["Action"],
      posterUrl:
      "https://i.ytimg.com/vi/bkU1TUcXCoo/maxresdefault.jpg",
      rating: 8.8,
    ),
    Movie(
      title: "Parasite",
      year: 1997,
      genres: ["Drama"],
      posterUrl:
      "https://cdn-images.vtv.vn/2020/2/11/83987388101582674814606251523077355432574976o-15814118908991136106039-crop-1581412065708879814238-crop-1581412111510402727286.jpg",
      rating: 7.9,
    ),
    Movie(
      title: "Titanic",
      year: 2019,
      genres: ["Romance"],
      posterUrl:
      "https://cdn2.tuoitre.vn/thumb_w/1200/tto/i/s626/2016/03/01/leonardo-dicaprio-kate-winslet-titanic-1456778576.jpg",
      rating: 8.5,
    ),
    Movie(
      title: "Home Alone",
      year: 2009,
      genres: ["Comedy"],
      posterUrl:
      "https://i.ytimg.com/vi/MxEw3elSJ8M/maxresdefault.jpg",
      rating: 7.7,
    ),
    Movie(
      title: "Little Miss Sunshine",
      year: 2014,
      genres: ["Drama", "Comedy"],
      posterUrl:
      "https://images.mubicdn.net/images/film/1778/cache-31138-1745490321/image-w1280.jpg",
      rating: 8.7,
    ),
    Movie(
      title: "La La Land",
      year: 2016,
      genres: ["Drama", "Comedy", "Romance"],
      posterUrl:
      "https://tintuc-divineshop.cdn.vccloud.vn/wp-content/uploads/2022/03/review-phim-la-la-land-cau-chuyen-cua-nhung-nguoi-tre-mong-mo_623807c17f8eb.jpeg",
      rating: 8.7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Movie> visibleMovies =
    allMovies.where((movie) {
      bool matchSearch = movie.title
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      bool matchGenre =
          selectedGenres.isEmpty ||
              movie.genres.any(
                    (genre) =>
                    selectedGenres.contains(genre),
              );

      return matchSearch && matchGenre;
    }).toList();

    if (selectedSort == "A-Z") {
      visibleMovies.sort(
            (a, b) => a.title.compareTo(b.title),
      );
    } else if (selectedSort == "Z-A") {
      visibleMovies.sort(
            (a, b) => b.title.compareTo(a.title),
      );
    } else if (selectedSort == "Year") {
      visibleMovies.sort(
            (a, b) => b.year.compareTo(a.year),
      );
    } else if (selectedSort == "Rating") {
      visibleMovies.sort(
            (a, b) => b.rating.compareTo(a.rating),
      );
    }

    return Scaffold(
    body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              const Text(
                "Find a Movie",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius:
                  BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText:
                    "Search movie...",
                    prefixIcon:
                    Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Genres",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: genres.map((genre) {
                  bool selected =
                  selectedGenres.contains(
                      genre);

                  return FilterChip(
                    label: Text(genre),
                    selected: selected,
                    onSelected: (value) {
                      setState(() {
                        if (selected) {
                          selectedGenres
                              .remove(genre);
                        } else {
                          selectedGenres
                              .add(genre);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  const Text(
                    "Sort: ",
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  DropdownButton<String>(value: selectedSort, items: const [
                      DropdownMenuItem(
                        value: "A-Z",
                        child: Text("A-Z"),
                      ),
                      DropdownMenuItem(
                        value: "Z-A",
                        child: Text("Z-A"),
                      ),
                      DropdownMenuItem(
                        value: "Year",
                        child: Text("Year"),
                      ),
                      DropdownMenuItem(
                        value: "Rating",
                        child: Text("Rating"),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedSort = value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Expanded(
                child: LayoutBuilder(
                  builder:
                      (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      return ListView.builder(
                        itemCount:
                        visibleMovies.length,
                        itemBuilder: (context, index) {
                          return MovieCard(
                            movie: visibleMovies[index],
                          );
                        },
                      );
                    }

                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children:
                      visibleMovies.map((movie) => MovieCard(movie: movie,),).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double imageHeight =
          constraints.maxWidth < 300
              ? 130
              : 200;

          return Padding(
            padding:
            const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Image.network(
                  movie.posterUrl,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                const SizedBox(height: 10),

                Text(
                  movie.title,
                  style:
                  const TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                Text("Year: ${movie.year}",),
                Text("Rating: ${movie.rating}",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}