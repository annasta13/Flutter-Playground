# Flutter Playground

This is my flutter project.

## Preview

| Movie List                                                                                                                                  | Movie Detail                                                                                                                                  |
|---------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| <img src="https://raw.githubusercontent.com/annasta13/Flutter-Playground/refs/heads/main/screenshot/movie_list_screenshot.webp" width=200/> | <img src="https://raw.githubusercontent.com/annasta13/Flutter-Playground/refs/heads/main/screenshot/movie_detail_screenshot.webp" width=200/> |

## Getting Started

- Generate json parser of the DTO model `dart run build_runner build`
- For flutter doctor stuck, refer to [Stackoverflow][2] discussion.

## Run Options

To run with real data from [The Movie Database (TMDB)][1], Replace `apiKey` in
`lib/src/core/string_constant.dart` with your API KEY from [TMDB][1]. Get the API Key

## Learning Sources

- https://medium.com/@yamen.abd98/clean-architecture-in-flutter-mvvm-bloc-dio-79b1615530e1
- https://pub.dev/packages/http_interceptor
- https://medium.com/@ashishpimpre/how-to-fetch-data-from-an-api-and-display-it-in-listview-in-flutter-770863f85959
- https://pub.dev/packages/get_it

## API Source

- [TMDB][1]
- [Postman][3]

[1]: https://developer.themoviedb.org/docs/getting-started

[2]: https://stackoverflow.com/questions/54191643/flutter-doctor-hangs-on-start-no-output

[3]: https://red-spaceship-233089.postman.co/workspace/Annas~992b98de-bb7f-4891-a668-10621a7c5533/collection/15371733-5dace831-3433-4df8-92d3-eafb558afd38?action=share&source=copy-link&creator=15371733&active-environment=eeb3bdba-8386-488b-9e30-94a5eeb08097
