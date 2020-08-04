import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:myFindMovies/service/content_handle.dart';
import 'package:myFindMovies/model/MovieList.dart';
import 'package:myFindMovies/model/SerieList.dart';

class MockClient extends Mock implements http.Client {}

const String baseURL = "api.themoviedb.org";
const String baseSearch = "http://www.omdbapi.com/?apikey=";
const String key = "c1abb65895a3fdceff4cfaa0d2dbdfc2";
const String TMDB_API_BASE_URL = "https://api.themoviedb.org/3";

main() {
  group('get top 10 series', () {
    test('returns a list with top 10 series with just 1 movie', () async {
      final client = MockClient();

      final content = ContentHandler();

      content.https = client;

      when(client.get("$TMDB_API_BASE_URL/tv/popular?api_key=$key")).thenAnswer(
          (_) async => http.Response(
              """{"page": 1, "total_results": 10000,"total_pages": 500, "results":[ { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    }]}""", 200));

      var _result = await content.getSerieList();

      expect(_result, isA<List<SerieList>>());
      expect(_result.length, 1);
    });

    test('returns a list with top 10 series with 10 series', () async {
      final client = MockClient();

      final content = ContentHandler();

      content.https = client;

      when(client.get("$TMDB_API_BASE_URL/tv/popular?api_key=$key")).thenAnswer(
          (_) async => http.Response(
              """{"page": 1, "total_results": 10000,"total_pages": 500, "results":[ { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    },
    { "original_name": "The Umbrella Academy",
              "genre_ids": [
        35,
        18,
        10759,
        10765
      ],
       "name": "The Umbrella Academy",
       "popularity": 210.186,
         "origin_country": [
        "US"
      ],
       "vote_count": 705,
       "first_air_date": "2019-02-15",
        "backdrop_path": "/qJxzjUjCpTPvDHldNnlbRC4OqEh.jpg",
        "original_language": "en",
         "id": 75006,
          "vote_average": 8.2,
           "overview": "A dysfunctional family of superheroes comes together to solve the mystery of their father's death, the threat of the apocalypse and more.",
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg"
    }
    ]}""", 200));

      var _result = await content.getSerieList();

      expect(_result, isA<List<SerieList>>());
      expect(_result.length, 10);
    });
  });
  group('get top 10 movies', () {
    test('returns a list with top 10 movies with just 1 movie', () async {
      final client = MockClient();

      final content = ContentHandler();

      content.https = client;

      when(client.get("$TMDB_API_BASE_URL/movie/popular?api_key=$key"))
          .thenAnswer((_) async => http.Response(
              """{"page": 1, "total_results": 10000,"total_pages": 500, "results":[ {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    }]}""", 200));

      var _result = await content.getMovieList();

      expect(_result, isA<List<MovieList>>());
      expect(_result.length, 1);
    });

    test('returns a list with top 10 series with 10 movies', () async {
      final client = MockClient();

      final content = ContentHandler();

      content.https = client;

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get("$TMDB_API_BASE_URL/movie/popular?api_key=$key"))
          .thenAnswer((_) async => http.Response(
              """{"page": 1, "total_results": 10000,"total_pages": 500, "results":[ {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "Marvel",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
    {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    },
        {"popularity": 211.123,"vote_count": 2692, "video": false,
      "poster_path": "/mb7wQv0adK3kjOUr9n93mANHhPJ.jpg",
      "id": 583083,
      "adult": false,
      "backdrop_path": "/wO5QSWZPBT71gMLvrRex0bVc0V9.jpg",
      "original_language": "en",
      "original_title": "The Kissing Booth 2",
      "genre_ids": [
        35,
        10749
      ],
      "title": "The Kissing Booth 2",
      "vote_average": 8.2,
      "overview": "With college decisions looming, Elle juggles her long-distance romance with Noah, changing relationship with bestie Lee and feelings for a new classmate.",
      "release_date": "2020-07-24"
    }
    ]}""", 200));

      var _result = await content.getMovieList();

      expect(_result, isA<List<MovieList>>());
      expect(_result.length, 10);
    });
  });
}
