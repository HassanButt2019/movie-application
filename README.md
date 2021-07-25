# movie_app

## How to Run
1. Create an account at [TheMovieDB](https://www.themoviedb.org/).
2. Then get your API key.
3. Clone the repo
   ```sh
   git clone https://github.com/HassanButt2019/movie-application.git
   ```
4. Install all the packages by typing
   ```sh
   flutter pub get
   ```
5. Navigate to **lib/src/services/movie_service.dart** and paste your API key to the baseUrl variable
   ```dart
   String baseUrl = "https://api.themoviedb.org/3/movie/popular?api_key=your-Key3&language=en-US&page=1";
   ```
6. Run the App
